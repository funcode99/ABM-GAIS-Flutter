import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/document_delivery/get_document_delivery_model.dart' as dd;
import 'package:gais/data/model/reference/get_status_document_model.dart' as status;


class ListDocumentDeliveryController extends BaseController{
  bool isLoading = false;
  int? requestorID;
  String? requestorName;

  final formKey = GlobalKey<FormState>();
  final TextEditingController dateRange = TextEditingController();
  final TextEditingController seacrch = TextEditingController();


  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat rangeFormat = DateFormat("yyyy-MM-dd");
  String filterStatus = "-1";
  String? searchValue;
  String? startDate;
  String? endDate;
  bool showFilter = false;
  bool dataisnull = false;
  bool searchNotFound = false;
  int currentPage = 1;
  int perPage = 10;
  int lastNumber = 1;

  dd.GetDocumentDeliveryModel? ddModel;
  List<dd.Data2> ddList = [];
  List<status.Data> statusList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchData(), fetchList()]);
  }

  @override
  void dispose() {
    super.dispose();
  }

  void resetFilter() {
    formKey.currentState?.reset();
    filterStatus = "-1";
    dateRange.text = "";
    startDate = null;
    endDate = null;
    update();

    print(filterStatus);
  }

  Future<void> fetchData() async {
    await storage.readEmployeeInfo().then((value) {
      requestorID = value.first.id?.toInt();
      requestorName = value.first.employeeName;
      update();
    });

    statusList = [];
    await repository.getStatusDocument().then((value) {
      statusList.add(status.Data(code: -1, status: "All", codeDocument: "DOCDL"));
      statusList.addAll(value.data?.where((e) => e.codeDocument == "DOCDL").toSet().toList() ?? []);
      print(statusList.first.code);
    });
  }

  Future<void> fetchList() async {
    ddList = [];
    isLoading = true;
    try {
      var response = await documentDelivery.getList(
        perPage,
        currentPage,
        searchValue,
        startDate,
        endDate,
        filterStatus != "-1" ? filterStatus : "",
      );
      ddModel = response;
      ddList.addAll(ddModel?.data?.data?.toSet().toList() ?? []);
      isLoading = false;
      searchNotFound = ddModel?.data?.data?.isEmpty ?? false;
      dataisnull = ddList.isEmpty ?? false;
      print("data null $dataisnull");
      print("reqList: ${ddList.length.toString()}");
      update();
    } catch (e) {
      dataisnull = true;
      searchNotFound = true;
      isLoading = false;
      e.printError();
      update();
    }
  }

  Future<void> deleteDocumentDelivery(int id) async {
    isLoading = true;
    try {
      await documentDelivery.delete(id).then((value) {
        const GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Deleted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        );
        fetchList();
      });
      isLoading = false;
      update();
    } catch (e) {
      const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
    }
  }

}