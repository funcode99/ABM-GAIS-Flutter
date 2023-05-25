import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart'
    as requests;
import 'package:gais/reusable/loadingdialog.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestTripListController extends BaseController {
  bool isLoading = true;
  int? requestorID;

  final TextEditingController dateRange = TextEditingController();
  final TextEditingController search = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  String? purposeValue;
  DateTime? startDate;
  DateTime? endDate;
  bool showFilter = false;
  bool dataisnull = false;
  int currentPage = 1;
  int perPage = 5;

  requests.RequestTripListModel? rtlModel;
  List<requests.Data2> requestList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    requestList = [];

    try {
      await storage.readEmployeeInfo().then((value) {
        requestorID = value.first.id?.toInt();
      });

      var requestTrip =
          await repository.getRequestTripList(perPage, currentPage);
      rtlModel = requestTrip;
      requestList.addAll(rtlModel?.data?.data
              ?.where((e) => e.idEmployee == requestorID)
              .toSet()
              .toList() ??
          []);
      isLoading = false;
      update();
    } catch (e) {
      dataisnull = true;
      isLoading = false;
      update();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Data Empty',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> delete(int id) async {
    isLoading = true;
    try {
      await repository.deletePurposeOfTrip(id).then((value) {
        fetchList();
        GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Deleted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        );
      });
      isLoading = false;
      update();
    } catch (e) {
      GetSnackBar(
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
