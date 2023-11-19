import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActActivitiesDetailController extends BaseController {
  final actualID = Get.arguments['idActual'];
  final formKey = GlobalKey<FormState>();
  final activityDate = TextEditingController();
  final activityDetail = TextEditingController();
  final bool isEdit = Get.arguments['isEdit'];
  final String? idActivity = Get.arguments['id'];

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy-MM-dd");

  @override
  void onInit() {
    super.onInit();
    print("actual id : $actualID");
    print("activity id : $idActivity");
    if (isEdit) {
      fetchData();
    }
  }

  Future<void> saveData() async {
    if (isEdit) {
      updateData();
    } else {
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

  Future<void> fetchData() async {
    try {
      await actualizationTrip.getActivitiesByID(idActivity!).then((value) {
        activityDate.text = dateFormat.format(DateTime.parse(value.data?.first.actDate.toString() ?? ""));
        activityDetail.text = value.data?.first.activities ?? "";
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
  }

  Future<void> updateData() async {
    try {
      await actualizationTrip
          .updateActivities(
            idActivity!,
            actualID,
            activityDate.text,
            activityDetail.text,
          )
          .then((value) => Get.back());
    } catch (e, i) {
      e.printError();
      i.printError();
    }
  }
}
