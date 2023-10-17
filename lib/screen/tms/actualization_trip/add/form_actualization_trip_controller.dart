import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/activity_model.dart';
import 'package:gais/data/model/actualization_trip/actualization_trip_model.dart';
import 'package:gais/data/model/actualization_trip/actualization_trip_model.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/master/zone/zone_model.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/tms/actualization_trip/detail/actualization_trip_detail_screen.dart';
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

  final tlkRate = 0.obs;

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat saveFormat = DateFormat("yyyy-MM-dd");

  final selectedItem = ActualizationTripModel().obs;

  final NewActualizationTripRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();

    initData();
    getTLKRate();
  }

  initData()async{
    listTripInfo.clear();
    final tripInfoResult = await _repository.getTripInfo(ids: listIdRequestTrip);
    tripInfoResult.fold(
        (l) => null,
        (r) => listTripInfo.addAll(r.map((e) => e.copyWith(key: "${e.hashCode}")))
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

  int getTotalTLK(){
    int result = 0;
    for (var element in listTripInfo) {
      DateTime? departureDate = element.dateDeparture?.toDate(originFormat: "yyyy-MM-dd");
      DateTime? arrivalDate = element.dateArrival?.toDate(originFormat: "yyyy-MM-dd");

      int totalDays = 0;
      if(departureDate != null && arrivalDate != null){
        totalDays = arrivalDate.difference(departureDate).inDays;
        totalDays += 1;
      }

      result += (totalDays * element.tlkRate).toInt();

    }

    return result;
  }

  void getTLKRate() async{
    String jobBandName = await storage.readString(StorageCore.jobBandName);
    String jobBandID = await storage.readString(StorageCore.jobBandID);
    final result = await _repository.getTLKRate({
      "band_job_name" : jobBandName,
      "id_job_band" : jobBandID
    });

    result.fold(
          (l) => Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
          (r) {
            return tlkRate(r);
          }
    );

  }

  String getTitleTripInfo(TripInfoModel tripInfoModel){
    String result = "";
    if(tripInfoModel.dateDeparture != null){
      String departureDate = tripInfoModel.dateDeparture?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ?? "";
      result += departureDate;
      if(tripInfoModel.dateArrival != null){
        String arrivalDate = tripInfoModel.dateArrival?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ?? "";
        result += "-$arrivalDate";
      }
    }

    if(tripInfoModel.nameCityFrom!=null && tripInfoModel.nameCityFrom!.isNotEmpty){
      if(result.isNotEmpty){
        result += ", ${tripInfoModel.nameCityFrom}";
      }else{
        result += "${tripInfoModel.nameCityFrom}";
      }
      if(tripInfoModel.nameCityTo!=null && tripInfoModel.nameCityTo!.isNotEmpty){
        result += "-${tripInfoModel.nameCityTo}";
      }
    }

    return result;
  }

  String getTitleTransportation(TripInfoModel tripInfoModel){
    String result = "";
    if(tripInfoModel.dateDepartTransportation != null){
      String departureDate = tripInfoModel.dateDepartTransportation?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ?? "";
      result += departureDate;
      if(tripInfoModel.dateReturnTransportation != null){
        String arrivalDate = tripInfoModel.dateReturnTransportation?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ?? "";
        result += "-$arrivalDate";
      }
    }
    return result;
  }

  void addTripInfo(TripInfoModel result){
    listTripInfo.add(result);
  }

  void updateTripInfo(TripInfoModel result)async{
    //get zone by city
    ZoneModel? zone = await getZoneByCityId(result.idCityTo);
    if(zone == null){
      Get.showSnackbar(CustomGetSnackBar(message: "Zone not found for this city", backgroundColor: Colors.red));
    }else{
      result.idZona = zone.idZona;
      result.tlkRate = tlkRate.value;

      final index = listTripInfo.indexWhere((element) => element.key.toString() == result.key.toString());
      listTripInfo[index] = result;
    }
  }

  void deleteTripInfo(TripInfoModel tripInfoModel){
    listTripInfo.removeWhere((element) => element.key.toString() == tripInfoModel.key.toString());
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

    listActivity.sort((a, b) => a.actDate!.compareTo(b.actDate!));
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

    listActivity.sort((a, b) => a.actDate!.compareTo(b.actDate!));

  }

  void deleteActivity(ActivityModel activityModel){
    listActivity.removeWhere((element) => element.key.toString() == activityModel.key.toString());

    listActivity.sort((a, b) => a.actDate!.compareTo(b.actDate!));
  }

  bool isTripInfoValid(){
    bool isValid = true;

    for (var element in listTripInfo) {
      if(element.dateDeparture == null || element.dateDeparture!.isEmpty){
        isValid = false;
        break;
      }
    }

    return isValid;
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

  void saveData() async {
    isLoadingHitApi(true);

    ActualizationTripModel model = ActualizationTripModel(
        idRequestTrip: listIdRequestTrip.map((element) => element.toString()).toList(),
        arrayTrip: listTripInfo,
        arrayActivities: listActivity,
        purpose: purposeController.text,
        notes: notesController.text,
        idEmployee: await storage.readString(StorageCore.userID),
        totalTlk: getTotalTLK()
    );

    final result = await _repository.saveData(model);

    result.fold(
        (l) {
          isLoadingHitApi(false);
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
        },
        (model) {
          isLoadingHitApi(false);
          selectedItem(model);
          submitHeader();
        });
  }

  void submitHeader() async {
    isLoadingHitApi(true);
    final result = await _repository.submitData(selectedItem.value.id!);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (cashAdvanceModel) {
      isLoadingHitApi(false);
      Get.off(() => const ActualizationTripDetailScreen(),
          arguments: {"item": selectedItem.value});
    });
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }
}

