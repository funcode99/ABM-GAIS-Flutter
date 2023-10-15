import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/activity_model.dart';
import 'package:gais/data/model/master/city/city_model.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormActivityActualizationTripController extends  BaseController
    with MasterDataMixin {
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat saveFormat = DateFormat("yyyy-MM-dd");

  final dateController = TextEditingController();
  final activitiesController = TextEditingController();

  final enableButton = false.obs;

  final activityModel = Rxn<ActivityModel>();
  final activityDate = Rxn<DateTime>();

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
    if(activityModel.value != null){
      activityDate.value = activityModel.value?.actDate?.toDate(originFormat: "yyyy-MM-dd");

      dateController.text = dateFormat.format(activityDate.value!) ?? "";
      activitiesController.text = activityModel.value?.activities ?? "";
    }
  }

  ActivityModel? saveButton(){
    ActivityModel? result;
    if(activityModel.value != null){
       result = activityModel.value?.copyWith(
          activities: activitiesController.text,
          actDate: saveFormat.format(activityDate.value!),
      );
    }else{
      result = ActivityModel(
        activities: activitiesController.text,
        actDate: saveFormat.format(activityDate.value!),
        deletable: true,
        key: "${activityDate.value?.microsecondsSinceEpoch}-${DateTime.now().millisecondsSinceEpoch}"
      );
    }

    return result;
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

}