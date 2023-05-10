import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';

class RequestATKDetailController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController rejectNoteController = TextEditingController();

  List<ItemRequestATKModel> listItem = <ItemRequestATKModel>[];

  @override
  void onInit() {
    super.onInit();

    createdDateController.text = "23/02/23";
    createdByController.text = "John Smith";
    rejectNoteController.text = "Remarks Example";

    listItem.add(ItemRequestATKModel(
        id: DateTime.now().toString(),
        company: "Company Name",
        site: "Company Site",
        brand: "Faber Castell",
        item: "Pen",
        warehouse: "Warehouse A",
        quantity: 10,
        uom: "pcs"));
  }
}
