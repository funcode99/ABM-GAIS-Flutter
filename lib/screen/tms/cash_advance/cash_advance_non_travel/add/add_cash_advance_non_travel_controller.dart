import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class AddCashAdvanceNonTravelController extends BaseController{
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController costCenterController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yy");

  @override
  void onInit() {
    dateController.text = "";
    eventController.text = "";
    costCenterController.text = "";
    nominalController.text = "";
    remarksController.text = "";
    super.onInit();
  }
}