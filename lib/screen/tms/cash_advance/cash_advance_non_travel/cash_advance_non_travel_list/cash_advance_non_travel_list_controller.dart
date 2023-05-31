import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CashAdvanceNonTravelListController extends BaseController {
  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();

  final CashAdvanceNonTravelRepository _cashAdvanceTravelNonRepository =
      Get.find();
  final listHeader = <CashAdvanceModel>[].obs;

  final keyword = "".obs;

  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    getHeader();
  }

  void getHeader({int page = 1}) async {
    listHeader.clear(); //clear first, because when not found its not [] but error 404 :)
    final result = await _cashAdvanceTravelNonRepository.getPaginationData(
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
          totalPage(1);
          currentPage(1);
        },
            (r) {
          paginationModel = r;
          int tempTotalPage = (paginationModel!.total!/limit).ceil();
          totalPage(tempTotalPage);
          currentPage(paginationModel?.currentPage);

          listHeader.value = paginationModel!.data!
              .map((e) => CashAdvanceModel.fromJson(e))
              .toList();
          listHeader.refresh();
        });
  }

  void deleteHeader(CashAdvanceModel item) async {
    final result = await _cashAdvanceTravelNonRepository.deleteData(item.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (r) {
      Get.showSnackbar(CustomGetSnackBar(
        message: "Success Delete Data".tr,
      ));
      getHeader();
    });
  }

  void resetFilter(){
    endDateTemp.value = null;
    startDateTemp.value = null;
    dateRangeController.text = "";
  }

  void openFilter(){
    startDateTemp.value = startDate.value;
    endDateTemp.value = endDate.value;
    if(startDateTemp.value!=null){
      dateRangeController.text = "${dateFormat.format(startDateTemp.value!)} - ${dateFormat.format(endDateTemp.value!)}";
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
