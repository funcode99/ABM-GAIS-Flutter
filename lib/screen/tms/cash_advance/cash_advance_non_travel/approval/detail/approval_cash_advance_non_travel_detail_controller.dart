import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class ApprovalCashAdvanceNonTravelDetailController extends BaseController{
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController costCenterController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yy");

  @override
  void onInit() {
    requestorController.text = "John Smith";
    dateController.text = "12/05/23";
    eventController.text = "Event Name";
    costCenterController.text = "123321123";
    nominalController.text = "100.000";
    remarksController.text = "-";
    super.onInit();
  }
}