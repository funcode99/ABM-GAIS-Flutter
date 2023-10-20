import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/activity_model.dart';
import 'package:gais/data/model/actualization_trip/actualization_trip_model.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/data/model/approval/approval_actualization_trip_model.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/repository/actualization_trip/activity_repository.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:gais/data/repository/actualization_trip/trip_info_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class ApprovalActualizationTripDetailController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController purposeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  final TextEditingController totalTLKController = TextEditingController();

  final onEdit = false.obs;

  final selectedItem = ApprovalActualizationTripModel().obs;
  final detailSelectedItem = ActualizationTripModel().obs;

  final approvalModel = Rxn<ApprovalModel>();
  final selectedTab = Rx<TabEnum>(TabEnum.detail);

  final listLogApproval = <ApprovalLogModel>[].obs;
  final listTripInfo = <TripInfoModel>[].obs;
  final listActivity = <ActivityModel>[].obs;

  final NewActualizationTripRepository _repository = Get.find();
  final TripInfoRepository _tripRepository = Get.find();
  final ActivityRepository _activityRepository = Get.find();

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData() {
    detailHeader();
    getTripInfo();
    getActivity();
  }

  void setValue() {
    createdDateController.text = detailSelectedItem.value.createdAt
            ?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss") ??
        "-";
    requestorController.text = detailSelectedItem.value.employeeName ?? "-";

    purposeController.text = detailSelectedItem.value.purpose ?? "-";
    notesController.text = detailSelectedItem.value.notes ?? "-";
    totalTLKController.text = detailSelectedItem.value.totalTlk?.toCurrency() ?? "-";
  }

  Future<void> getTripInfo() async {
    final result = await _tripRepository.getTripInfoByActualizationId(selectedItem.value.idDocument);

    result.fold((l) => null, (r) {
      listTripInfo.value = r;
      listTripInfo.refresh();
    });
  }

  void getActivity() async {
    final result = await _activityRepository
        .getActivityByActualizationId(selectedItem.value.idDocument);

    result.fold((l) => null, (r) {
      listActivity.value = r;
      listActivity.sort((a, b) => a.actDate!.compareTo(b.actDate!));
      listActivity.refresh();
    });
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

  int getSubTotalTLK(TripInfoModel tripInfoModel) {
    int result = 0;
    DateTime? departureDate = tripInfoModel.dateDeparture?.toDate(originFormat: "yyyy-MM-dd");
    DateTime? arrivalDate = tripInfoModel.dateArrival?.toDate(originFormat: "yyyy-MM-dd");

    int totalDays = 0;
    if(departureDate != null && arrivalDate != null){
      totalDays = arrivalDate.difference(departureDate).inDays;
      totalDays += 1;
    }

    result = (totalDays * tripInfoModel.tlkRate).toInt();

    return result;
  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.idDocument!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      detailSelectedItem(r);
      setValue();
      getApprovalLog();
    });
  }

  void reject() async {
    isLoadingHitApi(true);

    final result =
        await _repository.reject(approvalModel.value, selectedItem.value.id!);
    result.fold(
        (l) {
          isLoadingHitApi(false);
          showApprovalFailDialog("Request failed to be approved!".tr)
            .then((value) => Get.back(result: true));
        }, (r) {
      isLoadingHitApi(false);
      if (r) {
        showApprovalSuccessDialog("The request was successfully rejected!".tr)
            .then((value) => Get.back(result: true));
      } else {
        showApprovalFailDialog("Request failed to be rejected!".tr)
            .then((value) => Get.back(result: true));
      }
    });
  }

  void approve() async {
    isLoadingHitApi(true);
    final result =
        await _repository.approve(approvalModel.value, selectedItem.value.id!);
    result.fold(
        (l) {
          isLoadingHitApi(false);
          showApprovalFailDialog("Request failed to be approved!".tr)
            .then((value) => Get.back(result: true));
        }, (r) {
      isLoadingHitApi(false);
      if (r) {
        showApprovalSuccessDialog("The request was successfully approved!".tr)
            .then((value) => Get.back(result: true));
      } else {
        showApprovalFailDialog("Request failed to be approved!".tr)
            .then((value) => Get.back(result: true));
      }
    });
  }

  void getApprovalLog() async {
    final result = await _repository.getApprovalLog(selectedItem.value.idDocument!);

    result.fold((l) => null, (r) {
      listLogApproval.value = r;
      listLogApproval.refresh();
    });
  }

  void updateHeader() async {
    isLoadingHitApi(true);
    ActualizationTripModel model = detailSelectedItem.value.copyWith(
        arrayTrip: listTripInfo,
        arrayActivities: listActivity,
        purpose: purposeController.text,
        notes: notesController.text,
        idEmployee: await storage.readString(StorageCore.userID),
        totalTlk: getTotalTLK()
    );

    final result = await _repository.updateData(model, selectedItem.value.idDocument);

    result.fold(
            (l) {
          isLoadingHitApi(false);
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
        },
            (model) {
          isLoadingHitApi(false);
          detailHeader();
        });
  }

  void updateTripInfo(TripInfoModel tripInfoModel) async {
    isLoadingHitApi(true);

    final result = await _tripRepository.updateData(tripInfoModel, tripInfoModel.id);
    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (model) {
      isLoadingHitApi(false);
      //update list
      getTripInfo().then((value) {
        //updateHeader
        updateHeader();
      });

    });
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


}
