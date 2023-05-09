import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApprovalCashAdvanceNonTravelDetailController extends BaseController{
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yy");

  List<ItemCashAdvanceNonTravelModel> listItem = <ItemCashAdvanceNonTravelModel>[].obs;

  @override
  void onInit() {
    requestorController.text = "John Smith";
    dateController.text = "12/05/23";
    eventController.text = "Event Name";
    totalController.text = "250.000";

    listItem.add(
        ItemCashAdvanceNonTravelModel("1", "Item Satu", "123321", "12000", "Remarks")
    );
    super.onInit();
  }
}