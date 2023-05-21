import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCashAdvanceNonTravelController extends BaseController{
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  List<CashAdvanceDetailModel> listDetail = <CashAdvanceDetailModel>[];

  final CashAdvanceNonTravelRepository _cashAdvanceTravelNonRepository = Get.find();

  @override
  void onInit() {
    dateController.text = "";
    eventController.text = "";
    totalController.text = _getTotal();
    super.onInit();
  }

  void addItem(CashAdvanceDetailModel item){
    listDetail.add(item);

    totalController.text = _getTotal();
    update();
  }

  void removeItem(CashAdvanceDetailModel item){
    listDetail.removeWhere((element) => element.id == item.id);

    totalController.text = _getTotal();
    update();
  }

  String _getTotal(){
    int total = 0;
    for (CashAdvanceDetailModel element in listDetail) {
      total += element.nominal!.toInt();
    }

    return total.toCurrency();
  }

  void saveData()async{
    String userId = await storage.readString(StorageCore.userID);
    // String userId = "2";
    CashAdvanceModel cashAdvanceModel = CashAdvanceModel(
      idEmployee: userId.toInt(),
      typeCa: "2",
      event: eventController.text,
      date: dateController.text.toDateFormat(targetFormat: "yyyy/MM/dd", originFormat: "dd/MM/yyyy"),
      arrayDetail: listDetail,
      grandTotal: totalController.text.digitOnly(),
    );

    final result = await _cashAdvanceTravelNonRepository.saveData(cashAdvanceModel);
    result.fold(
            (l) => Get.showSnackbar(CustomGetSnackBar(
            message: l.message,
            backgroundColor: Colors.red
        )), (cashAdvanceModel) {
      Get.off(
              () =>
          const EditCashAdvanceNonTravelScreen(),
          arguments: {"item": cashAdvanceModel});
    });
  }

}