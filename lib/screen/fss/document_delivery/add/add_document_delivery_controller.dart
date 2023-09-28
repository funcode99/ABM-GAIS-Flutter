import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_employee_bysite_model.dart' as receiver;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/screen/fss/document_delivery/document_delivery_list/document_delivery_list_screen.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class AddDocumentDeliveryController extends BaseController with MasterDataMixin{
  final formKey = GlobalKey<FormState>();
  final sender = TextEditingController();
  final location = TextEditingController();
  final company = TextEditingController();
  final subjectDocument = TextEditingController();
  final attachment = TextEditingController();
  final remarks = TextEditingController();
  late TextEditingController autocompleteController = TextEditingController();

  String? senderID;
  String? senderCompanyID;
  String? senderSiteID;
  String? receiverID;
  String? receiverCompanyID;
  String? receiverSiteID;
  String? selectedReceiver;
  File? gettedFile;
  bool loadCompany = false;
  bool loadLocation = false;
  bool loadReceiver = false;

  List<receiver.Data> receiverList = [];
  List<EmployeeModel> employeeList = [];
  List<comp.Data> companyList = [];
  List<site.Data> locationList = [];
  List<comp.Data> receiverCompanyList = [];

  // List<site.Data> locationList = [];

  bool showReceiverError = false;
  EmployeeModel? selectedEmployee;

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
        senderID = value.first.id.toString();
        senderCompanyID = value.first.idCompany.toString();
        senderSiteID = value.first.idSite.toString();
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

  // await repository.getCompanyList().then((value) {
  //   receiverCompanyList.addAll(value.data?.toSet().toList() ?? []);
  Future<void> fetchLocationList(String id) async {
    loadLocation = true;
    locationList = [];
    update();
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
          .save(
        receiverCompanyID!,
        receiverSiteID!,
        senderID!,
        receiverID!,
        senderCompanyID!,
        senderSiteID!,
        subjectDocument.text,
        gettedFile,
        remarks.text,
      )
          .then((value) {
        Get.off(const DocumentDeliveryListScreen());
        Get.showSnackbar(const GetSnackBar(
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
      Get.showSnackbar(const GetSnackBar(
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

  void onChangeSelectedReceiver(String id) async{
    final selected = employeeList.firstWhere(
            (item) => item.id.toString() == id.toString(),
        orElse: () => employeeList.first);

    selectedEmployee = selected;
    EmployeeModel? detailEmployee = await getEmployeeById(selectedEmployee?.id);
    if(detailEmployee!=null){
      company.text = detailEmployee.companyName ?? "";
      location.text = detailEmployee.siteName ?? "";
    }

    update();
  }

  Future<List<EmployeeModel>> getEmployeeByKeyword(String keyword)async{

    employeeList.clear();
    final employees = await getListEmployeeByKeyword(keyword);
    employeeList.addAll(employees);

    return employeeList;
  }

}
