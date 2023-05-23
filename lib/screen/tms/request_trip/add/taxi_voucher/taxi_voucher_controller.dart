import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart' as tv;
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:get/get.dart';

class TaxiVoucherController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int codeDocument = Get.arguments['codeDocument'];

  tv.GetTaxiVoucherModel? tvModel;
  List<tv.Data> tvList = [];

  @override
  void onInit() {
    super.onInit();
    purposeID.printInfo(info: "purposeID");
    codeDocument.printInfo(info: "code document");
    Future.wait([getList()]);
  }

  Future<void> getList() async {
    tvList = [];
    try {
      var tvData = await repository.getTaxiVoucherBytripList(purposeID);
      tvModel = tvData;
      tvList.addAll(tvData.data
              ?.where((e) => e.idRequestTrip == purposeID)
              .toSet()
              .toList() ??
          []);
    } catch (e) {
      e.printError();
    }
    update();
    print("taxi voucher: ${tvModel?.data}");
  }

  Future<void> delete(int id) async {
    try {
      await repository.deleteTaxiVoucher(id).then((value) {
        print(value);
        getList();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Data Deleted',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: successColor,
          ),
        );
      });
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Save',
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
}
