import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/management_item_atk/management_item_atk_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ManagementItemATKListController extends BaseController {
  final TextEditingController dateRange = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateTime? startDate;
  DateTime? endDate;
  String tempSelectedValue = "";
  String selectedValue = "";

  final keyword = "".obs;

  final listHeader = <ManagementItemATKModel>[].obs;
  final ManagementItemATKRepository _repository = Get.find();
  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 1;

  List<ManagementItemATKModel> listItem = <ManagementItemATKModel>[].obs;

  void applyFilter() {
    selectedValue = tempSelectedValue;
  }

  @override
  void onInit() {
    super.onInit();
    dateRange.text = "10/03/2023 - 17/03/2023";

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
          print("${paginationModel?.currentPage}");
          currentPage(paginationModel?.currentPage);

          listHeader.value = paginationModel!.data!
              .map((e) => ManagementItemATKModel.fromJson(e))
              .toList();
          listHeader.refresh();
        });
  }

}
