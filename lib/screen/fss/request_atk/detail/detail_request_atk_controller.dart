import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class RequestATKDetailController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController rejectNoteController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  List<ItemRequestATKModel> listItem = <ItemRequestATKModel>[];

  final enableButton = false.obs;
  final onEdit = false.obs;

  final selectedItem = RequestAtkModel().obs;

  final listDetail = <RequestATKDetailModel>[].obs;

  final RequestATKRepository _repository = Get.find();

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData() {
    createdByController.text = selectedItem.value.createdBy ?? "-";
    createdDateController.text = selectedItem.value.createdAt?.toDateFormat(
            originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy") ??
        "-";
    if (selectedItem.value.status?.toLowerCase() == "reject") {
      rejectNoteController.text = selectedItem.value.remarks ?? "-";
    }

    getDetailData();
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
      listDetail.add(detailModel);
    });
  }
}
