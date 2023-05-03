import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class AddItemCashAdvanceNonTravelController extends BaseController{
  final TextEditingController itemCenterController = TextEditingController();
  final TextEditingController costCenterController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    itemCenterController.text = "";
    costCenterController.text = "";
    nominalController.text = "";
    remarksController.text = "";
    super.onInit();
  }
}