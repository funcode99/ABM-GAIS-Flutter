import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActActivitiesDetailController extends BaseController {
  final actualID = Get.arguments['idActual'];
  final formKey = GlobalKey<FormState>();
  final activityDate = TextEditingController();
  final activityDetail = TextEditingController();

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy-MM-dd");

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> saveData() async {
    try {
      await actualizationTrip
          .saveActivities(
            actualID,
            activityDate.text,
            activityDetail.text,
          )
          .then((value) => Get.back());
    } catch (e) {
      e.printError();
    }
  }
}
