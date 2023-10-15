import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/activity_model.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/request_trip/request_trip_model.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_travel_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormActualizationTripController extends  BaseController
with MasterDataMixin {
  final formKey = GlobalKey<FormState>();
  final purposeController = TextEditingController();
  final notesController = TextEditingController();

  final enableButton = false.obs;

  final listTripInfo = <TripInfoModel>[].obs;
  final listActivity = <ActivityModel>[].obs;
  final listIdRequestTrip = <dynamic>[].obs;

  DateFormat saveFormat = DateFormat("yyyy-MM-dd");


  final NewActualizationTripRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();

    initData();
  }

  initData()async{
    listTripInfo.clear();
    final tripInfoResult = await _repository.getTripInfo(ids: listIdRequestTrip);
    tripInfoResult.fold(
        (l) => null, 
        (r) => listTripInfo.addAll(r)
    );

    //initiate activities
    listActivity.clear();
    final tempDates = <DateTime>{};
    for(TripInfoModel tripInfoModel in listTripInfo){
      String departDateString = tripInfoModel.dateDepartTransportation ?? "";
      String returnDateString = tripInfoModel.dateReturnTransportation ?? "";
      DateTime? departDate;
      DateTime? returnDate;
      if(departDateString.isNotEmpty){
        departDate = departDateString.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
      }

      if(returnDateString.isNotEmpty){
        returnDate = returnDateString.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
      }

      List<DateTime> listDate = [];
      if(departDate != null){
        if(returnDate != null){
          listDate = departDate.getDaysInBetween(returnDate);
        }else{
          listDate = departDate.getDaysInBetween(departDate);
        }
      }else if(returnDate != null){
        listDate = returnDate.getDaysInBetween(returnDate);
      }

      tempDates.addAll(listDate.map((e) => e).toList());
    }

    for (var item in tempDates) {
      listActivity.add(
        ActivityModel(
          actDate: saveFormat.format(item),
          deletable: false,
          activities: "",
          idAct: item.microsecondsSinceEpoch
        )
      );
    }

  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }
}

