import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/stock_in/item_stock_in_atk_model.dart';

class DetailStockInController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController rejectNoteController = TextEditingController();

  List<ItemStockInATKModel> listItem = <ItemStockInATKModel>[];

  @override
  void onInit() {
    super.onInit();

    createdDateController.text = "23/02/23";
    createdByController.text = "John Smith";
    rejectNoteController.text = "Remarks Example";

    listItem.add(ItemStockInATKModel(
        id: DateTime.now().toString(),
        company: "Company Name",
        site: "Company Site",
        brand: "Faber Castell",
        itemName: "Pen",
        warehouse: "Warehouse A",
        quantity: 10,
        uom: "pcs"));
  }
}
