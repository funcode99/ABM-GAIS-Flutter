import 'package:gais/data/repository/document_delivery/document_delivery_repository.dart';
import 'package:gais/data/repository/repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/dialog/fail_dialog.dart';
import 'package:gais/reusable/dialog/success_dialog.dart';
import 'package:get/get.dart';

abstract class BaseController extends GetxController {
  final repository = Get.find<Repository>();
  final documentDelivery = Get.find<DocumentDeliveryRepository>();
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