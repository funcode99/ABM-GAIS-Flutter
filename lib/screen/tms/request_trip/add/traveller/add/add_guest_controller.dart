import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class AddGuestController extends BaseController{
  final formKey = GlobalKey<FormState>();
  final sn = TextEditingController();
  final contact = TextEditingController();
  final notes = TextEditingController();

  String? type;
  String? name;
  String? gender;
  String? department;
  String? company;
  String? hotelFare;
  String? flight;

  @override
  void onInit() {
    super.onInit();
    sn.text;
    contact.text;
    notes.text;
  }

  @override
  void dispose() {
    super.dispose();
    sn.dispose();
    contact.dispose();
    notes.dispose();
  }

}