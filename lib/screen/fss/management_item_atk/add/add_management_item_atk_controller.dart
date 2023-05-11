import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/warehouse_model.dart';
import 'package:get/get.dart';

class AddManagementItemATKController extends BaseController {
  final TextEditingController idController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController alertQuantityController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController warehousController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final enableButton = false.obs;
  final List<WarehouseModel> listWarehouse = [];
  final List<String> listBrand = [];
  final List<String> listUOM = [];
  late WarehouseModel selectedWarehouse;
  late String selectedBrang;
  late String selectedUOM;

  @override
  void onInit() {
    companyController.text = "Auto Fill Company";
    itemController.text = "";
    brandController.text = "";
    alertQuantityController.text = "";
    uomController.text = "";
    siteController.text = "Auto Fill Site";
    warehousController.text = "";
    remarksController.text = "";

    for (int i = 0; i < 10; i++) {
      listWarehouse.add(
          WarehouseModel(id: i.toString(), name: "Warehouse $i")
      );

      listBrand.add(
          "Brand $i"
      );

      listUOM.add(
          "UOM $i"
      );
    }

    selectedWarehouse = listWarehouse.first;
    selectedBrang = listBrand.first;
    selectedUOM = listUOM.first;

    super.onInit();
  }

  void onChangeSelectedWarehouse(String id) {
    selectedWarehouse = listWarehouse.firstWhere((item) => item.id == id);
  }

  void onChangeSelectedBrand(String brand) {
    selectedBrang = listBrand.firstWhere((item) => item == brand);
  }

  void onChangeSelectedUOM(String uom) {
    selectedUOM = listUOM.firstWhere((item) => item == uom);
  }

  void updateButton(){
    enableButton(formKey.currentState!.validate());
  }
}
