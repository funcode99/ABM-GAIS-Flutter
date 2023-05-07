import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class FormDocumentDeliveryController extends BaseController{
  final createdDate = TextEditingController();
  final createdBy = TextEditingController();
  final sender = TextEditingController();
  final company = TextEditingController();
  final subjectDocument = TextEditingController();
  final attachment = TextEditingController();
  final remarks = TextEditingController();

  String? receiver;
  String? location;

  bool isReceived = false;
  bool isDelivered = false;
  bool isDelivering = false;

  @override
  void onInit() {
    super.onInit();
  }

}