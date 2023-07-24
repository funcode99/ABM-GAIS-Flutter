import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_other_transport_model.dart' as ot;
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:get/get.dart';

class OtherTransportController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];

  List<ot.Data> otList = [];
  ot.GetOtherTransportModel? otModel;

  @override
  void onInit() {
    super.onInit();
    purposeID.printInfo(info: "PurposeID");
    codeDocument.printInfo(info: "CodeDocument");
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    otList = [];
    try {
      var otherTransportData = await repository.getOtherTransportBytripList(purposeID);
      otModel = otherTransportData;
      otList.addAll(otherTransportData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      update();
    } catch (e) {
      e.printError();
    }
  }

  Future<void> delete(int id) async {
    try {
      await repository.deleteOtherTransportation(id).then((value) => fetchList()).then((value) => Get.showSnackbar(
            GetSnackBar(
              icon: Icon(
                Icons.error,
                color: Colors.white,
              ),
              message: 'Data Deleted',
              isDismissible: true,
              duration: Duration(seconds: 3),
              backgroundColor: successColor,
            ),
          ));
      update();
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
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

  void next() {
    if (formEdit == true) {
      Get.back();
    } else {
      Get.to(AccommodationScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument});
    }
  }
}
