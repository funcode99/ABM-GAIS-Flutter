import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_travel_repository.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class CashAdvanceTravelDetailController extends BaseController{
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  final selectedItem = CashAdvanceModel().obs;
  final listDetail = <CashAdvanceDetailModel>[].obs;

  final CashAdvanceTravelRepository _cashAdvanceTravelRepository = Get.find();

  @override
  void onInit() {
    createdDateController.text = "23/02/23";
    requestorController.text = "John Smith";
    referenceController.text = "TCA-ABM/1232/23.04";
    totalController.text = "250.000";
    super.onInit();

  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData(){
    createdDateController.text = selectedItem.value.createdAt?.toDateFormat() ?? "-";
    requestorController.text = selectedItem.value.employeeName ?? "-";
    referenceController.text = selectedItem.value.noRequestTrip ?? "-";
    totalController.text = selectedItem.value.grandTotal?.toInt().toCurrency() ?? "-";

    getData();
  }

  void getData() async {
    final result = await _cashAdvanceTravelRepository.getDataDetails(2);
    result.fold(
            (l) => Get.showSnackbar(GetSnackBar(
          message: l.message,
        )), (r) {
      listDetail.value = r;
      listDetail.refresh();
    });
  }






}