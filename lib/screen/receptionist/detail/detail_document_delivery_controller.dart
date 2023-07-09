import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_employee_model.dart' as receiver;
import 'package:gais/data/model/reference/get_site_model.dart' as site;

class DetailDocumentDeliveryController extends BaseController {
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
  int? receiverSiteID;
  int? receiverCompanyID;
  int? receiverID;
  int? codeStatusDoc;
  int? senderCompanyID;
  int? senderSiteID;
  String? selectedReceiver;
  String? receiverName;
  String? noDocument;
  String? receiverCompany;
  String? receiverSite;
  File? gettedFile;

  bool isEdit = false;
  bool isReceived = false;
  bool isDelivered = false;
  bool isDelivering = false;
  bool loadCompany = false;
  bool loadLocation = false;
  bool loadReceiver = false;

  List<receiver.Data> receiverList = [];
  List<comp.Data> companyList = [];
  List<site.Data> locationList = [];


  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchEdit(), fetchList()]);
    print('ddID : $ddID');
  }

  Future<void> fetchList() async {
    loadCompany = true;
    companyList = [];
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

      await repository.getSiteList().then((value) {
        locationList.addAll(value.data?.toSet().toList() ?? []);
      });

    } catch (e, i) {
      e.printError();
      i.printError();
    }
    loadCompany = false;
    update();
  }

  Future<void> fetchEdit() async {
    codeStatusDoc = null;
    isReceived = false;
    isDelivering = false;
    isDelivered = false;

    try {
      await documentDelivery.getByID(ddID!).then((value) {
        DateTime? tempDate;
        noDocument = value.data?.first.noDocumentDelivery;
        senderID = value.data?.first.idEmployeeSender?.toInt();
        sender.text = value.data?.first.senderName.toString() ?? "";
        selectedReceiver = value.data?.first.idEmployeeReceiver.toString();
        receiverID = value.data?.first.idEmployeeReceiver?.toInt();
        receiverName = value.data?.first.receiverName.toString();
        location.text = value.data?.first.nameSiteReceiver ?? "";
        receiverSiteID = value.data?.first.idSiteReceiver?.toInt();
        company.text = value.data?.first.nameCompanyReceiver ?? "";
        receiverCompanyID = value.data?.first.idCompanyReceiver?.toInt();
        subjectDocument.text = value.data?.first.subject ?? "";
        attachment.text = (value.data?.first.attachment != "{}" ? value.data?.first.attachment :  "no attachment").toString();
        remarks.text = value.data?.first.remarks ?? "";
        tempDate = DateTime.parse(value.data?.first.createdAt ?? "");
        createdDate.text = dateFormat.format(tempDate);
        createdBy.text = value.data?.first.senderName ?? "";
        codeStatusDoc = value.data?.first.codeStatusDoc?.toInt();
        receiverSite = value.data?.first.nameSiteReceiver ?? "";
        receiverCompany = value.data?.first.nameCompanyReceiver ?? "";
        senderCompanyID = value.data?.first.idCompany?.toInt();
        senderSiteID = value.data?.first.idSite?.toInt();
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
    } catch (e,i) {
      e.printError();
      i.printError();
    }
    fetchReceiverList(receiverSiteID!);
    update();

  }

  Future<void> fetchLocationList(int id) async {
    loadLocation = true;
    locationList = [];
    try {
      await repository.getSiteListByCompanyID(id).then((value) {
        locationList.addAll(value.data?.toSet().toList() ?? []);
      });
    } catch (e) {
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
          .update(
        ddID!.toInt(),
        receiverCompanyID!,
        receiverSiteID!,
        senderID!.toInt(),
        receiverID!.toInt(),
        senderCompanyID!,
        senderSiteID!,
        subjectDocument.text.toString(),
        gettedFile!,
        remarks.text,
        codeStatusDoc!.toInt(),
      )
          .then((value) {
        // Get.off(DocumentDeliveryListScreen());
        print(value.message);
        isEdit = false;
        update();
        fetchEdit();
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
    update();
  }

  getSingleFile() async {
    // Pick an file
    // FilePickerResult? result = await FilePicker.platform.pickFiles();
    //
    // if (result != null) {
    //   gettedFile = File(result.files.single.path ?? "Not Attached");
    //   PlatformFile nameFile = result.files.first;
    //   attachment.text = nameFile.name;
    //   update();
    // } else {
    //   // User canceled the picker
    // }
  }
}
