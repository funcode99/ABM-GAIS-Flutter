import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditCashAdvanceNonTravelController extends BaseController{
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  final CashAdvanceNonTravelRepository _repository = Get.find();

  final selectedItem = CashAdvanceModel().obs;

  final enableButton = false.obs;
  final onEdit = false.obs;

  final listDetail = <CashAdvanceDetailModel>[].obs;

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
    dateController.text =
        selectedItem.value.date?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy") ?? "-";
    requestorController.text = selectedItem.value.employeeName ?? "-";
    eventController.text = selectedItem.value.event ?? "-";
    totalController.text =
        selectedItem.value.grandTotal?.toInt().toCurrency() ?? "-";

    getDataDetail();
  }

  void updateEnableButton(){
    enableButton(formKey.currentState!.validate());
  }

  void updateOnEdit(){
    onEdit(!onEdit.value);
  }

  String _getTotal(){
    int total = 0;
    for (CashAdvanceDetailModel element in listDetail) {
      total += element.nominal!.toInt();
    }

    return total.toCurrency();
  }

  void getDataDetail() async {
    final result = await _repository.getDataDetails(selectedItem.value.id!);
    result.fold(
            (l) => null,
            (r) {
          listDetail.value = r;
          listDetail.refresh();
        });
  }

  void updateHeader()async{
    String userId = await storage.readString(StorageCore.userID);
    CashAdvanceModel cashAdvanceModel = CashAdvanceModel(
        id: selectedItem.value.id,
        noCa: selectedItem.value.noCa,
        idEmployee: userId.toInt(),
        typeCa: "2",
        event: eventController.text,
        date: dateController.text.toDateFormat(targetFormat: "yyyy/MM/dd", originFormat: "dd/MM/yyyy"),
        grandTotal: totalController.text.digitOnly(),
    );

    final result = await _repository.updateData(cashAdvanceModel, cashAdvanceModel.id!);
    result.fold(
            (l) => Get.showSnackbar(CustomGetSnackBar(
            message: l.message,
            backgroundColor: Colors.red
        )), (cashAdvanceModel) {
              //update state
              // onEdit(false);

              selectedItem(cashAdvanceModel);
              getDataDetail();
    });
  }

  void deleteDetail(CashAdvanceDetailModel item) async{
    if(item.id!=null){
      final result = await _repository.deleteDetail(item.id!);
      result.fold(
              (l) => Get.showSnackbar(CustomGetSnackBar(
              message: l.message,
              backgroundColor: Colors.red
          )), (cashAdvanceModel) {
        Get.showSnackbar(CustomGetSnackBar(
          message: "Success Delete Data".tr,
        ));
        //update state
        listDetail.remove(item);

        totalController.text = _getTotal();
        updateHeader();
      });
    }else{
      Get.showSnackbar(CustomGetSnackBar(
        message: "Success Delete Data".tr,
      ));

      listDetail.remove(item);
      totalController.text = _getTotal();
    }
  }

  void addDetail(CashAdvanceDetailModel item)async{
    item.idCa = selectedItem.value.id;
    final result = await _repository.addDetail(item);
    result.fold(
            (l) => Get.showSnackbar(CustomGetSnackBar(
            message: l.message,
            backgroundColor: Colors.red
        )), (cashAdvanceDetailModel) {

      listDetail.add(cashAdvanceDetailModel);

      totalController.text = _getTotal();
      updateHeader();
    });
  }

  void updateDetail(CashAdvanceDetailModel item)async{
    item.idCa = selectedItem.value.id;
    final result = await _repository.updateDetail(item, item.id!);
    result.fold(
            (l) => Get.showSnackbar(CustomGetSnackBar(
            message: l.message,
            backgroundColor: Colors.red
        )), (cashAdvanceDetailModel) {

      int index = listDetail.indexWhere((element) => element.id == item.id);
      listDetail[index] = item;

      totalController.text = _getTotal();
      updateHeader();
    });
  }


}