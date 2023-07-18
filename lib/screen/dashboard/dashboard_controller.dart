import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/dashboard/dashboard_model.dart';
import 'package:gais/data/model/master/status_doc/status_doc_model.dart';
import 'package:gais/data/model/meeting_room_used.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/model/supplies_out_model.dart';
import 'package:gais/data/model/trip_purpose_model.dart';
import 'package:gais/data/repository/dashboard/dashboard_repository.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DashboardController extends BaseController with MasterDataMixin {
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final selectedMonth = "".obs;
  final selectedYear = "".obs;
  int daysIn = 32;

  final DashboardRepository _repository = Get.find();

  late List listdates = [];
  late List listyears = [];

  final dashboardData = DashboardModel().obs;

  List listMonths = [
    {"id": "", "value": "Month"},
    {"id": 1, "value": "January"},
    {"id": 2, "value": "February"},
    {"id": 3, "value": "March"},
    {"id": 4, "value": "April"},
    {"id": 5, "value": "May"},
    {"id": 6, "value": "June"},
    {"id": 7, "value": "July"},
    {"id": 8, "value": "August"},
    {"id": 9, "value": "September"},
    {"id": 10, "value": "October"},
    {"id": 11, "value": "November"},
    {"id": 12, "value": "December"}
  ];

  List<Color> tripColors = [
    successColor,
    warningColor,
    errorColor
  ];

  List<Color> listColors = [
    const Color(0xffFFCC06),
    const Color(0xff6B95D2),
    const Color(0xffC4E87D),
    const Color(0xffE0F1E3),
    const Color(0xff5B9BD5),
    const Color(0xff66AD2D),
    const Color(0xffED7D31),
  ];

  @override
  void onInit() {
    super.onInit();

    initData();
    getData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void initData(){
    listyears = Iterable<int>.generate((DateTime.now().year) + 1)
        .skip(1900)
        .toList();
    listyears = listyears.reversed
        .toList();

    selectedYear.value = listyears.first.toString();
  }

  void getData() async {
    final result = await _repository.getData(data: {
      "month": selectedMonth.value,
      "year": selectedYear.value,
    });

    result.fold((l) {
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (r) {
      dashboardData.value = r;
      setValue();
    });
  }

  setValue(){


  }
}
