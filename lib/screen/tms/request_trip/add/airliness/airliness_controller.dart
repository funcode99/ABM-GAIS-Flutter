import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/reference/get_status_document_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_model.dart' as airliness;
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AirlinessController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  String travellerName = "";
  bool? isLoading;

  GetStatusDocumentModel? statusModel;
  List<airliness.Data> airlinessList = [];
  airliness.GetAirlinessModel? airlinessModel;

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");

  @override
  void onInit() {
    super.onInit();
    purposeID.printInfo(info: "purposeID");
    codeDocument.printInfo(info: "code document");
    Future.wait([fetchList()]);
  }

  Future<void> fetchFlight(String pnrID) async {
    try {
      await antavaya.getRsvTicket(pnrID);
    } catch (e) {
      e.printError();
    }
  }

  Future<void> fetchList() async {
    airlinessList = [];
    try {
      var airlinessData = await repository.getAirlinessBytripList(purposeID);
      airlinessModel = airlinessData;
      airlinessData.data?.asMap().forEach((i, e) async {
        print("pnrID: ${e.pnrid}");
        await antavaya.getRsvTicket(e.pnrid).then((rsv) {
          var reservation = jsonDecode(rsv);
          print("rsv: ${reservation.toString()}");
          print("rsv: ${reservation['Passengers'][0]['Type'].toString()}");

          airlinessList.add(airliness.Data(
            id: e.id,
            idRequestTrip: e.idRequestTrip,
            pnrid: e.pnrid,
            employeeName: reservation['Passengers'][0]['FirstName'],
            createdAt: e.createdAt,
            departure: reservation['FlightDetails'][0]['Origin'],
            arrival: reservation['FlightDetails'][0]['Destination'],
            departureTime: reservation['FlightDetails'][0]['DepartTime'],
            arrivalTime: reservation['FlightDetails'][0]['ArriveTime'],
            flightNo: reservation['FlightDetails'][0]['FlightNumber'],
            ticketPrice: e.ticketPrice,
            departureDate: reservation['FlightDetails'][0]['DepartDate'],
            arrivalDate: reservation['FlightDetails'][0]['ArriveDate'],
            flightClass: reservation['FlightDetails'][0]['Class'],
          ));
          update();
        });
      });
      // airlinessList.addAll(airliessData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ?? []);

      await storage.readEmployeeInfo().then((value) => travellerName = value.first.employeeName.toString());

      var status = await repository.getStatusDocument();
      statusModel = status;

      update();
    } catch (e) {
      e.printError();
    }
  }

  Future<void> delete(String id) async {
    isLoading = true;
    try {
      await repository.deleteAirliness(id).then((value) {
        Get.showSnackbar(GetSnackBar(
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
      isLoading = false;
      fetchList();
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
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
    update();
  }

  void next() {
    formEdit == true
        ? Get.off(FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
        : codeDocument == 2
            ? Get.to(OtherTransportScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument})
            : codeDocument == 5
                ? Get.to(AccommodationScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument})
                : Get.to(TaxiVoucherScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument});
  }
}
