import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/data/model/warehouse_model.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class AtkItemModel {
  final int quantity;
  final String itemName;
  final String brandName;
  final String uom;
  final int id;

  AtkItemModel({required this.id,
    required this.quantity,
    required this.itemName,
    required this.brandName,
    required this.uom});
}

class AddItemRequestATKController extends BaseController {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController warehousController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final List<AtkItemModel> listItem = [];
  final List<WarehouseModel> listWarehouse = [];
  late AtkItemModel selectedItem;
  late WarehouseModel selectedWarehouse;

  @override
  void onInit() {
    companyController.text = "Auto Fill Company";
    itemController.text = "";
    brandController.text = "";
    quantityController.text = "";
    uomController.text = "";
    siteController.text = "Auto Fill Site";
    warehousController.text = "";
    remarksController.text = "";

    for (int i = 0; i < 10; i++) {
      listItem.add(AtkItemModel(
          id: i,
          quantity: 10 + i,
          itemName: "Item Name ${i + 1}",
          brandName: "Brand Name ${i + 1}",
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
    AtkItemModel? selected =
    listItem.firstWhereOrNull((item) => item.id.toString() == itemId);
    if (selected != null) {
      brandController.text = selected.brandName;
      uomController.text = selected.uom;
      itemController.text = "${selected.id} - ${selected.itemName}";

      selectedItem = selected;
      update();
    }
  }

  void onChangeSelectedWarehouse(String id) {
    selectedWarehouse = listWarehouse.firstWhere((item) => item.id == id);
  }

  ItemRequestATKModel getAddedItem() {
    return ItemRequestATKModel(
        id: DateTime.now().toString(),
        company: companyController.text,
        site: siteController.text,
        brand: brandController.text,
        item: itemController.text,
        warehouse: warehousController.text,
        quantity: quantityController.text.toInt(),
        uom: companyController.text,
        remarks: remarksController.text
    );
  }
}
