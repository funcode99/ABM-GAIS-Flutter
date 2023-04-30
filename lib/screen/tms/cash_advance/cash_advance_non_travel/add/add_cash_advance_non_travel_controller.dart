import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class AddCashAdvanceNonTravelController extends BaseController{
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController costCenterController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  @override
  void onInit() {
    dateController.text = "23/02/23";
    eventController.text = "Event Name";
    costCenterController.text = "1233212332";
    nominalController.text = "100000";
    remarksController.text = "Remarks";
    super.onInit();
  }
}