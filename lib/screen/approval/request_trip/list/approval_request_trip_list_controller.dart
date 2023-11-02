import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_request_trip/get_approval_request_trip_model.dart' as requests;
import 'package:gais/data/model/reference/get_document_code_model.dart' as doc;
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApprovalRequestTripListController extends BaseController{

  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();
  final purposeValue = "".obs;
  final purposeValueTemp = "".obs;


  final listHeader = <requests.Data2>[].obs;
  final documentList = <doc.Data>[].obs;

  final keyword = "".obs;

  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;
  final isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getHeader();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    documentList.clear();
    await repository.getDocumentCodeList().then((value) {
      documentList.add(doc.Data(id: 0, codeDocument: "", documentName: "All", isSelected: true));
      documentList.addAll(value.data?.toSet().toList() ?? []);
    });
  }

  void getHeader({int page = 1}) async {
    isLoading(true);
    try {
      final result = await approvalRequestTrip.getList(
          limit,
          page,
          keyword.value,
          startDate.value != null ? formatFilter.format(startDate.value!) : "",
          endDate.value != null ? formatFilter.format(endDate.value!) : "",
          purposeValue.value,
      );

      int total = result.data!.total!.toInt();
      int tempTotalPage = (total/limit).ceil();
      totalPage(tempTotalPage);
      currentPage(result.data?.currentPage?.toInt());
      isLoading(false);
      listHeader.value = result.data!.data!;
      listHeader.refresh();

      // searchNotFound = rtlModel?.data?.isEmpty ?? false;
    } catch (e, i) {
      Get.showSnackbar(
          CustomGetSnackBar(message: "Data not found", backgroundColor: Colors.red));
      listHeader.clear();
      totalPage(1);
      currentPage(1);
      isLoading(false);
    }
  }

  void applySearch(String search){
    keyword(search);
    getHeader(page: 1);
  }

  void resetFilter(){
    endDateTemp.value = null;
    startDateTemp.value = null;
    dateRangeController.text = "";
    purposeValueTemp.value = "";
  }

  void openFilter(){
    startDateTemp.value = startDate.value;
    endDateTemp.value = endDate.value;
    if(DateUtils.isSameDay(startDateTemp.value, endDateTemp.value)){
      endDateTemp.value = null;
    }

    if(startDateTemp.value!=null){
      dateRangeController.text = "${dateFormat.format(startDate.value!)} - ${dateFormat.format(endDate.value!)}";
    }else{
      dateRangeController.text = "";
    }
    purposeValueTemp.value = purposeValue.value;

  }

  void applyFilter(){
    startDate.value = startDateTemp.value;
    endDate.value = endDateTemp.value;
    purposeValue.value = purposeValueTemp.value;

    getHeader();
  }
}