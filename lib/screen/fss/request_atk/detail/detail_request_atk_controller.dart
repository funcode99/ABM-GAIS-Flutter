import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class RequestATKDetailController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController rejectNoteController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final enableButton = false.obs;
  final onEdit = false.obs;

  final selectedItem = RequestAtkModel().obs;

  final listDetail = <RequestATKDetailModel>[].obs;

  final RequestATKRepository _repository = Get.find();

  final selectedTab = Rx<TabEnum>(TabEnum.detail);
  final listLogApproval = <ApprovalLogModel>[].obs;

  @override
  void onReady() {
    super.onReady();
    initData();
    detailHeader();
  }

  void initData() {
    getDetailData();
    setValue();
  }

  void setValue(){
    createdByController.text = selectedItem.value.employeeName ?? "-";
    createdDateController.text = selectedItem.value.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss") ??
        "-";
    if (selectedItem.value.notes != null) {
      rejectNoteController.text = selectedItem.value.notes ?? "-";
    }
  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      selectedItem(r);
      setValue();
      getApprovalLog();
    });
  }

  void submitHeader() async {
    final result = await _repository.submitData(selectedItem.value.id!);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (cashAdvanceModel) {
          detailHeader();
        });
  }

  void getDetailData() async {
    final result = await _repository.getDataDetails(selectedItem.value.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (r) {
      listDetail.value = r;
      listDetail.refresh();
    });
  }

  void updateEnableButton() {
    enableButton(formKey.currentState!.validate());
  }

  void updateOnEdit() {
    onEdit(!onEdit.value);
  }

  void addDetail(RequestATKDetailModel item) async {
    item.idAtkRequest = selectedItem.value.id;
    final result = await _repository.addDetail(item);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (detailModel) {
        getDetailData();
    });
  }

  void deleteDetail(RequestATKDetailModel item) async {
    if (item.id != null) {
      final result = await _repository.deleteDetail(item.id!);
      result.fold(
          (l) => Get.showSnackbar(CustomGetSnackBar(
              message: l.message, backgroundColor: Colors.red)), (model) {
        Get.showSnackbar(CustomGetSnackBar(
          message: "Success Delete Data".tr,
        ));
        //update state
        getDetailData();
      });
    } else {
      Get.showSnackbar(CustomGetSnackBar(
        message: "Success Delete Data".tr,
      ));

      listDetail.remove(item);
    }
  }

  void updateDetail(RequestATKDetailModel item) async {
    item.idAtkRequest = selectedItem.value.id;
    final result = await _repository.updateDetail(item, item.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (model) {
          getDetailData();
    });
  }

  void getApprovalLog()async{
    final result = await _repository.getApprovalLog(selectedItem.value.id);

    result.fold((l) => null, (r) {
      listLogApproval.value = r;
      listLogApproval.refresh();
    });
  }
}
