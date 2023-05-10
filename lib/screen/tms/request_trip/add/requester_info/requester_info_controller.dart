import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class RequesterInfoController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final requester = TextEditingController();
  final sn = TextEditingController();
  final location = TextEditingController();
  final phone = TextEditingController();

  int? requestorID;
  int? siteID;
  int? requestID;

  @override
  void onInit() {
    super.onInit();
    requester.text;
    sn.text;
    location.text;
    phone.text;
    Future.wait([
      getRequesterInfo(),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    requester.dispose();
    sn.dispose();
    location.dispose();
    phone.dispose();
  }

  Future<void> getRequesterInfo() async {
    await storage.readEmployeeInfo().then((value) {
      print(value);
      requestorID = int.parse(value[0]);
      requester.text = value[1];
      phone.text = value[2];
      sn.text = value[3];
      siteID = int.parse(value[12]);
      location.text = value[13];
    });

    // requester.text;
    update();
  }
}
