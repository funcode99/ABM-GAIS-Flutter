import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/reference/get_document_code_model.dart' as doc;
import 'package:gais/data/model/approval_request_trip/get_approval_request_trip_model.dart' as requests;

class ApprovalRequestTripListController extends BaseController {

  final formKey = GlobalKey<FormState>();
  final dateRange = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat rangeFormat = DateFormat("yyyy-MM-dd");
  String? purposeValue;
  String? searchValue;
  String? startDate;
  String? endDate;
  String? codeStatusDoc;
  bool isLoading = false;
  bool showFilter = false;
  bool dataisnull = false;
  bool searchNotFound = false;
  int currentPage = 1;
  int perPage = 10;

  requests.GetApprovalRequestTripModel? rtlModel;
  List<requests.Data> requestList = [];
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
      var requestTrip = await approvalRequestTrip.getList(
        perPage,
        currentPage,
        searchValue,
        startDate,
        endDate,
        codeStatusDoc
      );
      rtlModel = requestTrip;
      requestList.addAll(rtlModel?.data?.toSet().toList() ?? []);
      isLoading = false;
      // searchNotFound = rtlModel?.data?.isEmpty ?? false;

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
    } catch (e,i) {
      dataisnull = true;
      isLoading = false;
      e.printError();
      i.printError();
    }
    update();
  }
}
