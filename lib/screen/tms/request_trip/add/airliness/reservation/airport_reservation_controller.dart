import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart' as schedule;
import 'package:gais/data/model/antavaya/get_rsv_ticket_model.dart';
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

  List<Passengers> passengers = [];
  List<Segments> segments = [];

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> saveReservation() async {
    passengers.add(Passengers(
      title: passTitle.text,
      firstName: passFirstName.text,
      lastName: passLastName.text,
      birthDate: passBirthDate.text,
      email: passEmail.text,
      isSeniorCitizen: isSeniorCitizen,
      mobilePhone: passMobilePhone.text,
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
    ));
    try {
      await antavaya
          .saveFlightReservation(
            bookTitle.text,
            bookFirstName.text,
            bookLastName.text,
            bookEmail.text,
            bookHomePhone.text,
            bookMobilePhone.text,
            passengers,
            segments,
          )
          .then((value) => saveAirliness(value.pnrId.toString()));
    } catch (e) {
      e.printError();
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
