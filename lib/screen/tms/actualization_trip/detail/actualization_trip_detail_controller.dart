import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/activity_model.dart';
import 'package:gais/data/model/actualization_trip/actualization_trip_model.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/repository/actualization_trip/activity_repository.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:gais/data/repository/actualization_trip/trip_info_repository.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class ActualizationTripDetailController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final enableButton = false.obs;
  final onEdit = false.obs;

  final selectedItem = ActualizationTripModel().obs;

  final listDetail = <RequestATKDetailModel>[].obs;
  final listTripInfo = <TripInfoModel>[].obs;
  final listActivity = <ActivityModel>[].obs;

  final NewActualizationTripRepository _repository = Get.find();
  final TripInfoRepository _tripRepository = Get.find();
  final ActivityRepository _activityRepository = Get.find();

  final selectedTab = Rx<TabEnum>(TabEnum.detail);
  final listLogApproval = <ApprovalLogModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData() {
    detailHeader();
    getTripInfo();
    getActivity();

    getDetailData();
    setValue();
  }

  void setValue(){
    createdByController.text = selectedItem.value.employeeName ?? "-";
    createdDateController.text = selectedItem.value.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss") ?? "-";

    purposeController.text = selectedItem.value.purpose ?? "";
    notesController.text = selectedItem.value.notes ?? "";
  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      selectedItem(r);
      setValue();
      getApprovalLog();
    });
  }

  void submitHeader() async {
    isLoadingHitApi(true);
    final result = await _repository.submitData(selectedItem.value.id!);
    result.fold(
            (l) {
          isLoadingHitApi(false);
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
        },
            (cashAdvanceModel) {
          isLoadingHitApi(false);
          detailHeader();
        });
  }

  void getTripInfo() async{
    final result = await _tripRepository.getTripInfoByActualizationId(selectedItem.value.id);

    result.fold((l) => null, (r) {
      listTripInfo.value = r;
      listTripInfo.refresh();
    });
  }

  void getActivity() async{
    final result = await _activityRepository.getActivityByActualizationId(selectedItem.value.id);

    result.fold((l) => null, (r) {
      listActivity.value = r;
      listActivity.refresh();
    });
  }

  void getDetailData() async {
    /*final result = await _repository.getDataDetails(selectedItem.value.id!);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (r) {
          listDetail.value = r;
          listDetail.refresh();
        });*/
  }

  void updateEnableButton() {
    enableButton(formKey.currentState!.validate());
  }

  void updateOnEdit() {
    onEdit(!onEdit.value);
  }

  void addDetail(RequestATKDetailModel item) async {
    isLoadingHitApi(true);
    item.idAtkRequest = selectedItem.value.id;
    final result = await _repository.addDetail(item);
    result.fold(
            (l) {
          isLoadingHitApi(false);
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
        },
            (detailModel) {
          isLoadingHitApi(false);
          getDetailData();
        });
  }

  void deleteDetail(RequestATKDetailModel item) async {
    if (item.id != null) {
      isLoadingHitApi(true);
      final result = await _repository.deleteDetail(item.id!);
      result.fold(
              (l) {
            isLoadingHitApi(false);
            Get.showSnackbar(CustomGetSnackBar(
                message: l.message, backgroundColor: Colors.red));
          }, (model) {
        isLoadingHitApi(false);
        Get.showSnackbar(CustomGetSnackBar(
          message: "Success Delete Data".tr,
        ));
        //update state
        getDetailData();
      });
    } else {
      Get.showSnackbar(CustomGetSnackBar(
        message: "Success Delete Data".tr,
      ));

      listDetail.remove(item);
    }
  }

  void updateDetail(RequestATKDetailModel item) async {
    isLoadingHitApi(true);
    item.idAtkRequest = selectedItem.value.id;
    final result = await _repository.updateDetail(item, item.id!);
    result.fold(
            (l) {
          isLoadingHitApi(false);
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
        },
            (model) {
          isLoadingHitApi(false);
          getDetailData();
        });
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
    }else if(tripInfoModel.dateDepartTransportation != null){
      String departureDate = tripInfoModel.dateDepartTransportation?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ?? "";
      result += departureDate;
      if(tripInfoModel.dateReturnTransportation != null){
        String arrivalDate = tripInfoModel.dateReturnTransportation?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ?? "";
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
    }else if(tripInfoModel.origin!=null && tripInfoModel.origin!.isNotEmpty){
      if(result.isNotEmpty){
        result += ", ${tripInfoModel.origin}";
      }else{
        result += "${tripInfoModel.origin}";
      }
      if(tripInfoModel.destination!=null && tripInfoModel.destination!.isNotEmpty){
        result += "-${tripInfoModel.destination}";
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

  void updateTripInfo(TripInfoModel result){
    final index = listTripInfo.indexWhere((element) => element.key.toString() == result.key.toString());
    listTripInfo[index] = result;
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

  void getApprovalLog()async{
    final result = await _repository.getApprovalLog(selectedItem.value.id);

    result.fold((l) => null, (r) {
      listLogApproval.value = r;
      listLogApproval.refresh();
    });
  }
}
