import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/taxi_voucher_screen.dart';
import 'package:get/get.dart';

class AirlinesController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];

  int? travellerID;
  int? jobBandID;
  int? flightID;
  String? travellerName;
  String? travellerSN;
  String? travellerGender;
  String? travellerHotel;
  String? travellerFlight;

  guest.GetGuestBytripModel? guestModel;
  List<guest.Data> guestList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([getTravellerInfo(), getGuestList()]);
    purposeID.printInfo(info: "purposeID");
    codeDocument.printInfo(info: "code document");
  }

  Future<void> getTravellerInfo() async {
    await storage.readEmployeeInfo().then((value) {
      print(value);
      travellerID = int.parse(value.first.id.toString());
      travellerName = value.first.employeeName;
      travellerSN = value.first.snEmployee;
      travellerGender = value.first.jenkel;
      travellerHotel = value.first.hotelFare;
      jobBandID = int.parse(value.first.idJobBand.toString());
      travellerFlight = value.first.flightClass;
    });

    update();
  }

  Future<void> getGuestList() async {
    guestList = [];
    try {
      var guestData = await repository.getGuestBytripList(purposeID);
      guestModel = guestData;
      guestList.addAll(guestData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);
    } catch (e) {
      guestList = [];
    }
    update();
  }

  Future<void> deleteGuest(int id) async {
    try {
      await repository.deleteTravellerGuest(id).then((value) {
        print(value);
        getGuestList();
        Get.showSnackbar(
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
        );
      });
    } catch (e) {
      Get.showSnackbar(
        GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Delete Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: errorColor,
        ),
      );
    }
  }

  void next() {
    formEdit == true
        ? Get.back()
        : codeDocument == 4
            ? Get.to(
                const TaxiVoucherScreen(),
                arguments: {'purposeID': purposeID, 'codeDocument': codeDocument},
              )?.then((result) {
                result.printInfo(info: "result");
              })
            : Get.to(
                const AirlinessScreen(),
                arguments: {'purposeID': purposeID, 'codeDocument': codeDocument},
              )?.then((result) {
                result.printInfo(info: "result");
              });
  }
}
