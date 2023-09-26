import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_cash_advance/approval_cash_advance_model.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ApprovalCashAdvanceNonTravelDetailController extends BaseController {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController currencyController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final selectedItem = ApprovalCashAdvanceModel().obs;
  final detailSelectedItem = CashAdvanceModel().obs;

  final approvalModel = Rxn<ApprovalModel>();

  final selectedTab = Rx<TabEnum>(TabEnum.detail);

  final listDetail = <CashAdvanceDetailModel>[].obs;
  final listLogApproval = <ApprovalLogModel>[].obs;

  final CashAdvanceNonTravelRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    detailHeader();
  }

  void setValue() {
    dateController.text = detailSelectedItem.value.date?.toDateFormat(
            originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ??
        "-";
    requestorController.text = detailSelectedItem.value.employeeName ?? "-";
    eventController.text = detailSelectedItem.value.event ?? "-";
    totalController.text =
        "${detailSelectedItem.value.currencyCode ?? ""} ${detailSelectedItem.value.grandTotal?.toInt().toCurrency()}";

    currencyController.text =
        "${detailSelectedItem.value.currencyName} (${detailSelectedItem.value.currencyCode})";
  }

  void detailHeader() async {
    final result = await _repository.detailDataApproval(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) async{
      selectedItem(r);

      getDataDetail();

      final resultDetail = await _repository.detailData(selectedItem.value.idCa!);
      resultDetail.fold(
            (l) => print("ERROR DETAIL HEADER ${l.message}"),
            (right) {
              detailSelectedItem(right);
              setValue();
              getApprovalLog();
            });
    });
  }

  void getDataDetail() async {
    final result = await _repository.getDataDetails(selectedItem.value.idCa!);
    result.fold((l) => null, (r) {
      listDetail.value = r;
      listDetail.refresh();
    });
  }

  void reject() async {
    final result =
        await _repository.reject(approvalModel.value, selectedItem.value.id!);
    result.fold(
        (l) => showApprovalFailDialog("Request failed to be approved!".tr)
            .then((value) => Get.back(result: true)), (r) {
      if (r) {
        showApprovalSuccessDialog("The request was successfully rejected!".tr)
            .then((value) => Get.back(result: true));
      } else {
        showApprovalFailDialog("Request failed to be rejected!".tr)
            .then((value) => Get.back(result: true));
      }
    });
  }

  void approve() async {
    final result =
        await _repository.approve(approvalModel.value, selectedItem.value.id!);
    result.fold(
        (l) => showApprovalFailDialog("Request failed to be approved!".tr)
            .then((value) => Get.back(result: true)), (r) {
      if (r) {
        showApprovalSuccessDialog("The request was successfully approved!".tr)
            .then((value) => Get.back(result: true));
      } else {
        showApprovalFailDialog("Request failed to be approved!".tr)
            .then((value) => Get.back(result: true));
      }
    });
  }

  void getApprovalLog() async {
    final result =
        await _repository.getApprovalLog(detailSelectedItem.value.id!);

    result.fold((l) => null, (r) {
      listLogApproval.value = r;
      listLogApproval.refresh();
    });
  }
}
