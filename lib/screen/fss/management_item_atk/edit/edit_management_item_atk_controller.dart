import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/detail_stock_management_item_atk_model.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/master/brand/brand_model.dart';
import 'package:gais/data/model/master/uom/uom_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/repository/management_item_atk/management_item_atk_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class EditManagementItemATKController extends BaseController with MasterDataMixin{
  final TextEditingController idController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController alertQuantityController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  late TextEditingController autocompleteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final enableButton = false.obs;
  final listWarehouse = <WarehouseModel>[].obs;
  final listBrand = <BrandModel>[].obs;
  final listUOM = <UomModel>[].obs;
  final selectedWarehouse = WarehouseModel().obs;
  final selectedBrand = BrandModel().obs;
  final selectedUOM = UomModel().obs;
  final managementItemATK = ManagementItemATKModel().obs;

  final listSelectedWarehouse = <WarehouseModel>[].obs;
  final showWarehouseError = false.obs;

  final ManagementItemATKRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    String companyName = await storage.readString(StorageCore.companyName);
    String idCompany = await storage.readString(StorageCore.companyID);
    String siteName = await storage.readString(StorageCore.siteName);
    String idSite = await storage.readString(StorageCore.siteID);

    companyController.text = companyName;
    siteController.text = siteName;
    idController.text = managementItemATK.value.codeItem ?? "";
    itemController.text = managementItemATK.value.itemName ?? "";
    alertQuantityController.text = managementItemATK.value.alertQty.toString();
    remarksController.text = managementItemATK.value.remarks ?? "";

    final warehouses = await getListWarehouseBySiteId(idSite.toInt());
    listWarehouse(warehouses);
    // onChangeSelectedWarehouse(managementItemATK.value.idWarehouse.toString());

    /*final brands = await getListBrandByCompanyId(idCompany.toInt());
    listBrand(brands);
    onChangeSelectedBrand(managementItemATK.value.idBrand.toString());*/

    final uoms = await getListUOM();
    listUOM(uoms);
    onChangeSelectedUOM(managementItemATK.value.idUom.toString());

    listSelectedWarehouse.clear();
    List<DetailStockManagementItemATKModel>? listDetailManagementItemATK = managementItemATK.value.arrayWarehouse?.map((e) => DetailStockManagementItemATKModel.fromJson(e)).toList() ?? [];
    for(DetailStockManagementItemATKModel item in listDetailManagementItemATK){
      final selectedWarehouse = listWarehouse.firstWhere((element) => element.id.toString() == item.idWarehouse.toString());
      listSelectedWarehouse.add(selectedWarehouse);
    }
  }

  void onChangeSelectedWarehouse(String id) {
    final selected = listWarehouse.firstWhere((item) => item.id == id.toInt());
    selectedWarehouse(selected);
  }

  void onChangeSelectedBrand(String id) {
    final selected = listBrand.firstWhere((item) => item.id == id.toInt());
    selectedBrand(selected);
  }

  void onChangeSelectedUOM(String id) {
    final selected = listUOM.firstWhere((item) => item.id == id.toInt());
    selectedUOM(selected);
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void generateRandom() {
    int random = DateTime.now().microsecondsSinceEpoch;
    String randomString = "$random".substring(random.toString().length - 9);

    idController.text = randomString;
  }

  void updateData() async {
    String idCompany = await storage.readString(StorageCore.companyID);
    String idSite = await storage.readString(StorageCore.siteID);
    ManagementItemATKModel managementItemATKModel = ManagementItemATKModel(
      codeItem: idController.text,
      itemName: itemController.text,
      // idBrand: selectedBrand.value.id,
      idUom: selectedUOM.value.id,
      alertQty: alertQuantityController.text.toInt(),
      idCompany: idCompany.toInt(),
      idSite: idSite.toInt(),
      arrayWarehouse: listSelectedWarehouse.map((element) => element.id).toList(),
      remarks: remarksController.text,
    );

    isLoadingHitApi(true);
    final result = await _repository.updateData(managementItemATKModel, managementItemATK.value.id!);
    result.fold(
            (l) {
              isLoadingHitApi(false);
              Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
            },
            (cashAdvanceModel) {
              isLoadingHitApi(false);
              //update list
          Get.back(result: true);
        });
  }

  void deleteWarehouseItem(WarehouseModel item) {
    listSelectedWarehouse.removeWhere((element) => item.id == element.id);
  }

  List<WarehouseModel> getWarehouseByKeyword(String keyword) {
    final list = listWarehouse
        .where((warehouse) => warehouse.warehouseName!
        .toLowerCase()
        .contains(keyword.toLowerCase())
    )
        .toList();

    list.removeWhere((element) => listSelectedWarehouse.contains(element));

    return list;
  }

}
