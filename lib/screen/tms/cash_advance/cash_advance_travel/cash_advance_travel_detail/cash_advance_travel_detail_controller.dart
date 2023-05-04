import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class CashAdvanceTravelDetailController extends BaseController{
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  @override
  void onInit() {
    createdDateController.text = "23/02/23";
    requestorController.text = "John Smith";
    referenceController.text = "TCA-ABM/1232/23.04";
    totalController.text = "250.000";
    super.onInit();
  }
}