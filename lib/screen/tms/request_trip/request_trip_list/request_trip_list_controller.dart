import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/reference/get_document_code_model.dart' as doc;
import 'package:gais/data/model/request_trip/request_trip_list_model.dart' as requests;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestTripListController extends BaseController {
  bool isLoading = false;
  int? requestorID;

  final TextEditingController dateRange = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat rangeFormat = DateFormat("yyyy-MM-dd");
  String? purposeValue;
  String searchValue = "All";
  String? startDate;
  String? endDate;
  bool showFilter = false;
  bool dataisnull = false;
  bool searchNotFound = false;
  int currentPage = 1;
  int perPage = 5;

  requests.RequestTripListModel? rtlModel;
  List<requests.Data2> requestList = [];
  List<doc.Data> documentList = <doc.Data>[].obs;
  List<doc.Data> selectedPurpose = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchData(), fetchList()]);
    update();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchData() async {
    await storage.readEmployeeInfo().then((value) {
      requestorID = value.first.id?.toInt();
    });

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
        searchValue=="All" ? "" : searchValue,
        startDate,
        endDate,
      );
      rtlModel = requestTrip;
      requestList.addAll(rtlModel?.data?.data?.where((e) => e.idEmployee == requestorID).toSet().toList() ?? []);
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

  Future<void> delete(int id) async {
    isLoading = true;
    try {
      await repository.deletePurposeOfTrip(id).then((value) {

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
