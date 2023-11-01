import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/contact_model.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart' as schedule;
import 'package:gais/data/model/antavaya/passengers_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_model.dart' as airline;
import 'package:gais/data/model/reference/get_user_ga_model.dart' as contact;
import 'package:gais/data/model/antavaya/get_rsv_ticket_model.dart';
import 'package:gais/data/model/antavaya/get_ssr_model.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
  airline.Data? airlinessModel = Get.arguments['airlinessData'];
  bool? isInternational = Get.arguments['isInternational'];

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
  bool isSeniorCitizen = false;
  final passMobilePhone = TextEditingController();
  final passIDNumber = TextEditingController();
  final passNationality = TextEditingController();
  final passPassportNumber = TextEditingController();
  final passPassportOrigin = TextEditingController();
  final passPassportExpire = TextEditingController();
  final passEmergencyFullName = TextEditingController();
  final passEmergencyEmail = TextEditingController();
  final passEmergencyPhone = TextEditingController();

  PassengersModel? passengers;
  Segments? segments;
  bool isLoading = false;
  String? pnrID;
  DateTime? birthDate;
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy-MM-dd");
  ContactModel? bookingContact;
  List<contact.Data> gaList = [];



  @override
  void onInit() {
    super.onInit();
    flight.printInfo();
    Future.wait([fetchList()]);
    if (airlinessID != null) {
      fetchEdit();
    }
    print('airlinessID : $airlinessID');
  }

  Future<void> fetchList() async{
    isLoading = true;
    gaList = [];
    try{
      await repository.getUserGA().then((value) => gaList.addAll(value.data?.toSet().toList() ?? []));
    }catch(e){
      e.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> fetchEdit() async {
    if (airlinessID != null) {
      await antavaya.getRsvTicket(airlinessModel!.pnrid.toString()).then((value) {
        var rsv = jsonDecode(value);
        bookTitle.text = rsv['Contact']['Title'];
        bookFirstName.text = rsv['Contact']['FirstName'];
        bookLastName.text = rsv['Contact']['LastName'];
        bookHomePhone.text = rsv['Contact']['HomePhone'];
        bookMobilePhone.text = rsv['Contact']['MobilePhone'];
        bookEmail.text = rsv['Contact']['Email'];
        passTitle.text = rsv['Passengers'][0]['Title'];
        passFirstName.text = rsv['Passengers'][0]['FirstName'];
        passLastName.text = rsv['Passengers'][0]['LastName'];
        birthDate = DateTime.parse(rsv['Passengers'][0]['BirthDate']);
        passBirthDate.text = dateFormat.format(birthDate!);
        passEmail.text = rsv['Passengers'][0]['Email'];
        passMobilePhone.text = rsv['Passengers'][0]['MobilePhone'];
        passIDNumber.text = rsv['Passengers'][0]['IdNumber'];
        passNationality.text = rsv['Passengers'][0]['Nationality'];
        passPassportNumber.text = rsv['Passengers'][0]['Passport']['Number'];
        passPassportOrigin.text = rsv['Passengers'][0]['Passport']['OriginCountry'];
        passPassportExpire.text = rsv['Passengers'][0]['Passport']['Expire'];
      });
    }
  }

  Future<void> saveData() async {
    isLoading = true;
    update();
    // getSegment();
    saveReservation(PassengersModel(
      title: passTitle.text,
      firstName: passFirstName.text,
      lastName: passLastName.text,
      birthDate: saveDateFormat.format(birthDate!),
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
    ));
  }

  Future<void> getSegment() async {
    isLoading = true;
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
          .then((value) => saveReservation(PassengersModel(
                title: passTitle.text,
                firstName: passFirstName.text,
                lastName: passLastName.text,
                birthDate: saveDateFormat.format(birthDate!),
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
    isLoading = false;
    update();
  }

  Future<void> saveReservation(PassengersModel passenger) async {
    isLoading = true;
    print(bookingContact?.mobilePhone);
    try {
      await antavaya
          .saveFlightReservation(
        // bookTitle.text,
        // bookFirstName.text,
        // bookLastName.text,
        // bookEmail.text,
        // bookHomePhone.text,
        // bookMobilePhone.text,
        bookingContact!,
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
          .then((value) {
        print(value.data?.pnrid.toString());
        saveAirliness(value.data!.pnrid.toString());
      });
      // .then((pnrID) => saveAirliness(pnrID.s);
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Booking failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
    isLoading = false;
    update();
  }

  Future<void> saveAirliness(String pnrID) async {
    if (airlinessID != null) {
      try {
        // print(flight.fare);
        await requestTrip
            .updateAirlines(
              airlinessID!,
              purposeID.toString(),
              "1",
              flight.number.toString(),
              flight.classObjects?.first.code ?? "",
              flight.fare.toString(),
              pnrID,
              flight.origin.toString(),
              flight.destination.toString(),
              flight.departDate.toString(),
              '1',
              '0',
              '0',
              "${passFirstName.text} ${passLastName.text} ",
              flight.classObjects!.isNotEmpty
                  ? flight.classObjects?.first.category.toString() ?? ''
                  : flight.connectingFlights?.first.classObjects?.first.category.toString() ?? '',
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
        await requestTrip
            .saveAirlines(
              purposeID.toString(),
              "1",
              flight.number.toString(),
              flight.classObjects?.first.code ?? "",
              flight.fare.toString(),
              pnrID,
              flight.origin.toString(),
              flight.destination.toString(),
              flight.departDate.toString(),
              '1',
              '0',
              '0',
              "${passFirstName.text} ${passLastName.text} ",
              flight.classObjects!.isNotEmpty
                  ? flight.classObjects?.first.category.toString() ?? ''
                  : flight.connectingFlights?.first.classObjects?.first.category.toString() ?? '',
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
