import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCashAdvanceNonTravelController extends BaseController{
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yy");

  List<ItemCashAdvanceNonTravelModel> listItem = <ItemCashAdvanceNonTravelModel>[];

  @override
  void onInit() {
    dateController.text = "";
    eventController.text = "";
    totalController.text = listItem.length.toString();
    super.onInit();
  }

  void addItem(ItemCashAdvanceNonTravelModel item){
    listItem.add(item);

    totalController.text = listItem.length.toString();
    update();
  }

}