import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_employee_bysite_model.dart'
    as receiver;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/dialog/cancel_dialog.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormDocumentDeliveryController extends BaseController {
  String? ddID = Get.arguments['id'];

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
  String? userSiteID;
  String? userCompanyID;
  String? senderID;
  String? receiverID;
  String? receiverSiteID;
  String? receiverCompanyID;
  String? codeStatusDoc;
  String? senderCompanyID;
  String? senderSiteID;
  String? selectedReceiver;
  String? receiverName;
  String? noDocument;
  String? receiverCompany;
  String? receiverSite;
  String? status;
  String? attachmentPath;
  File? gettedFile;

  bool isEdit = false;
  bool isReceived = false;
  bool isDelivered = false;
  bool isDelivering = false;
  bool loadCompany = false;
  bool loadLocation = false;
  bool loadReceiver = false;
  bool isSuperadmin = false;
  bool isReceptionist = false;

  bool showButtonCancel = false;
  bool showButtonEdit = false;
  bool showButtonReceived = false;
  bool showButtonDelivering = false;
  bool showButtonDelivered = false;

  String employeeId = "";

  List<receiver.Data> receiverList = [];
  List<comp.Data> companyList = [];
  List<site.Data> locationList = [];

  TabEnum selectedTab = TabEnum.detail;
  List<ApprovalLogModel> listLogApproval = [];
  ApprovalModel? approvalModel;
  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchEdit(), fetchList()]);
    print('ddID : $ddID');
  }

  Future<void> fetchList() async {
    loadCompany = true;
    companyList = [];

    String codeRole = await storage.readString(StorageCore.codeRole);
    isSuperadmin = codeRole == RoleEnum.superAdmin.value;
    isReceptionist = codeRole == RoleEnum.receptionist.value;

    try {
      await storage.readEmployeeInfo().then((value) {
        userCompanyID = value.first.idCompany?.toString();
        userSiteID = value.first.idSite?.toString();
        employeeId = value.first.id?.toString() ?? "";

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

    showButtonCancel = false;
    showButtonEdit = false;
    showButtonReceived = false;
    showButtonDelivering = false;
    showButtonDelivered = false;

    try {
      await documentDelivery.getByID(ddID!).then((value) {
        DateTime? tempDate;
        sender.text = value.data?.first.senderName.toString() ?? ""; //set sender field
        location.text = value.data?.first.nameSiteReceiver ?? "";
        company.text = value.data?.first.nameCompanyReceiver ?? "";
        subjectDocument.text = value.data?.first.subject ?? "";
        attachment.text = (value.data?.first.attachment != "{}"
            ? value.data?.first.attachment
            : "no attachment")
            .toString();
        remarks.text = value.data?.first.remarks ?? "";
        tempDate = DateTime.parse(value.data?.first.createdAt ?? "");
        createdDate.text = dateFormat.format(tempDate);
        createdBy.text = value.data?.first.senderName ?? "";
        receivedBy.text = value.data?.first.receiverName ?? "";


        noDocument = value.data?.first.noDocumentDelivery;
        senderID = value.data?.first.idEmployeeSender?.toString();
        selectedReceiver = value.data?.first.idEmployeeReceiver.toString();
        receiverID = value.data?.first.idEmployeeReceiver?.toString();
        receiverName = value.data?.first.receiverName.toString();
        receiverSiteID = value.data!.first.idSiteReceiver.toString();
        receiverCompanyID = value.data?.first.idCompanyReceiver?.toString();
        codeStatusDoc = value.data?.first.codeStatusDoc?.toString();
        status = value.data?.first.status?.toString();
        attachmentPath = value.data?.first.attachmentPath?.toString();
        receiverSite = value.data?.first.nameSiteReceiver ?? "";
        receiverCompany = value.data?.first.nameCompanyReceiver ?? "";
        senderCompanyID = value.data?.first.idCompany?.toString();
        senderSiteID = value.data?.first.idSite?.toString();
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


        //set button visibility
        if(codeStatusDoc.toString() == "0"){
          if(senderID == employeeId){
            showButtonCancel = true;
            showButtonEdit = true;
          }
          if((isSuperadmin || isReceptionist) && userSiteID.toString() == senderSiteID.toString()){
            showButtonCancel = true;
            showButtonEdit = true;
            showButtonReceived = true;
          }
        }

        if(codeStatusDoc.toString() == "1"){
          if((isSuperadmin || isReceptionist) && userSiteID.toString() == senderSiteID.toString()){
            showButtonCancel = true;
            showButtonEdit = true;
            showButtonDelivering = true;
          }
        }

        if(codeStatusDoc.toString() == "2"){
          if(receiverID == employeeId){
            showButtonDelivered = true;
          }
          if((isSuperadmin || isReceptionist) && userSiteID.toString() == receiverSiteID.toString()){
            showButtonDelivered = true;
          }
        }


        listLogApproval.clear();

        List<ApprovalLogModel> result = [];
        if (value.data?.first.nameCreated != null) {
          result.add(ApprovalLogModel(
              codeStatus: codeStatusDoc.toString().toInt(),
              notes: null,
              date: value.data?.first.createdAt,
              text: "Created by : ${value.data?.first.nameCreated}"));
        }

        if (value.data?.first.nameReceived != null) {
          result.add(ApprovalLogModel(
              codeStatus: codeStatusDoc.toString().toInt(),
              notes: null,
              date: value.data?.first.receivedAt,
              text: "Received by : ${value.data?.first.nameReceived}"));
        }

        if (value.data?.first.nameDelivering != null) {
          result.add(ApprovalLogModel(
              codeStatus: codeStatusDoc.toString().toInt(),
              notes: null,
              date: value.data?.first.deliveringAt,
              text: "Delivering by : ${value.data?.first.nameDelivering}"));
        }

        if (value.data?.first.nameDelivered != null) {
          result.add(ApprovalLogModel(
              codeStatus: codeStatusDoc.toString().toInt(),
              notes: null,
              date: value.data?.first.deliveredAt,
              text: "Delivered by : ${value.data?.first.nameDelivered}"));
        }

        if (value.data?.first.nameCancelled != null) {
          result.add(ApprovalLogModel(
              codeStatus: codeStatusDoc.toString().toInt(),
              notes: null,
              date: value.data?.first.cancelledAt,
              text: "Cancelled by : ${value.data?.first.nameCancelled}"));
        }

        listLogApproval.addAll(result);
      });
    } catch (e, i) {
      e.printError();
      i.printError();
    }
    fetchReceiverList(receiverSiteID!);
    update();
  }

  Future<void> fetchLocationList(String id) async {
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

  Future<void> fetchReceiverList(String id) async {
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
        ddID!.toString(),
        receiverCompanyID!,
        receiverSiteID.toString(),
        senderID!.toString(),
        receiverID!.toString(),
        senderCompanyID!,
        senderSiteID!,
        subjectDocument.text.toString(),
        gettedFile,
        remarks.text,
        codeStatusDoc!.toString(),
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

  Future<void> cancelDocument() async {
    try {
      await documentDelivery
          .cancel(
        ddID!.toString(),
        approvalModel?.notes
      )
          .then((value) {
            if(value){
              fetchEdit();
              Get.showSnackbar(const GetSnackBar(
                icon: Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                message: "Cancel Document Success",
                isDismissible: true,
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              ));
            }else{
              Get.showSnackbar(
                const GetSnackBar(
                  icon: Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  message: 'Cancel Document Failed',
                  isDismissible: true,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );
            }

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
          message: 'Cancel Document Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
    update();
  }
  Future<void> receivedDocument() async {
    try {
      await documentDelivery
          .received(
        ddID!.toString()
      )
          .then((value) {
            if(value){
              fetchEdit();
              Get.showSnackbar(const GetSnackBar(
                icon: Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                message: "Received Document Success",
                isDismissible: true,
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              ));
            }else{
              Get.showSnackbar(
                const GetSnackBar(
                  icon: Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  message: 'Received Document Failed',
                  isDismissible: true,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );
            }

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
          message: 'Received Document Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
    update();
  }
  Future<void> deliveringDocument() async {
    try {
      await documentDelivery
          .delivering(
        ddID!.toString()
      )
          .then((value) {
            if(value){
              fetchEdit();
              Get.showSnackbar(const GetSnackBar(
                icon: Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                message: "Delivering Document Success",
                isDismissible: true,
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              ));
            }else{
              Get.showSnackbar(
                const GetSnackBar(
                  icon: Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  message: 'Delivering Document Failed',
                  isDismissible: true,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );
            }

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
          message: 'Delivering Document Failed',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
    update();
  }
  Future<void> deliveredDocument() async {
    try {
      await documentDelivery
          .delivered(
        ddID!.toString()
      )
          .then((value) {
            if(value){
              fetchEdit();
              Get.showSnackbar(const GetSnackBar(
                icon: Icon(
                  Icons.error,
                  color: Colors.white,
                ),
                message: "Delivered Document Success",
                isDismissible: true,
                duration: Duration(seconds: 3),
                backgroundColor: Colors.green,
              ));
            }else{
              Get.showSnackbar(
                const GetSnackBar(
                  icon: Icon(
                    Icons.error,
                    color: Colors.white,
                  ),
                  message: 'Delivered Document Failed',
                  isDismissible: true,
                  duration: Duration(seconds: 3),
                  backgroundColor: Colors.red,
                ),
              );
            }

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
          message: 'Delivered Document Failed',
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

  openCancelDialog() async {
    ApprovalModel? result = await Get.dialog(const CancelDialog());

    if (result != null) {
      approvalModel =result;
      cancelDocument();
    }
  }
}
