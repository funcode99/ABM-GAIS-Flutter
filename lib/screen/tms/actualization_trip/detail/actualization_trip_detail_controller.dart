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

    setValue();
  }

  void setValue() {
    createdByController.text = selectedItem.value.employeeName ?? "-";
    createdDateController.text = selectedItem.value.createdAt?.toDateFormat(
            originFormat: "yyyy-MM-dd HH:mm:ss",
            targetFormat: "dd/MM/yyyy HH:mm:ss") ??
        "-";

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
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (cashAdvanceModel) {
      isLoadingHitApi(false);
      detailHeader();
    });
  }

  void getTripInfo() async {
    final result = await _tripRepository
        .getTripInfoByActualizationId(selectedItem.value.id);

    result.fold((l) => null, (r) {
      listTripInfo.value = r;
      listTripInfo.refresh();
    });
  }

  void getActivity() async {
    final result = await _activityRepository
        .getActivityByActualizationId(selectedItem.value.id);

    result.fold((l) => null, (r) {
      listActivity.value = r;
      listActivity.sort((a, b) => a.actDate!.compareTo(b.actDate!));
      listActivity.refresh();
    });
  }

  void updateEnableButton() {
    enableButton(formKey.currentState!.validate());
  }

  void updateOnEdit() {
    onEdit(!onEdit.value);
  }

  String getTitleTripInfo(TripInfoModel tripInfoModel) {
    String result = "";
    if (tripInfoModel.dateDeparture != null) {
      String departureDate = tripInfoModel.dateDeparture?.toDateFormat(
              originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
          "";
      result += departureDate;
      if (tripInfoModel.dateArrival != null) {
        String arrivalDate = tripInfoModel.dateArrival?.toDateFormat(
                originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
            "";
        result += "-$arrivalDate";
      }
    } else if (tripInfoModel.dateDepartTransportation != null) {
      String departureDate = tripInfoModel.dateDepartTransportation
              ?.toDateFormat(
                  originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
          "";
      result += departureDate;
      if (tripInfoModel.dateReturnTransportation != null) {
        String arrivalDate = tripInfoModel.dateReturnTransportation
                ?.toDateFormat(
                    originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
            "";
        result += "-$arrivalDate";
      }
    }

    if (tripInfoModel.nameCityFrom != null &&
        tripInfoModel.nameCityFrom!.isNotEmpty) {
      if (result.isNotEmpty) {
        result += ", ${tripInfoModel.nameCityFrom}";
      } else {
        result += "${tripInfoModel.nameCityFrom}";
      }
      if (tripInfoModel.nameCityTo != null &&
          tripInfoModel.nameCityTo!.isNotEmpty) {
        result += "-${tripInfoModel.nameCityTo}";
      }
    } else if (tripInfoModel.origin != null &&
        tripInfoModel.origin!.isNotEmpty) {
      if (result.isNotEmpty) {
        result += ", ${tripInfoModel.origin}";
      } else {
        result += "${tripInfoModel.origin}";
      }
      if (tripInfoModel.destination != null &&
          tripInfoModel.destination!.isNotEmpty) {
        result += "-${tripInfoModel.destination}";
      }
    }

    return result;
  }

  String getTitleTransportation(TripInfoModel tripInfoModel) {
    String result = "";
    if (tripInfoModel.dateDepartTransportation != null) {
      String departureDate = tripInfoModel.dateDepartTransportation
              ?.toDateFormat(
                  originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
          "";
      result += departureDate;
      if (tripInfoModel.dateReturnTransportation != null) {
        String arrivalDate = tripInfoModel.dateReturnTransportation
                ?.toDateFormat(
                    originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
            "";
        result += "-$arrivalDate";
      }
    }
    return result;
  }

  void addTripInfo(TripInfoModel result) {
    listTripInfo.add(result);
  }

  void updateTripInfo(TripInfoModel tripInfoModel) async {
    isLoadingHitApi(true);

    final result =
        await _tripRepository.updateData(tripInfoModel, tripInfoModel.id);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (model) {
      isLoadingHitApi(false);
      //update list
      getTripInfo();
    });
  }

  void deleteTripInfo(TripInfoModel tripInfoModel) {
    listTripInfo.removeWhere(
        (element) => element.key.toString() == tripInfoModel.key.toString());
  }

  void addActivity(ActivityModel activityModel) async{
    //check if there is duplicate date
    bool idDuplicateFound = false;
    for (var element in listActivity) {
      if (element.actDate!.contains(activityModel.actDate!)) {
        idDuplicateFound = true;
        break;
      }
    }

    if (idDuplicateFound) {
      Get.showSnackbar(CustomGetSnackBar(
          message: "Date already exists", backgroundColor: Colors.red));
    } else {
      isLoadingHitApi(true);

      activityModel.idAct = selectedItem.value.id;

      final result = await _activityRepository.saveData(activityModel);
      result.fold((l) {
        isLoadingHitApi(false);
        Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
      }, (model) {
        isLoadingHitApi(false);
        //update list
        getActivity();
      });
    }
  }

  void updateActivity(ActivityModel activityModel) async {
    //check if there is duplicate date
    bool idDuplicateFound = false;
    for (var element in listActivity) {
      if (element.id != activityModel.id) {
        if (element.actDate!.contains(activityModel.actDate!)) {
          idDuplicateFound = true;
          break;
        }
      }
    }

    if (idDuplicateFound) {
      Get.showSnackbar(CustomGetSnackBar(
          message: "Date already exists", backgroundColor: Colors.red));
    } else {
      isLoadingHitApi(true);

      final result =
          await _activityRepository.updateData(activityModel, activityModel.id);
      result.fold((l) {
        isLoadingHitApi(false);
        Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
      }, (model) {
        isLoadingHitApi(false);
        //update list
        getActivity();
      });
    }
  }

  void deleteActivity(ActivityModel activityModel) async{
    isLoadingHitApi(true);

    final result = await _activityRepository.deleteData(activityModel.id);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (model) {
      isLoadingHitApi(false);
      //update list
      getActivity();
    });
  }

  void getApprovalLog() async {
    final result = await _repository.getApprovalLog(selectedItem.value.id);

    result.fold((l) => null, (r) {
      listLogApproval.value = r;
      listLogApproval.refresh();
    });
  }
}
