import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/document_delivery/get_document_delivery_model.dart' as dd;
import 'package:gais/data/model/reference/get_status_document_model.dart' as status;
import 'package:gais/data/storage_core.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DocumentDeliveryListController extends BaseController {
  bool isLoading = false;
  bool isSuperadmin = false;
  bool isReceptionist = false;
  int? requestorID;
  String employeeId = "";
  String? requestorName;

  final formKey = GlobalKey<FormState>();
  final TextEditingController dateRange = TextEditingController();
  final TextEditingController seacrch = TextEditingController();
  final keyword = "".obs;

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
    Future.wait([fetchData(), fetchList(1)]);
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

  void clearSearch(String search) {
    keyword(search);
    currentPage = 1;
    fetchList(1);
    update();
  }

  Future<void> fetchData() async {
    String codeRole = await storage.readString(StorageCore.codeRole);
    isSuperadmin = codeRole == RoleEnum.superAdmin.value;
    isReceptionist = codeRole == RoleEnum.receptionist.value;

    await storage.readEmployeeInfo().then((value) {
      requestorID = value.first.id?.toInt();
      requestorName = value.first.employeeName;
      employeeId = value.first.id?.toString() ?? "";
      update();
    });

    statusList = [];
    await repository.getStatusDocument().then((value) {
      statusList.add(status.Data(code: -1, status: "All", codeDocument: "DOCDL"));
      statusList.addAll(value.data?.where((e) => e.codeDocument == "DOCDL").toSet().toList() ?? []);
      print(statusList.first.code);
    });
  }

  Future<void> fetchList(int page) async {
    ddList = [];
    isLoading = true;
    try {
      var response = await documentDelivery.getList(
        perPage,
        page,
        searchValue,
        startDate,
        endDate,
        filterStatus != "-1" ? filterStatus : "",
      );
      ddModel = response;
      ddList.addAll(ddModel?.data?.data?.toSet().toList() ?? []);
      isLoading = false;
      searchNotFound = ddModel?.data?.data?.isEmpty ?? false;
      dataisnull = ddList.isEmpty;
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

  Future<void> deleteDocumentDelivery(String id) async {
    isLoading = true;
    try {
      await documentDelivery.delete(id).then((value) {
        Get.showSnackbar(const GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Deleted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        ));
        fetchList(currentPage);
      });
      isLoading = false;
      update();
    } catch (e) {
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }
}
