import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/master/cost_center/cost_center_model.dart';
import 'package:gais/data/model/master/currency/currency_model.dart';
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCashAdvanceNonTravelController extends BaseController
    with MasterDataMixin {
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  final listCurrency = <CurrencyModel>[].obs;
  final selectedCurrency = CurrencyModel().obs;

  final listCostCenter = <CostCenterModel>[].obs;
  final selectedCostCenter = CostCenterModel().obs;

  List<CashAdvanceDetailModel> listDetail = <CashAdvanceDetailModel>[];

  final CashAdvanceNonTravelRepository _cashAdvanceTravelNonRepository =
      Get.find();

  @override
  void onInit() {
    dateController.text = "";
    eventController.text = "";
    totalController.text = _getTotal();
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData() async {
    String costCenterID = await storage.readString(StorageCore.costCenterID);

    final costCenters = await getListCostCenter();
    listCostCenter(costCenters);
    if (costCenterID.isNotEmpty) {
      onChangeSelectedCostCenter(costCenterID);
    } else {
      onChangeSelectedCostCenter("${listCostCenter.first.id}");
    }

    final currencies = await getListCurrency();
    listCurrency(currencies);
    selectedCurrency(listCurrency.first);
  }

  void addItem(CashAdvanceDetailModel item) {
    listDetail.add(item);

    totalController.text = _getTotal();
    update();
  }

  void editItem(CashAdvanceDetailModel item) {
    int index = listDetail.indexWhere((element) {
      if (item.id != null) {
        return element.id == item.id;
      }
      return element.key == item.key;
    });
    listDetail[index] = item;
    totalController.text = _getTotal();
    update();
  }

  void removeItem(CashAdvanceDetailModel item) {
    listDetail.removeWhere((element) => element.key == item.key);

    totalController.text = _getTotal();
    update();
  }

  String _getTotal() {
    int total = 0;
    for (CashAdvanceDetailModel element in listDetail) {
      total += element.nominal!.toInt();
    }

    return total.toCurrency();
  }

  void saveData() async {
    isLoadingHitApi(true);

    String userId = await storage.readString(StorageCore.userID);
    CashAdvanceModel cashAdvanceModel = CashAdvanceModel(
      idEmployee: userId.toInt(),
      typeCa: "2",
      event: eventController.text,
      idCurrency: selectedCurrency.value.id,
      idCostCenter: selectedCostCenter.value.id,
      costCenterName: selectedCostCenter.value.costCenterName,
      costCenterCode: selectedCostCenter.value.costCenterCode,
      date: dateController.text
          .toDateFormat(targetFormat: "yyyy-MM-dd", originFormat: "dd/MM/yyyy"),
      arrayDetail: listDetail
          .mapIndexed((index, item) => CashAdvanceDetailModel(
              nominal: item.nominal,
              remarks: item.remarks,
              itemName: item.itemName,
              idCostCenter: selectedCostCenter.value.id,
              costCenterName: selectedCostCenter.value.costCenterName,
              costCenterCode: selectedCostCenter.value.costCenterCode))
          .toList(),
      grandTotal: totalController.text.digitOnly(),
    );

    final result = await _cashAdvanceTravelNonRepository.saveData(cashAdvanceModel);

    result.fold((l) {
      isLoadingHitApi(false);
      Get.showSnackbar(
          CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
    }, (cashAdvanceModel) {
      isLoadingHitApi(false);
      //update list
      Get.off(() => const EditCashAdvanceNonTravelScreen(),
          arguments: {"item": cashAdvanceModel});
    });

  }

  void onChangeSelectedCurrency(String id) {
    final selected = listCurrency.firstWhere((item) => item.id == id.toInt());
    selectedCurrency(selected);
  }

  void onChangeSelectedCostCenter(String id) {
    final selected = listCostCenter.firstWhere((item) => item.id == id.toInt());
    selectedCostCenter(selected);
  }
}
