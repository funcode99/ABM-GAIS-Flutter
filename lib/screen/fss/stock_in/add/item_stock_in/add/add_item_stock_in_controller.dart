import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
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
  // final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final enableButton = false.obs;
  List<TextEditingController> listQuantityController = [];

  // final stockInATKDetailModel = Rxn<StockInATKDetailModel>();
  final mapItem = {}.obs;

  final listStockInATKDetailModel = <StockInATKDetailModel>[].obs;

  // final listWarehouse = <WarehouseModel>[].obs;
  final listItem = <ManagementItemATKModel>[].obs;
  // final selectedWarehouse = WarehouseModel().obs;
  final selectedItem = Rxn<ManagementItemATKModel>();
  final emptyItem = ManagementItemATKModel(id: null, itemName: "Item", arrayWarehouse: []);

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

    /*final warehouses = await getListWarehouseBySiteId(idSite.toInt());
    listWarehouse(warehouses);
    selectedWarehouse(listWarehouse.first);*/

    if(mapItem.isNotEmpty){
      initEdit = true;
      /*if(stockInATKDetailModel.value?.idWarehouse!=null){
        onChangeSelectedWarehouse("${stockInATKDetailModel.value?.idWarehouse}");
      }else{
        onChangeSelectedWarehouse(listWarehouse.first.id.toString());
      }*/
    }

    _getItemData();

  }

  _getItemData()async{
    String idCompany = await storage.readString(StorageCore.companyID);
    String idSite = await storage.readString(StorageCore.siteID);

    // final items = await getListItemByWarehouseId(selectedWarehouse.value.id!);
    final items = await getListItem(companyId: idCompany, siteId: idSite);
    listItem(items);
    if(listItem.isNotEmpty){
      if(initEdit){
        if(mapItem.isNotEmpty){
          //init if in edit
          if(mapItem.containsKey("idItem")){
            onChangeSelectedItemId("${mapItem["idItem"]}");
          }
          // quantityController.text = "${stockInATKDetailModel.value?.qty}";
          // remarksController.text = stockInATKDetailModel.value?.remarks ?? "";
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
      // brandController.text = selected.brandName ?? "-";
      uomController.text = selected.uomName ?? "-";

      selectedItem(selected);
    }else{
      selectedItem(emptyItem);
    }
    getListStockInATKDetailModel();
    quantityController.text = "";
    Future.delayed(const Duration(milliseconds: 100), ()=>updateButton());
  }

  void getListStockInATKDetailModel(){
    listStockInATKDetailModel.clear();
    listQuantityController.clear();
    final newList = selectedItem.value?.arrayWarehouse?.map(
            (e){
              StockInATKDetailModel item = StockInATKDetailModel.fromJson(e);
              item.idItem = selectedItem.value?.id;
              item.idBrand = selectedItem.value?.idBrand;
              item.idUom = selectedItem.value?.idUom;
              item.uomName = selectedItem.value?.uomName;
              item.itemName = selectedItem.value?.itemName;

              //init text editing controller
              TextEditingController controller = TextEditingController();
              if(mapItem.isNotEmpty){
                //if on edit, then set text on text editing controller.
                //need to get the qty first
                List<StockInATKDetailModel> list = List<StockInATKDetailModel>.from(mapItem["listDetail"]);
                if(list.isNotEmpty){
                  StockInATKDetailModel? temp = list.firstWhereOrNull((element) => element.idWarehouse == item.idWarehouse);
                  item.qty = temp?.qty;
                  controller.text = "${item.qty ?? ""}";
                }
                //set remarks
                remarksController.text = list.first.remarks ?? '';
              }

              listQuantityController.add(controller);


              return item;
            }).toList() ?? [];
    mapItem.value = {};
    listStockInATKDetailModel.addAll(newList);
  }
  /*void onChangeSelectedWarehouse(String id) {
    final selected = listWarehouse.firstWhere((item) => item.id == id.toInt());
    selectedWarehouse(selected);

    _getItemData();
  }*/

/*  StockInATKDetailModel getAddedItem() {
    if(stockInATKDetailModel.value!=null){
      stockInATKDetailModel.value?.remarks = remarksController.text;
      stockInATKDetailModel.value?.itemName = selectedItem.value?.itemName;
      stockInATKDetailModel.value?.codeItem = selectedItem.value?.codeItem;
      stockInATKDetailModel.value?.warehouseName = selectedItem.value?.warehouseName;
      stockInATKDetailModel.value?.uomName = uomController.text;
      // stockInATKDetailModel.value?.brandName = brandController.text;
      stockInATKDetailModel.value?.qty = quantityController.text.toInt();
      // stockInATKDetailModel.value?.idWarehouse = selectedWarehouse.value.id;
      stockInATKDetailModel.value?.idItem = selectedItem.value?.id;
      // stockInATKDetailModel.value?.idBrand = selectedItem.value?.idBrand;
      stockInATKDetailModel.value?.idUom = selectedItem.value?.idUom;
      return stockInATKDetailModel.value!;
    }else{
      return StockInATKDetailModel(
        key: DateTime.now().toString(),
        // idWarehouse: selectedWarehouse.value.id,
        idItem: selectedItem.value?.id,
        remarks: remarksController.text,
        qty: quantityController.text.toInt(),
        uomName: uomController.text,
        // brandName : brandController.text,
        // warehouseName : selectedWarehouse.value.warehouseName,
        itemName : selectedItem.value?.itemName,
        codeItem : selectedItem.value?.codeItem,
        // idBrand : selectedItem.value?.idBrand,
        idUom : selectedItem.value?.idUom,
      );
    }
  }*/

  Map<String, dynamic>? getAddedItem() {
    final Map<String, dynamic> result = {};

    result.putIfAbsent("idItem", () => selectedItem.value?.id);
    result.putIfAbsent("itemName", () => selectedItem.value?.itemName);

    listStockInATKDetailModel.removeWhere((element) => element.qty == null || element.qty == 0);

    result.putIfAbsent("listDetail", () => listStockInATKDetailModel.map((element) {
      element.remarks = remarksController.text;
      return element;
    }).toList());

    if(listStockInATKDetailModel.isEmpty){
      return null;
    }

    return result;
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }


}
