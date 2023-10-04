import 'package:flutter/material.dart';
import 'package:gais/data/repository/actualization_trip/actualization_trip_repository.dart';
import 'package:gais/data/repository/antavaya/antavaya_repository.dart';
import 'package:gais/data/repository/approval_request_trip/approval_request_trip_repository.dart';
import 'package:gais/data/repository/document_delivery/document_delivery_repository.dart';
import 'package:gais/data/repository/management_meeting_room/management_meeting_room_repository.dart';
import 'package:gais/data/repository/pool_car/management_poolcar/management_poolcar_repository.dart';
import 'package:gais/data/repository/repository.dart';
import 'package:gais/data/repository/request_trip/request_trip_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/dialog/fail_dialog.dart';
import 'package:gais/reusable/dialog/progress_dialog.dart';
import 'package:gais/reusable/dialog/success_dialog.dart';
import 'package:gais/screen/tms/request_trip/add/add_request_trip_variable.dart';
import 'package:gais/util/navigation/navigation_util.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final repository = Get.find<Repository>();
  final requestTrip = Get.find<RequestTripRepository>();
  final documentDelivery = Get.find<DocumentDeliveryRepository>();
  final approvalRequestTrip = Get.find<ApprovalRequestTripRepository>();
  final managementPoolCar = Get.find<ManagementPoolCarRepository>();
  final managementMeetingRoom = Get.find<ManagementMeetingRoomRepository>();
  final actualizationTrip = Get.find<ActualizationTripRepository>();
  final antavaya = Get.find<AntavayaRepository>();
  final storage = Get.find<StorageCore>();

  final requestTripVariable = Get.find<AddRequestTripVariable>();
  final isLoadingHitApi = false.obs; //flag for disable button when hit api is still loading

  @override
  void onReady() {
    //make listener global for all subclasses
    isLoadingHitApi.listen((value) {
      if(value){
        showProgressDialog();
      }else{
        hideProgressDialog();
      }
    });
  }

  Future<void> showApprovalSuccessDialog(String message){
    return Get.dialog(
        SuccessDialog(
          message: message,
          onClosePressed: () {
            Get.back();
          },
        )
    );
  }

  Future<void> showApprovalFailDialog(String message){
    return Get.dialog(
        FailDialog(
          message: message,
          onClosePressed: () {
            Get.back();
          },
        )
    );
  }

  Future<void> showProgressDialog(){
    return Get.dialog(
        Builder(
          builder: (context) => WillPopScope(
              child: const ProgressDialog(),
              onWillPop: () async => false
          )
        ),
        barrierDismissible: false,
        navigatorKey: NavigationUtil.navigationKey,
    );
  }

  void hideProgressDialog(){
    NavigationUtil.navigationKey.currentState?.pop();
  }
}