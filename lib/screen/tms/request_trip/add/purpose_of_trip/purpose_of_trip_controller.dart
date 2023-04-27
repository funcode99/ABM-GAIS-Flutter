import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class PurposeOfTripController extends BaseController{
  final formKey = GlobalKey<FormState>();
  final notesPurpose = TextEditingController();
  final fileName = TextEditingController();

  String? purposeValue;
  bool? isAttachment = false;

  getSingleFile() async{
    // Pick an file
    FilePickerResult? result = await FilePicker.platform.pickFiles();


    if (result != null) {
      File file = File(result.files.single.path ?? "Not Attached");
      PlatformFile nameFile = result.files.first;
      fileName.text = nameFile.name;
      update();
    } else {
      // User canceled the picker
    }
  }

  @override
  void onInit() {
    super.onInit();
    notesPurpose.text;
    fileName.text;
  }

  @override
  void dispose() {
    super.dispose();
    notesPurpose.dispose();
    fileName.dispose();
  }

}