import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart' as schedule;
import 'package:get/get.dart';

class AirportReservationController extends BaseController {
  schedule.Flights flight = Get.arguments['flight'];
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];

  final formKey = GlobalKey<FormState>();
  final bookTitle = TextEditingController();
  final bookFirstName = TextEditingController();
  final bookLastName = TextEditingController();
  final bookHomePhone = TextEditingController();
  final bookMobilePhone = TextEditingController();
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

  @override
  void onInit() {
    super.onInit();
  }
}
