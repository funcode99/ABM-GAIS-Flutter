import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class CheckScheduleController extends BaseController {
  List listOfDates = [];

  @override
  void onInit() {
    super.onInit();
    daysInMonth(DateTime(DateTime.now().month));
  }

  @override
  void dispose() {
    super.dispose();
    listOfDates = [];
    print(listOfDates.length ?? "jumlah tanggal");
  }

  int daysInMonth(DateTime date) {
    var firstDayThisMonth = new DateTime(date.year, date.month, date.day);
    var firstDayNextMonth = new DateTime(firstDayThisMonth.year,
        firstDayThisMonth.month + 1, firstDayThisMonth.day);
    listOfDates = new List<String>.generate(
        firstDayNextMonth.difference(firstDayThisMonth).inDays,
        (i) => "${DateFormat("MMM").format(DateTime.now())} ${i + 1}");
    return firstDayNextMonth.difference(firstDayThisMonth).inDays;
  }
}


