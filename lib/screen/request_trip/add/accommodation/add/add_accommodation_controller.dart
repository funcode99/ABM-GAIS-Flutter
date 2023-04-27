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
  String? transportType;
  String? departure;
  String? arrival;

  @override
  void onInit() {
    super.onInit();
    departureDate.text;
    amount.text;
    voucher.text;
    remarks.text;
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
