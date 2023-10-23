import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/master/city/city_model.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormApprovalActualizationTripController extends  BaseController {
  final formKey = GlobalKey<FormState>();

  final tlkRateController = TextEditingController();

  final tripInfoModel = Rxn<TripInfoModel>();

  final enableButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    if(tripInfoModel.value != null){
      String tlkRate = tripInfoModel.value?.tlkRate.toString() ?? "";

      tlkRateController.text = tlkRate.toInt().toCurrency() ?? "";

    }
  }

  TripInfoModel? saveButton(){
    TripInfoModel? result;

    result = tripInfoModel.value?.copyWith(
      tlkRate: tlkRateController.text.digitOnly(),
    );

    return result;
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

}