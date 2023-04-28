import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class AddAccommodationController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final departureDate = TextEditingController();
  final amount = TextEditingController();
  final voucher = TextEditingController();
  final remarks = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  String? traveller;
  DateTime? selectedDate;
  String? gender;
  String? transportType;
  String? departure;
  String? arrival;
  bool? isSharing;
  bool? createGL;

  @override
  void onInit() {
    super.onInit();
    departureDate.text;
    amount.text;
    voucher.text;
    remarks.text;
    isSharing = false;
    createGL = false;
  }

  @override
  void dispose() {
    super.dispose();
    departureDate.dispose();
    amount.dispose();
    voucher.dispose();
    remarks.dispose();
  }
}
