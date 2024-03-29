import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/contact_model.dart';
import 'package:gais/data/model/antavaya/get_train_schedule_model.dart' as train;
import 'package:gais/data/model/antavaya/get_train_seats_model.dart' as ts;
import 'package:gais/data/model/antavaya/passengers_model.dart';
import 'package:gais/data/model/reference/get_user_ga_model.dart' as contact;
import 'package:gais/data/storage_core.dart';
import 'package:gais/screen/tms/request_trip/add/train/train_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TrainReservationController extends BaseController {
  // schedule.Flights? train = Get.arguments['flight'];
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  bool? isEdit = Get.arguments['isEdit'];
  String? trainID = Get.arguments['id'];
  String? adult = Get.arguments['adult'];
  String? child = Get.arguments['child'];
  train.Journeys? trainModel = Get.arguments['trainData'];
  String selectedPassID = "KTP";

  final formKey = GlobalKey<FormState>();
  final passTitle = TextEditingController();
  final passFirstName = TextEditingController();
  final passLastName = TextEditingController();
  final passBirthDate = TextEditingController();
  final passMobilePhone = TextEditingController();
  final passIDNumber = TextEditingController();
  final passPassportExpire = TextEditingController();
  final passPassportOrigin = TextEditingController();
  final seatPassengers = TextEditingController();
  final seatWagonNo = TextEditingController();
  final seatNumber = TextEditingController();

  bool isLoading = false;
  bool loadSeats = false;
  DateTime? birthDate;
  DateFormat dateFormat = DateFormat("dd MMM yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy-MM-dd");
  List<contact.Data> gaList = [];
  List<ts.Data> wagonList = [];
  List<ts.SeatRows> seatsList = [];
  ContactModel? bookingContact;

  dynamic travelerObject;

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList(), initData()]);
  }

  Future<void> initData()async{
    requestTrip.getTrainTripByTrip(purposeID).then((value){
      travelerObject = value.data?.first.travelersObject ?? "";
    });
  }

  Future<void> fetchList() async {
    isLoading = true;
    gaList = [];
    wagonList = [];
    seatsList = [];
    try {
      await repository.getUserGA().then((value) => gaList.addAll(value.data?.toSet().toList() ?? []));

      await antavaya
          .getTrainSeats(
        trainModel!.origin.toString(),
        trainModel!.destination.toString(),
        trainModel!.departureDate.toString(),
        trainModel!.carrierNumber.toString(),
        trainModel!.segments!.first.subClass.toString(),
        trainModel!.provider.toString(),
        trainModel!.segments!.first.fareBasisCode.toString(),
      )
          .then((value) {
        wagonList.addAll(value.data?.toSet().toList() ?? []);
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> fetchSeatsRows(int index) async {
    seatsList = [];
    loadSeats = true;
    wagonList[index].seatRows!.forEachIndexed((i, rows) {
      rows.forEachIndexed((i, seats) {
        // print(seats.seatNumber);
        if (seats.seatNumber!.isNotEmpty) {
          seatsList.add(seats);
        }
      });
      // update();
    });
    // seatsList = wagonList[index].seatRows ?? [];
    loadSeats = false;
    update();
  }

  Future<void> saveData() async {
    String antavayaCustCode = await storage.readString(StorageCore.antavayaCustCode);

    try {
      await antavaya
          .saveTrainReservation(
        bookingContact!,
        PassengersModel(
          title: passTitle.text,
          firstName: passFirstName.text,
          lastName: passLastName.text,
          idNumber: passIDNumber.text,
          passport: Passport(originCountry: passPassportOrigin.text, expire: passPassportExpire.text),
          mobilePhone: passMobilePhone.text,
        ),
        trainModel!,
        selectedPassID,
        antavayaCustCode
      )
          .then((value) async {
        print("res : ${jsonEncode(value)}");
        await requestTrip.getTrainTripByID(trainID!).then((trainData) async {
          await requestTrip.updateTrainTrip(
            trainID!,
            purposeID,
            trainData.data?.first.travelerName ?? '',
            // 'GA - Budi',
            value.data?.pnrid.toString() ?? '',
            "1",
            trainData.data?.first.codeStation ?? '',
            trainData.data?.first.nameStation ?? '',
            trainData.data?.first.codeStationTo ?? '',
            trainData.data?.first.nameStationTo ?? '',
            trainModel!.departureDate.toString(),
            adult.toString(),
            child.toString(),
            trainModel!.trainName.toString(),
            travelerObject
          );
        });
      }).then(
        (value) => formEdit == true
            ? Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
            : Get.off(const TrainScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit}),
      );
    } catch (e) {
      e.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Reservation Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
