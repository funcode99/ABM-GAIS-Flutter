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
      print(value.isNotEmpty);
      requestorID = int.parse(value.first.id.toString());
      requester.text = value.first.employeeName.toString();
      phone.text = value.first.phoneNumber.toString();
      sn.text = value.first.snEmployee.toString();
      siteID = int.parse(value.first.idSite.toString());
      location.text = value.first.siteName.toString();
    });

    var site = await repository.getSiteList();
    location.text =
        site.data?.where((e) => e.id == siteID).first.siteName ?? "";

    update();
  }
}
