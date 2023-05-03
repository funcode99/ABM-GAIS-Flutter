import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:get/get.dart';

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