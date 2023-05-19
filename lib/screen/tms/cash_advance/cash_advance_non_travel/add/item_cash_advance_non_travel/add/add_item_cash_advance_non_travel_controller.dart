import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/util/ext/string_ext.dart';

class AddItemCashAdvanceNonTravelController extends BaseController {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController costCenterController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    itemNameController.text = "";
    costCenterController.text = "";
    nominalController.text = "";
    remarksController.text = "";
    super.onInit();
  }

  CashAdvanceDetailModel getAddedItem() {
    return CashAdvanceDetailModel(
        key: DateTime.now().toString(),
        costCenterName: costCenterController.text,
        nominal: nominalController.text.digitOnly(),
        remarks: remarksController.text,
        idCostCenter: 1,
        //TODO : change to dynamic one
        itemName: itemNameController.text);
  }
}
