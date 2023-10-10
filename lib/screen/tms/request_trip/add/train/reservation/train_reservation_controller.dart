import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/contact_model.dart';
import 'package:gais/data/model/antavaya/get_train_schedule_model.dart' as train;
import 'package:gais/data/model/antavaya/passengers_model.dart';
import 'package:gais/data/model/reference/get_user_ga_model.dart' as contact;
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
  DateTime? birthDate;
  DateFormat dateFormat = DateFormat("dd MMM yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy-MM-dd");
  List<contact.Data> gaList = [];
  ContactModel? bookingContact;

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    isLoading = true;
    gaList = [];
    try {
      await repository.getUserGA().then((value) => gaList.addAll(value.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> saveData() async {
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
          )
          .then((value) => print(jsonEncode(value)));
    } catch (e) {
      e.printError();
    }
  }
}
