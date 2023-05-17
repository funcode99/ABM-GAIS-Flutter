import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_travel_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CashAdvanceTravelListController extends BaseController {
  final TextEditingController dateRange = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateTime? startDate;
  DateTime? endDate;

  final CashAdvanceTravelRepository _cashAdvanceTravelRepository = Get.find();
  final listHeader = <CashAdvanceModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    dateRange.text = "10/03/2023 - 17/03/2023";

    getData();
  }

  void getData() async {
    final result = await _cashAdvanceTravelRepository.getData();
    result.fold(
        (l) => Get.showSnackbar(CustomGetSnackBar(
              message: l.message,
              backgroundColor: Colors.red
            )), (r) {
      listHeader.value = r;
      listHeader.refresh();
    });
  }
}
