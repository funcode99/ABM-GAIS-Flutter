import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class AddDocumentDeliveryController extends BaseController{
  final formKey = GlobalKey<FormState>();
  final sender = TextEditingController();
  final company = TextEditingController();
  final subjectDocument = TextEditingController();
  final attachment = TextEditingController();
  final remarks = TextEditingController();

  String? receiver;
  String? location;

  @override
  void onInit() {
    super.onInit();
  }

  getSubjectDocument() async{
    // Pick an file
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? "Not Attached");
      PlatformFile nameFile = result.files.first;
      subjectDocument.text = nameFile.name;
      update();
    } else {
      // User canceled the picker
    }
  }

  getAttachment() async{
    // Pick an file
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? "Not Attached");
      PlatformFile nameFile = result.files.first;
      attachment.text = nameFile.name;
      update();
    } else {
      // User canceled the picker
    }
  }


}