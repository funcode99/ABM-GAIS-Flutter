import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestATKListController extends BaseController {
  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();

  String tempSelectedValue = "";
  String selectedValue = "";

  final keyword = "".obs;

  final listHeader = <RequestAtkModel>[].obs;
  final RequestATKRepository _repository = Get.find();
  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

  @override
  void onInit() {
    super.onInit();
    dateRangeController.text = "10/03/2023 - 17/03/2023";

    getHeader();
  }

  void getHeader({int page = 1}) async {
    listHeader.clear(); //clear first, because when not found its not [] but error 404 :)
    final result = await _repository.getPaginationData(
      data: {
        "page" : page,
        "perPage" : limit,
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
          .map((e) => RequestAtkModel.fromJson(e))
          .toList();
      listHeader.refresh();
    });
  }

  void deleteHeader(RequestAtkModel item) async {
    final result = await _repository.deleteData(item.id!);
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
