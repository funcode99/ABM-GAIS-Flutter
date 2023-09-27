import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TrainReservationController extends BaseController{
  // schedule.Flights? train = Get.arguments['flight'];
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  bool? isEdit = Get.arguments['isEdit'];
  String? airlinessID = Get.arguments['id'];
  String? adult = Get.arguments['adult'];
  String? infant = Get.arguments['infant'];
  String? child = Get.arguments['child'];
  // airline.Data? trainModel = Get.arguments['airlinessData'];
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
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy-MM-dd");

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> saveData() async{

  }

}