import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CashAdvanceNonTravelListController extends BaseController {
  final TextEditingController dateRange = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateTime? startDate;
  DateTime? endDate;

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
    dateRange.text = "10/03/2023 - 17/03/2023";

    getHeader();
  }

  void getHeader({int page = 1}) async {
    listHeader.clear(); //clear first, because when not found its not [] but error 404 :)
    final result = await _cashAdvanceTravelNonRepository.getPaginationData(
        data: {
          "page" : page,
          // "perPage" : limit,
          "search" : keyword.value
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
}
