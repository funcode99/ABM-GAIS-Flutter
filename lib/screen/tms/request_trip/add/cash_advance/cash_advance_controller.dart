import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_cash_advance_travel_model.dart'
    as ca;
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:get/get.dart';

class CashAdvanceController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int codeDocument = Get.arguments['codeDocument'];

  ca.GetCashAdvanceTravelModel? caModel;
  List<ca.Data> caList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    try {
      var caData = await repository.getCashAdvanceTravelList();
      caModel = caData;
      caList.addAll(caData.data
              ?.where((e) => e.idRequestTrip == purposeID)
              .toSet()
              .toList() ??
          []);
    } catch (e) {
      e.printError();
    }
  }

  Future<void> submit() async {
    try {
      await repository.submitRequestTrip(purposeID).then((value) {
        Get.offAll(RequestTripListScreen());
        GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Submitted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        );
      });
      update();
    } catch (e) {
      GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Submit Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
    }
  }
}
