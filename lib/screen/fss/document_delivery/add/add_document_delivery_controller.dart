import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_employee_model.dart' as receiver;
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
  int? siteID;
  int? companyID;
  int? receiverID;
  String? selectedReceiver;
  File? gettedFile;

  // String? location;

  List<receiver.Data> receiverList = [];

  @override
  void onInit() {
    super.onInit();
    fetchList();
  }

  Future<void> fetchList() async {
    receiverList = [];
    try {
      await storage.readEmployeeInfo().then((value) {
        sender.text = value.first.employeeName ?? "";
        senderID = value.first.id?.toInt();
      });

      await repository.getEmployeeList().then((value) {
        receiverList.addAll(value.data?.where((e) => e.id != senderID).toSet().toList() ?? []);
      });
    } catch (e) {
      e.printError();
    }

    update();
  }

  Future<void> saveDocument() async {
    try {
      await documentDelivery
          .save(
        companyID!.toInt(),
        senderID!.toInt(),
        receiverID!.toInt(),
        siteID!.toInt(),
        subjectDocument.text,
        gettedFile,
        remarks.text,
      )
          .then((value) {
        Get.off(DocumentDeliveryListScreen());
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: "Save Success",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.green,
        );
      });
    } catch (e, i) {
      e.printError();
      i.printError();
      const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Save Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
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
