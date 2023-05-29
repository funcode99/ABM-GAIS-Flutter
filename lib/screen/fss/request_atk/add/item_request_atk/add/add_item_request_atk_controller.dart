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
  final TextEditingController companyController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController warehousController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final enableButton = false.obs;


  final listWarehouse = <WarehouseModel>[].obs;
  final listItem = <ManagementItemATKModel>[].obs;
  final selectedWarehouse = WarehouseModel().obs;
  final selectedItem = Rxn<ManagementItemATKModel>();


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
    String idCompany = await storage.readString(StorageCore.companyID);

    final warehouses = await getListWarehouseByCompanyId(idCompany.toInt());
    listWarehouse(warehouses);
    selectedWarehouse(listWarehouse.first);

    _getItemData();
  }

  _getItemData()async{
    final items = await getListItemByWarehouseId(selectedWarehouse.value.id!);
    listItem(items);
    if(listItem.isNotEmpty){
      selectedItem(listItem.first);
    }else{
      Get.showSnackbar(CustomGetSnackBar(message: "Item tidak tersedia", backgroundColor: Colors.red));
      selectedItem.value = null;
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
    }
  }

  void onChangeSelectedWarehouse(String id) {
    final selected = listWarehouse.firstWhere((item) => item.id == id.toInt());
    selectedWarehouse(selected);

    _getItemData();
  }

  RequestATKDetailModel getAddedItem() {
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

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }
}
