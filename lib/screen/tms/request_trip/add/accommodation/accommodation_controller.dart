import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_accommodation_model.dart' as acc;
import 'package:gais/screen/tms/request_trip/add/cash_advance/cash_advance_screen.dart';
import 'package:get/get.dart';

class AccommodationController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
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
      var accommodation = await repository.getAccommodationBytripList(purposeID);
      accommodationsModel = accommodation;
      accommodationsList.addAll(accommodation.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      update();
    } catch (e, i) {
      e.printError();
      i.printError();
    }
  }

  Future<void> delete(int id) async {
    try {
      await repository.deleteAccommodation(id).then((value) {
        fetchList();
        GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Deleted",
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
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
    }
  }

  void next() {
    Get.to(
      const CashAdvanceScreen(),
      arguments: {'purposeID': purposeID, 'codeDocument': codeDocument},
    );
  }
}
