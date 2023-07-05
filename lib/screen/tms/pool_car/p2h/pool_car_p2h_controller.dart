import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/master/currency/currency_model.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/data/repository/pool_car/pool_car_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PoolCarP2HController extends BaseController with MasterDataMixin{
  final TextEditingController odometerController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController plateController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final PoolCarRepository _repository = Get.find();

  final selectedItem = PoolCarModel().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
  }

  void saveData() async {
    /*String userId = await storage.readString(StorageCore.userID);
    CashAdvanceModel cashAdvanceModel = CashAdvanceModel(
      idEmployee: userId.toInt(),
      typeCa: "2",
      event: eventController.text,
      idCurrency: selectedCurrency.value.id,
      date: dateController.text
          .toDateFormat(targetFormat: "yyyy-MM-dd", originFormat: "dd/MM/yyyy"),
      arrayDetail: listDetail,
      grandTotal: totalController.text.digitOnly(),
    );

    final result =
    await _repository.saveData(cashAdvanceModel);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (cashAdvanceModel) {
          //update list
          Get.off(() => const EditCashAdvanceNonTravelScreen(),
              arguments: {"item": cashAdvanceModel});
        });*/
  }

}
