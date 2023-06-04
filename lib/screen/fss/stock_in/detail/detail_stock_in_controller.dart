import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_model.dart';
import 'package:gais/data/repository/stock_in/stock_in_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class DetailStockInController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController rejectNoteController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final enableButton = false.obs;
  final onEdit = false.obs;

  final selectedItem = StockInATKModel().obs;

  final listDetail = <StockInATKDetailModel>[].obs;

  final StockInATKRepository _repository = Get.find();

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

  void setValue() {
    createdByController.text = selectedItem.value.employeeName ?? "-";
    createdDateController.text = selectedItem.value.createdAt?.toDateFormat(
            originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy") ??
        "-";
    if (selectedItem.value.status?.toLowerCase() == "reject") {
      rejectNoteController.text = selectedItem.value.remarks ?? "-";
    }
  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      selectedItem(r);
      setValue();
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
    });
  }

  void updateEnableButton() {
    enableButton(formKey.currentState!.validate());
  }

  void updateOnEdit() {
    onEdit(!onEdit.value);
  }

  void addDetail(StockInATKDetailModel item) async {
    item.idStockIn = selectedItem.value.id;
    final result = await _repository.addDetail(item);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (detailModel) {
      getDetailData();
    });
  }

  void deleteDetail(StockInATKDetailModel item) async {
    if (item.id != null) {
      final result = await _repository.deleteDetail(item.id!);
      result.fold(
          (l) => Get.showSnackbar(CustomGetSnackBar(
              message: l.message, backgroundColor: Colors.red)), (model) {
        Get.showSnackbar(CustomGetSnackBar(
          message: "Success Delete Data".tr,
        ));
        //update state
        listDetail.remove(item);
      });
    } else {
      Get.showSnackbar(CustomGetSnackBar(
        message: "Success Delete Data".tr,
      ));

      listDetail.remove(item);
    }
  }

  void updateDetail(StockInATKDetailModel item) async {
    item.idStockIn = selectedItem.value.id;
    final result = await _repository.updateDetail(item, item.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (model) {
      getDetailData();
    });
  }
}
