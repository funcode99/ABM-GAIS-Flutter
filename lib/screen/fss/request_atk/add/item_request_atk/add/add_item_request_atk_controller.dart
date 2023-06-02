import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/warehouse_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class AddItemRequestATKController extends BaseController with MasterDataMixin{
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final enableButton = false.obs;

  final requestATKDetailModel = Rxn<RequestATKDetailModel>();

  final listWarehouse = <WarehouseModel>[].obs;
  final listItem = <ManagementItemATKModel>[].obs;
  final selectedWarehouse = WarehouseModel().obs;
  final selectedItem = Rxn<ManagementItemATKModel>();
  final emptyItem = ManagementItemATKModel(id: null, itemName: "Item");

  bool initEdit = false;

  @override
  void onInit() {
  /*  companyController.text = "Auto Fill Company";
    itemController.text = "";
    brandController.text = "";
    quantityController.text = "";
    uomController.text = "";
    siteController.text = "Auto Fill Site";
    warehousController.text = "";
    remarksController.text = "";*/


    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    String idSite = await storage.readString(StorageCore.siteID);

    final warehouses = await getListWarehouseBySiteId(idSite.toInt());
    listWarehouse(warehouses);
    selectedWarehouse(listWarehouse.first);

    if(requestATKDetailModel.value !=null){
      initEdit = true;

      if(requestATKDetailModel.value?.idWarehouse!=null){
        onChangeSelectedWarehouse("${requestATKDetailModel.value?.idWarehouse}");
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
        if(requestATKDetailModel.value !=null){
          //init if in edit
          if(requestATKDetailModel.value?.idItem!=null){
            onChangeSelectedItemId("${requestATKDetailModel.value?.idItem}");
          }
          quantityController.text = "${requestATKDetailModel.value?.qty}";
          remarksController.text = requestATKDetailModel.value?.remarks ?? "";
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
  }

  void onChangeSelectedWarehouse(String id) {
    final selected = listWarehouse.firstWhere((item) => item.id == id.toInt());
    selectedWarehouse(selected);

    _getItemData();
  }

  RequestATKDetailModel getAddedItem() {
    if(requestATKDetailModel.value!=null){
      requestATKDetailModel.value?.remarks = remarksController.text;
      requestATKDetailModel.value?.itemName = selectedItem.value?.itemName;
      requestATKDetailModel.value?.codeItem = selectedItem.value?.codeItem;
      requestATKDetailModel.value?.warehouseName = selectedItem.value?.warehouseName;
      requestATKDetailModel.value?.uomName = uomController.text;
      requestATKDetailModel.value?.brandName = brandController.text;
      requestATKDetailModel.value?.qty = quantityController.text.toInt();
      requestATKDetailModel.value?.idWarehouse = selectedWarehouse.value.id;
      requestATKDetailModel.value?.idItem = selectedItem.value?.id;
      return requestATKDetailModel.value!;
    }else{
      return RequestATKDetailModel(
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
