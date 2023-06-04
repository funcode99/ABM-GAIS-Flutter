import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/stock_in/item_stock_in_atk_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class AddItemStockInATKController extends BaseController with MasterDataMixin{
  final TextEditingController companyController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final enableButton = false.obs;

  final stockInATKDetailModel = Rxn<StockInATKDetailModel>();

  final listWarehouse = <WarehouseModel>[].obs;
  final listItem = <ManagementItemATKModel>[].obs;
  final selectedWarehouse = WarehouseModel().obs;
  final selectedItem = Rxn<ManagementItemATKModel>();
  final emptyItem = ManagementItemATKModel(id: null, itemName: "Item");

  bool initEdit = false;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void initData()async{
    String idSite = await storage.readString(StorageCore.siteID);
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);
    companyController.text = companyName;
    siteController.text = siteName ?? "";

    final warehouses = await getListWarehouseBySiteId(idSite.toInt());
    listWarehouse(warehouses);
    selectedWarehouse(listWarehouse.first);

    if(stockInATKDetailModel.value !=null){
      initEdit = true;

      if(stockInATKDetailModel.value?.idWarehouse!=null){
        onChangeSelectedWarehouse("${stockInATKDetailModel.value?.idWarehouse}");
      }else{
        onChangeSelectedWarehouse(listWarehouse.first.id.toString());
      }
    }else{
      _getItemData();
    }
  }

  _getItemData()async{
    final items = await getListItemByWarehouseId(selectedWarehouse.value.id!);
    listItem(items);
    if(listItem.isNotEmpty){
      if(initEdit){
        if(stockInATKDetailModel.value !=null){
          //init if in edit
          if(stockInATKDetailModel.value?.idItem!=null){
            onChangeSelectedItemId("${stockInATKDetailModel.value?.idItem}");
          }
          quantityController.text = "${stockInATKDetailModel.value?.qty}";
          remarksController.text = stockInATKDetailModel.value?.remarks ?? "";
        }
        initEdit = false;
      }else{
        //if not in edit
        onChangeSelectedItemId(listItem.first.id.toString());
      }
    }else{
      listItem.add(emptyItem);
      Get.showSnackbar(CustomGetSnackBar(message: "Item tidak tersedia", backgroundColor: Colors.red));
      onChangeSelectedItemId("");
    }

    updateButton();

  }

  void onChangeSelectedItemId(String itemId) {
    ManagementItemATKModel? selected =
    listItem.firstWhereOrNull((item) => item.id.toString() == itemId);
    if (selected != null) {
      brandController.text = selected.brandName ?? "-";
      uomController.text = selected.uomName ?? "-";

      selectedItem(selected);
    }else{
      selectedItem(emptyItem);
    }
    quantityController.text = "";
    Future.delayed(const Duration(milliseconds: 100), ()=>updateButton());
  }

  void onChangeSelectedWarehouse(String id) {
    final selected = listWarehouse.firstWhere((item) => item.id == id.toInt());
    selectedWarehouse(selected);

    _getItemData();
  }

  StockInATKDetailModel getAddedItem() {
    if(stockInATKDetailModel.value!=null){
      stockInATKDetailModel.value?.remarks = remarksController.text;
      stockInATKDetailModel.value?.itemName = selectedItem.value?.itemName;
      stockInATKDetailModel.value?.codeItem = selectedItem.value?.codeItem;
      stockInATKDetailModel.value?.warehouseName = selectedItem.value?.warehouseName;
      stockInATKDetailModel.value?.uomName = uomController.text;
      stockInATKDetailModel.value?.brandName = brandController.text;
      stockInATKDetailModel.value?.qty = quantityController.text.toInt();
      stockInATKDetailModel.value?.idWarehouse = selectedWarehouse.value.id;
      stockInATKDetailModel.value?.idItem = selectedItem.value?.id;
      return stockInATKDetailModel.value!;
    }else{
      return StockInATKDetailModel(
        key: DateTime.now().toString(),
        idWarehouse: selectedWarehouse.value.id,
        idItem: selectedItem.value?.id,
        remarks: remarksController.text,
        qty: quantityController.text.toInt(),
        uomName: uomController.text,
        brandName : brandController.text,
        warehouseName : selectedWarehouse.value.warehouseName,
        itemName : selectedItem.value?.itemName,
        codeItem : selectedItem.value?.codeItem,
      );
    }
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

}
