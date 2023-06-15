import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';

class AddRoomInfoController extends BaseController{
  bool isEdit = Get.arguments['isEdit'] ?? false;

  final formKey = GlobalKey<FormState>();
  final company = TextEditingController();
  final site = TextEditingController();
  final mrID = TextEditingController();
  final mrName = TextEditingController();
  final capacity = TextEditingController();
  final floor = TextEditingController();
  final availableStatus = TextEditingController();
  final remarks = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }
}