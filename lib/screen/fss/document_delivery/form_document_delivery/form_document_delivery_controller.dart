import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:gais/data/model/reference/get_employee_model.dart' as receiver;
import 'package:intl/intl.dart';

class FormDocumentDeliveryController extends BaseController {
  int? ddID = Get.arguments['id'];

  final formKey = GlobalKey<FormState>();
  final createdDate = TextEditingController();
  final createdBy = TextEditingController();
  final receivedBy = TextEditingController();
  final sender = TextEditingController();
  final location = TextEditingController();
  final company = TextEditingController();
  final subjectDocument = TextEditingController();
  final attachment = TextEditingController();
  final remarks = TextEditingController();

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  int? senderID;
  int? siteID;
  int? companyID;
  int? receiverID;
  int? codeStatusDoc;
  String? selectedReceiver;
  String? receiverName;
  File? gettedFile;

  bool isEdit = false;
  bool isReceived = false;
  bool isDelivered = false;
  bool isDelivering = false;

  List<receiver.Data> receiverList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchEdit(), fetchList()]);
  }

  Future<void> fetchList() async {
    receiverList = [];
    try {
      await repository.getEmployeeList().then((value) {
        receiverList.addAll(value.data?.where((e) => e.id != senderID).toSet().toList() ?? []);
      });
    } catch (e) {
      e.printError();
    }

    update();
  }

  Future<void> fetchEdit() async {
    try {
      await documentDelivery.getByID(ddID!).then((value) {
        DateTime? tempDate;
        senderID = value.data?.first.idEmployeeSender?.toInt();
        sender.text = value.data?.first.senderName.toString() ?? "";
        selectedReceiver = value.data?.first.idEmployeeReceiver.toString();
        receiverID = value.data?.first.idEmployeeReceiver?.toInt();
        receiverName = value.data?.first.receiverName.toString();
        location.text = value.data?.first.siteName ?? "";
        siteID = value.data?.first.idSite?.toInt();
        company.text = value.data?.first.companyName ?? "";
        companyID = value.data?.first.idCompany?.toInt();
        subjectDocument.text = value.data?.first.subject ?? "";
        attachment.text = value.data?.first.attachment ?? "";
        remarks.text = value.data?.first.remarks ?? "";
        tempDate = DateTime.parse(value.data?.first.createdAt ?? "");
        createdDate.text = dateFormat.format(tempDate);
        createdBy.text = value.data?.first.senderName ?? "";
        codeStatusDoc = value.data?.first.codeStatusDoc?.toInt();
        if (codeStatusDoc == 1) {
          isReceived = true;
        } else if (codeStatusDoc == 2) {
          isReceived = true;
          isDelivering = true;
        } else if (codeStatusDoc == 3) {
          isReceived = true;
          isDelivering = true;
          isDelivered = true;
        }
      });
    } catch (e) {
      e.printError();
    }

    update();
  }

  Future<void> saveDocument() async {
    try {
      await documentDelivery
          .update(
        ddID!.toInt(),
        companyID!.toInt(),
        senderID!.toInt(),
        receiverID!.toInt(),
        siteID!.toInt(),
        subjectDocument.text,
        gettedFile,
        remarks.text,
        codeStatusDoc!.toInt(),
      )
          .then((value) {
        // Get.off(DocumentDeliveryListScreen());
        print(value.message);
        isEdit = false;
        update();
        Get.showSnackbar(const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: "Update Success",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        ));
      });
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Update Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
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
