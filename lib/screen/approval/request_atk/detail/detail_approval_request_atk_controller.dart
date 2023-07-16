import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/approval_request_atk/approval_request_atk_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailApprovalRequestATKController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController rejectNoteController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final selectedItem = ApprovalRequestATKModel().obs;
  final detailSelectedItem = RequestAtkModel().obs;

  final approvalModel = Rxn<ApprovalModel>();

  final selectedTab = Rx<TabEnum>(TabEnum.detail);

  final listDetail = <RequestATKDetailModel>[].obs;
  final listLogApproval = <ApprovalLogModel>[].obs;

  final RequestATKRepository _repository = Get.find();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    detailHeader();
    getDataDetail();
  }

  void setValue() {
    createdDateController.text = detailSelectedItem.value.createdAt
            ?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss") ??
        "-";
    createdByController.text = detailSelectedItem.value.employeeName ?? "-";
    rejectNoteController.text = detailSelectedItem.value.remarks ?? "-";
  }

  void detailHeader() async {
    final result = await _repository.detailDataApproval(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      detailSelectedItem(r);
      setValue();
      // getApprovalLog();
    });
  }

  void getDataDetail() async {
    final result = await _repository.getDataDetails(selectedItem.value.id!);
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
