import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval/approval_actualization_trip_model.dart';
import 'package:gais/data/model/master/status_doc/status_doc_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApprovalHistoryActualizationTripListController extends BaseController{

  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();

  final NewActualizationTripRepository _repository = Get.find();
  final listHeader = <ApprovalActualizationTripModel>[].obs;

  final listStatus = <StatusDocModel>[].obs;
  final selectedStatusTemp = Rxn<StatusDocModel>();
  final selectedStatus = Rxn<StatusDocModel>();

  final keyword = "".obs;

  late PaginationModel? paginationModel;
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
    listStatus.add(StatusDocModel(code: 3, status: "Revision"));
    listStatus.add(StatusDocModel(code: 4, status: "Rejected"));
    listStatus.add(StatusDocModel(code: 10, status: "Completed"));
    // final statuses = await getListStatusDoc();
    // listStatus.addAll(statuses);
    onChangeSelectedStatus("");
  }

  void getHeader({int page = 1}) async {
    isLoading(true);
    final result = await _repository.getPaginationDataApprovalHistory(
        data: {
          "page" : page,
          "perPage" : limit,
          "search" : keyword.value,
          "start_date" : startDate.value != null ? formatFilter.format(startDate.value!) : "",
          "end_date" : endDate.value != null ? formatFilter.format(endDate.value!) : "",
          "status" : selectedStatus.value?.code ?? "",
        }
    );

    result.fold(
            (l) {
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
          listHeader.clear();
          totalPage(1);
          currentPage(1);
          isLoading(false);
        },
            (r) {
          paginationModel = r;
          int tempTotalPage = (paginationModel!.total!/limit).ceil();
          totalPage(tempTotalPage);
          currentPage(paginationModel?.currentPage);
          isLoading(false);

          listHeader.value = paginationModel!.data!
              .map((e) => ApprovalActualizationTripModel.fromJson(e))
              .toList();
          listHeader.refresh();
        });
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

  }

  void applyFilter(){
    startDate.value = startDateTemp.value;
    endDate.value = endDateTemp.value;
    selectedStatus.value = selectedStatusTemp.value;

    getHeader();
  }

  void onChangeSelectedStatus(String id) {
    final selected = listStatus.firstWhere((item) => item.code.toString() == id.toString());
    selectedStatusTemp(selected);
  }
}