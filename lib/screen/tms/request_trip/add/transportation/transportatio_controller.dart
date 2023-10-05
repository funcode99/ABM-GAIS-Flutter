import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_taxi_voucher_model.dart' as tv;
import 'package:gais/data/model/request_trip/get_other_transport_model.dart' as ot;
import 'package:gais/data/model/request_trip/get_transportation_model.dart' as transport;
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TransportationController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];

  tv.GetTaxiVoucherModel? tvModel;
  ot.GetOtherTransportModel? otModel;
  transport.GetTransportationModel? transportModel;
  List<tv.Data> tvList = [];
  List<ot.Data> otList = [];
  List<transport.Data> transportList = [];
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");

  @override
  void onInit() {
    super.onInit();
    purposeID.printInfo(info: "purposeID");
    codeDocument.printInfo(info: "code document");
    Future.wait([getList()]);
  }

  Future<void> getList() async {
    tvList = [];
    otList = [];
    transportList = [];
    try {
      // var tvData = await requestTrip.getTaxiVoucherBytripList(purposeID);
      // tvModel = tvData;
      // tvList.addAll(tvData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      // var otherTransportData = await requestTrip.getOtherTransportBytripList(purposeID);
      // otModel = otherTransportData;
      // otList.addAll(otherTransportData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      var transportData = await requestTrip.getTransportationBytrip(purposeID);
      transportModel = transportData;
      transportList.addAll(transportData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    update();
  }

  Future<void> deleteTransport(String id) async {
    try {
      await requestTrip.deleteTransportation(id).then((value) {
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

  Future<void> deleteOT(String id) async {
    try {
      await requestTrip.deleteOtherTransportation(id).then((value) {
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

  Future<void> deleteTV(String id) async {
    try {
      await requestTrip.deleteTaxiVoucher(id).then((value) {
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
        Get.offAll(const RequestTripListScreen());
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

  void next() {
    if (formEdit == true) {
      Get.back();
    } else {
      Get.to(const AccommodationScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument});
    }
  }
}
