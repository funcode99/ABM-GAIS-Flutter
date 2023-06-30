import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/status_doc/status_doc_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RequestATKListController extends BaseController with MasterDataMixin{
  final TextEditingController dateRangeController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");

  final startDate = Rxn<DateTime>();
  final endDate = Rxn<DateTime>();
  final startDateTemp = Rxn<DateTime>();
  final endDateTemp = Rxn<DateTime>();
  final selectedStatus = Rxn<StatusDocModel>();
  final selectedStatusTemp = Rxn<StatusDocModel>();

  final keyword = "".obs;

  final listHeader = <RequestAtkModel>[].obs;
  final listStatus = <StatusDocModel>[].obs;
  final RequestATKRepository _repository = Get.find();
  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

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
    listStatus.add(StatusDocModel(code: 10, status: "Done"));
    listStatus.add(StatusDocModel(code: 9, status: "Cancelled"));
    // final statuses = await getListStatusDoc();
    // listStatus.addAll(statuses);
    onChangeSelectedStatus("");
  }

  void getHeader({int page = 1}) async {
    final result = await _repository.getPaginationData(
      data: {
        "page" : page,
        "perPage" : limit,
        "search" : keyword.value,
        "code_status_doc" : selectedStatus.value?.code ?? "",
        "date" : startDate.value != null ? formatFilter.format(startDate.value!) : "",
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

  void onChangeSelectedStatus(String id) {
    final selected = listStatus.firstWhere((item) => item.code.toString() == id.toString());
    selectedStatusTemp(selected);
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
    onChangeSelectedStatus("");
    dateRangeController.text = "";
  }

  void openFilter(){
    startDateTemp.value = startDate.value;
    endDateTemp.value = endDate.value;
    selectedStatusTemp.value = selectedStatus.value;
    if(startDateTemp.value!=null){
      dateRangeController.text = "${dateFormat.format(startDateTemp.value!)} - ${dateFormat.format(endDateTemp.value!)}";
    }else{
      dateRangeController.text = "";
    }

  }

  void applyFilter(){
    startDate.value = startDateTemp.value;
    endDate.value = endDateTemp.value;
    selectedStatus.value = selectedStatusTemp.value;

    getHeader();
  }

}
