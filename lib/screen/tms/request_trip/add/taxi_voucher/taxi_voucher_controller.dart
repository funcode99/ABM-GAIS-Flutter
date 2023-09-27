import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart' as tv;
import 'package:gais/screen/tms/request_trip/add/other_transport/other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:get/get.dart';

class TaxiVoucherController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];

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
      var tvData = await requestTrip.getTaxiVoucherBytripList(purposeID);
      tvModel = tvData;
      tvList.addAll(tvData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);
    } catch (e) {
      e.printError();
    }
    update();
    print("taxi voucher: ${tvModel?.data}");
  }

  Future<void> delete(String id) async {
    try {
      await requestTrip.deleteTaxiVoucher(id).then((value) {
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
      await requestTrip.submitRequestTrip(purposeID).then((value) {
        Get.offAll(RequestTripListScreen());
        Get.showSnackbar(GetSnackBar(
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
      Get.showSnackbar(GetSnackBar(
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

  void next() {
    if (formEdit == true) {
      Get.back();
    } else {
      Get.to(const OtherTransportScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument});
    }
  }
}
