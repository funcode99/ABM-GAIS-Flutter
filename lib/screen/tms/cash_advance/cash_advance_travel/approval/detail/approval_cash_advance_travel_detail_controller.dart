import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class ApprovalCashAdvanceTravelDetailController extends BaseController{
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  @override
  void onInit() {
    createdDateController.text = "23/02/23";
    requestorController.text = "John Smith";
    referenceController.text = "TCA-ABM/1232/23.04";
    itemController.text = "Transport";
    frequencyController.text = "1";
    currencyController.text = "Rupiah";
    amountController.text = "150.000";
    totalController.text = "150.000";
    remarksController.text = "Remarks";
    super.onInit();
  }
}