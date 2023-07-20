import 'package:gais/data/repository/approval_request_trip/approval_request_trip_repository.dart';
import 'package:gais/data/repository/document_delivery/document_delivery_repository.dart';
import 'package:gais/data/repository/management_meeting_room/management_meeting_room_repository.dart';
import 'package:gais/data/repository/pool_car/management_poolcar/management_poolcar_repository.dart';
import 'package:gais/data/repository/repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/dialog/fail_dialog.dart';
import 'package:gais/reusable/dialog/success_dialog.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final repository = Get.find<Repository>();
  final documentDelivery = Get.find<DocumentDeliveryRepository>();
  final approvalRequestTrip = Get.find<ApprovalRequestTripRepository>();
  final managementPoolCar = Get.find<ManagementPoolCarRepository>();
  final managementMeetingRoom = Get.find<ManagementMeetingRoomRepository>();
  final storage = Get.find<StorageCore>();


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
}