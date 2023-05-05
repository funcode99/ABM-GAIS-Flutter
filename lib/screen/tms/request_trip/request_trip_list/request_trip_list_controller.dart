import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_trip/request_trip_list_model.dart' as requests;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestTripListController extends BaseController{
  final TextEditingController dateRange = TextEditingController();
  final TextEditingController search = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  String? purposeValue;
  DateTime? startDate;
  DateTime? endDate;
  bool showFilter = false;
  bool dataisnull = false;
  int currentPage = 1;

  requests.RequestTripListModel? rtlModel;
  List<requests.Data> requestList = [];

  @override
  void onInit() {
    super.onInit();
    dateRange.text = "10/03/2023 - 17/03/2023";
    currentPage = 1;

    Future.wait([
      fetchList()
    ]);

  }

  Future<void> fetchList() async{
    requestList = [];

    try {
      var data = await repository.getRequestTripList();
      rtlModel = data;
      requestList.addAll(data?.data?.toSet().toList() ?? []);
      update();
    } catch (e) {
      dataisnull = true;
      update();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Gagal Load Data',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

}