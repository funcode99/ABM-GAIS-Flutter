import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class ApprovalCashAdvanceTravelListController extends BaseController{

  final TextEditingController dateRange = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateTime? startDate;
  DateTime? endDate;

  @override
  void onInit() {
    super.onInit();
    dateRange.text = "10/03/2023 - 17/03/2023";
  }
}