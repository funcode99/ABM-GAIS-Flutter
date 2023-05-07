import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';

class TempModel {
  final int quantity;
  final String itemName;
  final String brandName;
  final String uom;
  final int id;

  TempModel(
      {required this.id,
      required this.quantity,
      required this.itemName,
      required this.brandName,
      required this.uom});
}

class WarehouseModel {
  final String id;
  final String name;

  WarehouseModel({required this.id, required this.name});
}

class AddRequestATKController extends BaseController {
  final TextEditingController itemCenterController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController warehousController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final List<TempModel> listItem = [];
  final List<WarehouseModel> listWarehouse = [];
  late TempModel selectedItem;
  late WarehouseModel selectedWarehouse;

  @override
  void onInit() {
    itemCenterController.text = "";
    brandController.text = "";
    quantityController.text = "";
    uomController.text = "";
    siteController.text = "";
    warehousController.text = "";
    remarksController.text = "";

    for (int i = 0; i < 10; i++) {
      listItem.add(TempModel(
          id: i,
          quantity: 10 + i,
          itemName: "Item Name ${i+1}",
          brandName: "Brand Name ${i+1}",
          uom: "pcs"));
      listWarehouse.add(
        WarehouseModel(id: i.toString(), name: "Warehouse $i")
      );
    }

    selectedItem = listItem.first;
    selectedWarehouse = listWarehouse.first;
    onChangeSelectedItemId(selectedItem.id.toString());

    super.onInit();
  }

  void onChangeSelectedItemId(String itemId) {
    TempModel? selected =
        listItem.firstWhereOrNull((item) => item.id.toString() == itemId);
    if (selected != null) {
      brandController.text = selected.brandName;
      uomController.text = selected.uom;

      selectedItem = selected;
      update();
    }
  }

  void onChangeSelectedWarehouse(String id) {
    selectedWarehouse = listWarehouse.firstWhere((item) => item.id == id);
  }
}
