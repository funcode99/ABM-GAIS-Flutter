import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval/approval_actualization_trip_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/actualization_trip/new_actualization_trip_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApprovalActualizationTripListController extends BaseController{

  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();

  final NewActualizationTripRepository _repository = Get.find();
  final listHeader = <ApprovalActualizationTripModel>[].obs;

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

  void getHeader({int page = 1}) async {
    isLoading(true);
    final result = await _repository.getPaginationDataApproval(
        data: {
          "page" : page,
          "perPage" : limit,
          "search" : keyword.value,
          "start_date" : startDate.value != null ? formatFilter.format(startDate.value!) : "",
          "end_date" : endDate.value != null ? formatFilter.format(endDate.value!) : "",
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

  }

  void applyFilter(){
    startDate.value = startDateTemp.value;
    endDate.value = endDateTemp.value;

    getHeader();
  }
}