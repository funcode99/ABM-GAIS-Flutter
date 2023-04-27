import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class RequesterInfoController extends BaseController{
  final formKey = GlobalKey<FormState>();
  final requester = TextEditingController();
  final sn = TextEditingController();
  final location = TextEditingController();
  final phone = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    requester.text;
    sn.text;
    location.text;
    phone.text;
  }

  @override
  void dispose() {
    super.dispose();
    requester.dispose();
    sn.dispose();
    location.dispose();
    phone.dispose();
  }

}