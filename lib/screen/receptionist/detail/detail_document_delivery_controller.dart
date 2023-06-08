import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';

class DetailDocumentDeliveryController extends BaseController{
  int? ddID = Get.arguments['id'];

  final formKey = GlobalKey<FormState>();
  final createdDate = TextEditingController();
  final createdBy = TextEditingController();
  final sender = TextEditingController();
  final location = TextEditingController();
  final company = TextEditingController();
  final subjectDocument = TextEditingController();
  final attachment = TextEditingController();
  final remarks = TextEditingController();
  final receiverName = TextEditingController();

  int? senderID;
  int? siteID;
  int? companyID;
  int? receiverID;
  int? codeStatusDoc;
  String? selectedReceiver;


  bool isEdit = false;
  bool isReceived = false;
  bool isDelivered = false;
  bool isDelivering = false;


  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchEdit()]);
  }

  Future<void> fetchEdit() async {
    try {
      await documentDelivery.getByID(ddID!).then((value) {
        senderID = value.data?.first.idEmployeeSender?.toInt();
        sender.text = value.data?.first.idEmployeeSender.toString() ?? "";
        selectedReceiver = value.data?.first.idEmployeeReceiver.toString();
        receiverID = value.data?.first.idEmployeeReceiver?.toInt();
        receiverName.text = value.data?.first.idEmployeeReceiver.toString() ?? "";
        location.text = value.data?.first.siteName ?? "";
        siteID = value.data?.first.idSite?.toInt();
        company.text = value.data?.first.companyName ?? "";
        companyID = value.data?.first.idCompany?.toInt();
        subjectDocument.text = value.data?.first.subject ?? "";
        attachment.text = value.data?.first.attachment ?? "";
        remarks.text = value.data?.first.remarks ?? "";
        createdDate.text = value.data?.first.createdAt.toString().substring(0, 10) ?? "";
        createdBy.text = value.data?.first.createdBy ?? "";
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
        null,
        remarks.text,
        codeStatusDoc!.toInt(),
      )
          .then((value) {
        // Get.off(DocumentDeliveryListScreen());
        print(value.message);
        isEdit = false;
        update();
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: "Update Success",
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
        message: "Update Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
    }
  }



}