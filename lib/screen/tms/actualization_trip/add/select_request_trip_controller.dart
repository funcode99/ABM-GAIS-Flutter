import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/request_trip/request_trip_model.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_travel_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class SelectRequestTripController extends BaseController {
  final listRequestTrip = <RequestTripModel>[].obs;
  final listIDSelectedRequestTrip = <dynamic>[].obs;

  final NewActualizationTripRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    listRequestTrip.clear();
    final result = await _repository.getRequestTrip();

    result.fold((l) => null, (r) {
      listRequestTrip.value = r;
    });
  }

  void addSelectedRequestTrip(dynamic id){
    listIDSelectedRequestTrip.add(id);
  }

  void removeSelectedRequestTrip(dynamic id){
    listIDSelectedRequestTrip.removeWhere((element) => element == id);
  }


}
