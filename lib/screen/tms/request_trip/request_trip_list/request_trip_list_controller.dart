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
  String? requestorName;

  final formKey = GlobalKey<FormState>();
  final TextEditingController dateRange = TextEditingController();
  final keyword = "".obs;

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateFormat rangeFormat = DateFormat("yyyy-MM-dd");
  String purposeValue = "All";
  String? searchValue;
  String? startDate;
  String? endDate;
  bool showFilter = false;
  bool dataisnull = false;
  bool searchNotFound = false;
  int currentPage = 1;
  int perPage = 10;
  int lastNumber = 1;

  requests.RequestTripListModel? rtlModel;
  List<requests.Data2> requestList = [];
  List<doc.Data> documentList = <doc.Data>[].obs;
  doc.GetDocumentCodeModel? documentModel;
  List<doc.Data> selectedPurpose = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchData(), fetchList(currentPage)]);
    print("height: ${Get.height}");
    print("width: ${Get.width}");
  }

  @override
  void dispose() {
    super.dispose();
  }

  void resetFilter() {
    formKey.currentState?.reset();
    purposeValue = "All";
    dateRange.text = "";
    update();
  }

  void clearSearch(String search) {
    keyword(search);
    currentPage = 1;
    fetchList(1);
    update();
  }

  Future<void> fetchData() async {
    await storage.readEmployeeInfo().then((value) {
      requestorID = value.first.id?.toInt();
      requestorName = value.first.employeeName;
      update();
      print("employee Name : $requestorName");
    });

    documentList = [];
    var document = await repository.getDocumentCodeList();
    documentList.add(doc.Data(id: 0, documentName: "All", isSelected: true));
    documentList.addAll(document.data?.toSet().toList() ?? []);
    documentModel = document;
  }

  Future<void> fetchList(int page) async {
    requestList = [];

    isLoading = true;
    try {
      var requesttrip = await requestTrip.getRequestTripList(
          perPage,
          page,
          searchValue != null
              ? searchValue
              : purposeValue == "All"
                  ? ""
                  : purposeValue,
          startDate,
          endDate);
      rtlModel = requesttrip;
      requestList.addAll(rtlModel?.data?.data?.toSet().toList() ?? []);
      isLoading = false;
      searchNotFound = rtlModel?.data?.data?.isEmpty ?? false;
      dataisnull = rtlModel!.success == false ? true : false;
      print("data null $dataisnull");
      print("reqList: ${requestList.length.toString()}");

      // if (searchNotFound == true) {
      //   Get.showSnackbar(
      //     const GetSnackBar(
      //       icon: Icon(
      //         Icons.error,
      //         color: Colors.white,
      //       ),
      //       message: 'Search Not found',
      //       isDismissible: true,
      //       duration: Duration(seconds: 3),
      //       backgroundColor: Colors.red,
      //     ),
      //   );
      // }
    } catch (e, i) {
      dataisnull = true;
      searchNotFound = true;
      isLoading = false;
      i.printError();
      e.printError(info: "=> getError");
    }
    update();
  }

  Future<void> delete(String id) async {
    isLoading = true;
    try {
      await requestTrip.deleteRequestTrip(id).then((value) {
        fetchList(currentPage);
      });
      Get.showSnackbar(GetSnackBar(
        icon: Icon(
          Icons.info,
          color: Colors.white,
        ),
        message: "Data Deleted",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: greenColor,
      ));
      isLoading = false;
    } catch (e) {
      Get.showSnackbar(GetSnackBar(
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
    update();
  }
}
