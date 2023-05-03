import 'package:flutter/cupertino.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class ApprovalRequestTripListController extends BaseController{
  final TextEditingController dateRange = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  String? purposeValue;
  DateTime? startDate;
  DateTime? endDate;
  bool showFilter = false;
  int currentPage = 1;

  @override
  void onInit() {
    super.onInit();
    dateRange.text = "10/03/2023 - 17/03/2023";
    currentPage = 1;
  }


}