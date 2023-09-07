import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart' as schedule;
import 'package:gais/data/model/antavaya/get_rsv_ticket_model.dart';
import 'package:gais/data/model/antavaya/get_ssr_model.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';

class AirportReservationController extends BaseController {
  schedule.Flights flight = Get.arguments['flight'];
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  bool? isEdit = Get.arguments['isEdit'];
  String? airlinessID = Get.arguments['id'];
  String? adult = Get.arguments['adult'];
  String? infant = Get.arguments['infant'];
  String? child = Get.arguments['child'];

  final formKey = GlobalKey<FormState>();
  final bookTitle = TextEditingController();
  final bookFirstName = TextEditingController();
  final bookLastName = TextEditingController();
  final bookHomePhone = TextEditingController();
  final bookMobilePhone = TextEditingController();
  final bookEmail = TextEditingController();
  final passTitle = TextEditingController();
  final passFirstName = TextEditingController();
  final passLastName = TextEditingController();
  final passBirthDate = TextEditingController();
  final passEmail = TextEditingController();
  bool? isSeniorCitizen;
  final passMobilePhone = TextEditingController();
  final passIDNumber = TextEditingController();
  final passNationality = TextEditingController();
  final passPassportNumber = TextEditingController();
  final passPassportOrigin = TextEditingController();
  final passPassportExpire = TextEditingController();
  final passEmergencyFullName = TextEditingController();
  final passEmergencyEmail = TextEditingController();
  final passEmergencyPhone = TextEditingController();

  Passengers? passengers;
  Segments? segments;
  bool isLoading = false;
  String? pnrID;


  @override
  void onInit() {
    super.onInit();
    flight.printInfo();
  }

  Future<void> saveData() async {
    getSegment();
  }

  Future<void> getSegment() async {
    try {
      await antavaya
          .getSSR(
            adult.toString(),
            child.toString(),
            infant.toString(),
            Segments(
              airline: flight.airline.toString(),
              arriveDate: flight.arriveDate,
              ariveTime: flight.arriveTime,
              classCode: flight.classObjects!.isNotEmpty ? flight.classObjects?.first.code : flight.connectingFlights?.first.classObjects?.first.code,
              classID: flight.classObjects!.isNotEmpty ? flight.classObjects?.first.id : flight.connectingFlights?.first.classObjects?.first.id,
              departDate: flight.departDate,
              departTime: flight.departTime,
              flightId: flight.id,
              flightNumber: flight.number,
              origin: flight.origin,
              destination: flight.destination,
              num: 0,
              seq: 1,
            ),
          )
          .then((value) => saveReservation(Passengers(
                title: passTitle.text,
                firstName: passFirstName.text,
                lastName: passLastName.text,
                birthDate: passBirthDate.text,
                email: passEmail.text,
                isSeniorCitizen: isSeniorCitizen,
                mobilePhone: passMobilePhone.text,
                index: 1,
                type: '1',
                nationality: 'ID',
                idNumber: passIDNumber.text,
                passport: Passport(
                  number: passPassportNumber.text,
                  firstName: passFirstName.text,
                  lastName: passLastName.text,
                  originCountry: passPassportOrigin.text,
                  expire: passPassportExpire.text,
                ),
                emergencyName: passEmergencyFullName.text,
                emergencyPhone: passEmergencyPhone.text,
                emergencyEmail: passEmergencyEmail.text,
                ssrs: [
                  Ssrs(
                    // ssrCode: value.data?.rsFlightSsrs?.first.ssrs?.first.ssrCode ?? '0CW-1',
                    ssrCode: '0CW-1',
                    originCode: flight.origin,
                    destinationCode: flight.destination,
                    ssrFare: flight.fare!.toInt(),
                    // ccy: value.data?.rsFlightSsrs?.first.ssrs?.first.ccy ?? 'IDR',
                    ccy: 'IDR',
                    // ssrName: value.data?.rsFlightSsrs?.first.ssrs?.first.ssrName,
                    ssrName: 'Baggage',
                    // ssrType: value.data?.rsFlightSsrs?.first.ssrs?.first.ssrType,
                    ssrType: 1,
                    flightNumber: flight.number,
                  ),
                ],
              )));
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    update();
  }

  Future<void> saveReservation(Passengers passenger) async {
    try {
      await antavaya
          .saveFlightReservation(
            bookTitle.text,
            bookFirstName.text,
            bookLastName.text,
            bookEmail.text,
            bookHomePhone.text,
            bookMobilePhone.text,
            passenger,
            Segments(
              airline: flight.airline.toString(),
              arriveDate: flight.arriveDate,
              ariveTime: flight.arriveTime,
              classCode: flight.classObjects!.isNotEmpty ? flight.classObjects?.first.code : flight.connectingFlights?.first.classObjects?.first.code,
              classID: flight.classObjects!.isNotEmpty ? flight.classObjects?.first.id : flight.connectingFlights?.first.classObjects?.first.id,
              departDate: flight.departDate,
              departTime: flight.departTime,
              flightId: flight.id,
              flightNumber: flight.number,
              origin: flight.origin,
              destination: flight.destination,
              num: 0,
              seq: 0,
            ),
            flight.flightType.toString(),
          )
          .then((value) => saveAirliness(json.decode(value)['pnrid']));
      // .then((pnrID) => saveAirliness(pnrID.s);
    } catch (e, i) {
      e.printError();
      i.printError();
    }

    update();
  }

  Future<void> saveAirliness(String pnrID) async {
    if (airlinessID != null) {
      try {
        await repository
            .updateAirlines(
              airlinessID!,
              purposeID.toString(),
              "1",
              flight.number.toString(),
              flight.classObjects?.first.code ?? "",
              flight.fare.toString(),
              pnrID,
            )
            .then(
              (value) => formEdit == true
                  ? Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
                  : Get.off(const AirlinessScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit}),
            );
      } catch (e, i) {
        e.printError();
        i.printError();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Failed To Update',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      try {
        await repository
            .saveAirlines(
              purposeID.toString(),
              "1",
              flight.number.toString(),
              flight.classObjects?.first.code ?? "",
              flight.fare.toString(),
              pnrID,
            )
            .then((value) => Get.off(const AirlinessScreen(), arguments: {
                  'purposeID': purposeID,
                  'codeDocument': codeDocument,
                  'formEdit': formEdit,
                }));
      } catch (e, i) {
        e.printError();
        i.printError();
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
  }
}
