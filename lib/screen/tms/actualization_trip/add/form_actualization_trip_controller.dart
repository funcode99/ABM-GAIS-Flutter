import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/activity_model.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/date_ext.dart';
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

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
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
      final activityModel = ActivityModel(
          actDate: saveFormat.format(item),
          deletable: false,
          activities: "",
          key: "${item.microsecondsSinceEpoch}-${DateTime.now().millisecondsSinceEpoch}"
      );

      listActivity.add(
        activityModel
      );
    }

  }

  void addActivity(ActivityModel result){
    //check if there is duplicate date
    bool idDuplicateFound = false;
    for (var element in listActivity) {
      if(element.actDate == result.actDate){
        idDuplicateFound = true;
        break;
      }
    }

    if(idDuplicateFound){
      Get.showSnackbar(CustomGetSnackBar(message: "Date already exists", backgroundColor: Colors.red));
    }else{
      listActivity.add(result);
    }
  }

  void updateActivity(ActivityModel result){
    //check if there is duplicate date
    bool idDuplicateFound = false;
    for (var element in listActivity) {
      if(element.key != result.key){
        if(element.actDate == result.actDate){
          idDuplicateFound = true;
          break;
        }
      }
    }

    if(idDuplicateFound){
      Get.showSnackbar(CustomGetSnackBar(message: "Date already exists", backgroundColor: Colors.red));
    }else{
      final index = listActivity.indexWhere((element) => element.key.toString() == result.key.toString());
      listActivity[index] = result;
    }
  }

  void deleteActivity(ActivityModel activityModel){
    listActivity.removeWhere((element) => element.key.toString() == activityModel.key.toString());
  }

  bool isActivitiesValid(){
    bool isValid = true;

    for (var element in listActivity) {
      if(element.activities == null || element.activities!.isEmpty){
        isValid = false;
        break;
      }
    }

    return isValid;
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }
}

