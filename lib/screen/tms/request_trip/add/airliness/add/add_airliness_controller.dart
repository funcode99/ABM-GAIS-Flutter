import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class AddAirlinessController extends BaseController{
  final formKey = GlobalKey<FormState>();
  final departureDate = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  String? traveller;
  DateTime? selectedDate;
  String? flightClass;
  String? departure;
  String? arrival;


  @override
  void onInit() {
    super.onInit();
    departureDate.text;
  }

  @override
  void dispose() {
    super.dispose();
    departureDate.dispose();
  }
}