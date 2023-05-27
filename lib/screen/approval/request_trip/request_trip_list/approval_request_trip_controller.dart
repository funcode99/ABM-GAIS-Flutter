import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/reference/get_document_code_model.dart' as doc;
import 'package:gais/data/model/request_trip/request_trip_list_model.dart' as requests;

class ApprovalRequestTripListController extends BaseController {
  final TextEditingController dateRange = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat rangeFormat = DateFormat("yyyy-MM-dd");
  String? purposeValue;
  String searchValue = "All";
  String? startDate;
  String? endDate;
  bool isLoading = false;
  bool showFilter = false;
  bool dataisnull = false;
  bool searchNotFound = false;
  int currentPage = 1;
  int perPage = 5;

  requests.RequestTripListModel? rtlModel;
  List<requests.Data2> requestList = [];
  List<doc.Data> documentList = <doc.Data>[].obs;

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchData(), fetchList()]);
  }

  Future<void> fetchData() async {
    documentList = [];
    await repository.getDocumentCodeList().then((value) {
      documentList.add(doc.Data(id: 0, documentName: "All", isSelected: true));
      documentList.addAll(value.data?.toSet().toList() ?? []);
    });
  }

  Future<void> fetchList() async {
    requestList = [];
    isLoading = true;
    try {
      var requestTrip = await repository.getRequestTripList(
        perPage,
        currentPage,
        searchValue == "All" ? "" : searchValue,
        startDate,
        endDate,
      );
      rtlModel = requestTrip;
      requestList.addAll(rtlModel?.data?.data?.toSet().toList() ?? []);
      isLoading = false;
      searchNotFound = rtlModel?.data?.data?.isEmpty ?? false;

      if (searchNotFound == true) {
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Search Not found',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
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
      dataisnull = true;
      isLoading = false;
      e.printError();
    }
    update();
  }
}
