import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_employee_model.dart' as receiver;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/screen/fss/document_delivery/document_delivery_list/document_delivery_list_screen.dart';
import 'package:get/get.dart';

class AddDocumentDeliveryController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final sender = TextEditingController();
  final location = TextEditingController();
  final company = TextEditingController();
  final subjectDocument = TextEditingController();
  final attachment = TextEditingController();
  final remarks = TextEditingController();

  int? senderID;
  int? senderCompanyID;
  int? senderSiteID;
  int? receiverID;
  int? receiverCompanyID;
  int? receiverSiteID;
  String? selectedReceiver;
  File? gettedFile;
  bool loadCompany = false;
  bool loadLocation = false;
  bool loadReceiver = false;

  List<receiver.Data> receiverList = [];
  List<comp.Data> companyList = [];
  List<site.Data> locationList = [];
  List<comp.Data> receiverCompanyList = [];
  List<site.Data> locationList = [];

  @override
  void onInit() {
    super.onInit();
    fetchList();
  }

  Future<void> fetchList() async {
    loadCompany = true;
    receiverCompanyList = [];
    // locationList = [];
    // receiverList = [];
    try {
      await storage.readEmployeeInfo().then((value) {
        sender.text = value.first.employeeName ?? "";
        senderID = value.first.id?.toInt();
        senderCompanyID = value.first.idCompany?.toInt();
        senderSiteID = value.first.idSite?.toInt();
      });

      await repository.getCompanyList().then((value) {
        companyList.addAll(value.data?.toSet().toList() ?? []);
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    loadCompany = false;
    update();
  }

      await repository.getCompanyList().then((value) {
        receiverCompanyList.addAll(value.data?.toSet().toList() ?? []);
  Future<void> fetchLocationList(int id) async {
    loadLocation = true;
    locationList = [];
    try {
      await repository.getSiteListByCompanyID(id).then((value) {
        locationList.addAll(value.data?.toSet().toList() ?? []);
      });

      // await repository.getSiteList().then((value) {
      //   locationList.addAll(value.data?.toSet().toList() ?? []);
      // });

      // await repository.getEmployeeList().then((value) {
      //   receiverList.addAll(value.data?.where((e) => e.id != senderID).toSet().toList() ?? []);
      // });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    loadCompany = false;
    update();
  }

  Future<void> fetchLocationList(int id) async {
    loadLocation = true;
    locationList = [];
    try {
      await repository.getSiteListByCompanyID(id).then((value) {
        locationList.addAll(value.data?.toSet().toList() ?? []);
      });
    } catch (e, i) {
      e.printError();
    }
    loadLocation = false;
    update();
  }

  Future<void> fetchReceiverList(int id) async {
    loadReceiver = true;
    receiverList = [];
    try {
      await repository.getEmployeeListBySiteID(id).then((value) {
        receiverList.addAll(value.data?.toSet().toList() ?? []);
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    loadReceiver = false;
    update();
  }

  Future<void> saveDocument() async {
    try {
      await documentDelivery
          .save(
        receiverCompanyID!.toInt(),
        receiverSiteID!.toInt(),
        senderID!.toInt(),
        receiverID!.toInt(),
        senderCompanyID!.toInt(),
        senderSiteID!.toInt(),
        subjectDocument.text,
        gettedFile,
        remarks.text,
      )
          .then((value) {
        Get.off(DocumentDeliveryListScreen());
        Get.showSnackbar(GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: "Save Success",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ));
      });
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Save Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }

  getSingleFile() async {
    // Pick an file
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      gettedFile = File(result.files.single.path ?? "Not Attached");
      PlatformFile nameFile = result.files.first;
      attachment.text = nameFile.name;
      update();
    } else {
      // User canceled the picker
    }
  }
}
