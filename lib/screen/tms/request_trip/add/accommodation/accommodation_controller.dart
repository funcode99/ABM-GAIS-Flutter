import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_accommodation_model.dart' as acc;
import 'package:gais/screen/tms/request_trip/add/cash_advance/cash_advance_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';

class AccommodationController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];

  List<acc.Data> accommodationsList = [];
  acc.GetAccommodationModel? accommodationsModel;

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
    formEdit.printInfo();
  }

  Future<void> fetchList() async {
    accommodationsList = [];
    try {
      var accommodation = await requestTrip.getAccommodationBytripList(purposeID);
      accommodationsModel = accommodation;
      accommodationsList.addAll(accommodation.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      update();
    } catch (e, i) {
      e.printError();
      i.printError();
    }
  }

  Future<void> submit() async {
    try {
      await requestTrip.submitRequestTrip(purposeID).then((value) {
        Get.offAll(const FormRequestTripScreen());
        Get.showSnackbar(const GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Submitted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        ));
      });
      update();
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Submit Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }

  Future<void> delete(String id) async {
    try {
      await requestTrip.deleteAccommodation(id).then((value) {
        fetchList();
        Get.showSnackbar(const GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Deleted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        ));
      });
      update();
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }

  void next() {
    Get.to(
      const CashAdvanceScreen(),
      arguments: {'purposeID': purposeID, 'codeDocument': codeDocument},
    );
  }
}
