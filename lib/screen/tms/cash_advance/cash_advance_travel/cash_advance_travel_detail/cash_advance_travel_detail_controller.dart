import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_travel_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class CashAdvanceTravelDetailController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  final selectedItem = CashAdvanceModel().obs;
  final listDetail = <CashAdvanceDetailModel>[].obs;

  final CashAdvanceTravelRepository _cashAdvanceTravelRepository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData() {
    createdDateController.text =
        selectedItem.value.createdAt?.toDateFormat(targetFormat: "dd/MM/yy") ?? "-";
    requestorController.text = selectedItem.value.employeeName ?? "-";
    referenceController.text = selectedItem.value.noRequestTrip ?? "-";
    totalController.text =
        "${selectedItem.value.currencyCode ?? ""} ${selectedItem.value.grandTotal?.toInt().toCurrency()}";
    currencyController.text = "${selectedItem.value.currencyName}";
    remarksController.text =
        selectedItem.value.remarks ?? "-";

    getDetailData();
  }

  void getDetailData() async {
    final result = await _cashAdvanceTravelRepository.getDataDetails(selectedItem.value.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (r) {
      listDetail.value = r;
      listDetail.refresh();
    });
  }
}
