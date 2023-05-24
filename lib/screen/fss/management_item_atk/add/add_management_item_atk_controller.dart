import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/master/brand/brand_model.dart';
import 'package:gais/data/model/master/uom/uom_model.dart';
import 'package:gais/data/model/warehouse_model.dart';
import 'package:gais/data/repository/management_item_atk/management_item_atk_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class AddManagementItemATKController extends BaseController {
  final TextEditingController idController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController alertQuantityController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final enableButton = false.obs;
  final List<WarehouseModel> listWarehouse = [];
  final List<BrandModel> listBrand = [];
  final List<UomModel> listUOM = [];
  late WarehouseModel selectedWarehouse;
  late BrandModel selectedBrand;
  late UomModel selectedUOM;

  final ManagementItemATKRepository _repository = Get.find();

  @override
  void onInit() {
    for (int i = 0; i < 10; i++) {
      listWarehouse.add(WarehouseModel(id: i.toString(), name: "Warehouse $i"));

      listBrand.add(BrandModel(id: i, brandName: "Brand Name ${i}"));

      listUOM.add(UomModel(id: i, uomName: "UOM Name ${i}"));
    }

    selectedWarehouse = listWarehouse.first;
    selectedBrand = listBrand.first;
    selectedUOM = listUOM.first;
    print("selectedBrand ${selectedBrand.toJson()}");

    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);

    companyController.text = companyName;
    siteController.text = siteName;
  }

  void onChangeSelectedWarehouse(String id) {
    selectedWarehouse = listWarehouse.firstWhere((item) => item.id == id);
  }

  void onChangeSelectedBrand(String id) {
    selectedBrand = listBrand.firstWhere((item) => item.id == id.toInt());
  }

  void onChangeSelectedUOM(String id) {
    selectedUOM = listUOM.firstWhere((item) => item.id == id.toInt());
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void generateRandom() {
    int random = DateTime.now().microsecondsSinceEpoch;
    String randomString = "$random".substring(random.toString().length - 9);

    idController.text = randomString;
  }

  void saveData() async {
    String idCompany = await storage.readString(StorageCore.companyID);
    String idSite = await storage.readString(StorageCore.siteID);
    ManagementItemATKModel managementItemATKModel = ManagementItemATKModel(
      codeItem: idController.text,
      itemName: itemController.text,
      idBrand: selectedBrand.id,
      idUom: selectedUOM.id,
      alertQty: alertQuantityController.text.toInt(),
      currentStock: alertQuantityController.text.toInt(),
      idCompany: idCompany.toInt(),
      idSite: idSite.toInt(),
      idWarehouse: selectedWarehouse.id.toInt(),
      remarks: remarksController.text,
    );

    final result = await _repository.saveData(managementItemATKModel);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (cashAdvanceModel) {
      //update list
      Get.back(result: true);
    });
  }
}
