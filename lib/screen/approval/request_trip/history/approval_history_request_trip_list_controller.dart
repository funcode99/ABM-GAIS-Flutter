import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_cash_advance/approval_cash_advance_model.dart';
import 'package:gais/data/model/master/status_doc/status_doc_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_travel_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/reference/get_document_code_model.dart' as doc;
import 'package:gais/data/model/approval_request_trip/get_approval_request_trip_model.dart' as requests;

class ApprovalHistoryRequestTripListController extends BaseController{

  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();
  final purposeValue = "".obs;
  final purposeValueTemp = "".obs;

  final listStatus = <StatusDocModel>[].obs;
  final selectedStatusTemp = Rxn<StatusDocModel>();
  final selectedStatus = Rxn<StatusDocModel>();

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
    listStatus.add(StatusDocModel(code: "", status: "Status"));
    listStatus.add(StatusDocModel(code: 0, status: "Draft"));
    listStatus.add(StatusDocModel(code: 1, status: "Waiting Approval"));
    listStatus.add(StatusDocModel(code: 2, status: "Revision"));
    listStatus.add(StatusDocModel(code: 3, status: "Cancelled"));
    listStatus.add(StatusDocModel(code: 4, status: "Expired"));
    listStatus.add(StatusDocModel(code: 5, status: "Confirmed"));
    listStatus.add(StatusDocModel(code: 6, status: "Order Ticket"));
    listStatus.add(StatusDocModel(code: 7, status: "Waiting GA Issued"));
    listStatus.add(StatusDocModel(code: 8, status: "Ticket Is Being Edited"));
    listStatus.add(StatusDocModel(code: 9, status: "Rejected"));
    listStatus.add(StatusDocModel(code: 10, status: "Completed"));
    // final statuses = await getListStatusDoc();
    // listStatus.addAll(statuses);
    onChangeSelectedStatus("");

    documentList.clear();
    await repository.getDocumentCodeList().then((value) {
      documentList.add(doc.Data(id: 0, codeDocument: "", documentName: "All", isSelected: true));
      documentList.addAll(value.data?.toSet().toList() ?? []);
    });
  }

  void getHeader({int page = 1}) async {
    isLoading(true);
    try {
      final result = await approvalRequestTrip.getApprovalHistoryList(
        limit,
        page,
        keyword.value,
        startDate.value != null ? formatFilter.format(startDate.value!) : "",
        endDate.value != null ? formatFilter.format(endDate.value!) : "",
        purposeValue.value,
        selectedStatus.value?.code.toString()?? ""
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
    onChangeSelectedStatus("");
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

    selectedStatusTemp.value = selectedStatus.value;
    purposeValueTemp.value = purposeValue.value;

  }

  void applyFilter(){
    startDate.value = startDateTemp.value;
    endDate.value = endDateTemp.value;
    selectedStatus.value = selectedStatusTemp.value;
    purposeValue.value = purposeValueTemp.value;

    getHeader();
  }

  void onChangeSelectedStatus(String id) {
    final selected = listStatus.firstWhere((item) => item.code.toString() == id.toString());
    selectedStatusTemp(selected);
  }
}