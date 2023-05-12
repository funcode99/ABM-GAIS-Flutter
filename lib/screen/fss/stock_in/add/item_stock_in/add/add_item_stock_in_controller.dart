import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/stock_in/item_stock_in_atk_model.dart';
import 'package:gais/data/model/warehouse_model.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class AddItemStockInATKController extends BaseController {
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
  final List<WarehouseModel> listWarehouse = [];
  final List<String> listBrand = [];
  final List<String> listUOM = [];
  late WarehouseModel selectedWarehouse;
  late String selectedBrang;
  late String selectedUOM;

  @override
  void onInit() {
    companyController.text = "";
    itemController.text = "";
    brandController.text = "";
    quantityController.text = "";
    uomController.text = "";
    siteController.text = "";
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

  ItemStockInATKModel getAddedItem() {
    return ItemStockInATKModel(
        id: DateTime.now().toString(),
        company: companyController.text,
        site: siteController.text,
        brand: selectedBrang,
        itemName: itemController.text,
        warehouse: warehousController.text,
        quantity: quantityController.text.toInt(),
        uom: companyController.text,
        remarks: remarksController.text
    );
  }
}
