import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/reference/get_currency_model.dart' as currency;
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/cash_advance_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditCashAdvanceTravelController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];

  final formKey = GlobalKey<FormState>();
  final TextEditingController notes = TextEditingController();
  final TextEditingController travellerName = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  bool isButtonEnabled = false;
  String currencyCode = "";
  int? selectedCurrency;

  List<CashAdvanceDetailModel> listDetail = <CashAdvanceDetailModel>[];
  List<currency.Data> currencyList = [];

  final CashAdvanceNonTravelRepository _cashAdvanceTravelNonRepository = Get.find();

  @override
  void onInit() {
    notes.text = "";
    travellerName.text = "";
    totalController.text = _getTotal();
    super.onInit();
    Future.wait([fetchData()]);
  }

  Future<void> fetchData() async {
    await storage.readEmployeeInfo().then((value) => travellerName.text = value.first.employeeName.toString());

    await repository.getCurrencyList().then((value) => currencyList.addAll(value.data?.toSet().toList() ?? []));
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
      total += element.total!.toInt();
    }

    return total.toCurrency();
  }

  void saveData() async {
    try{
      String userId = await storage.readString(StorageCore.userID);
      CashAdvanceModel cashAdvanceModel = CashAdvanceModel(
        idEmployee: userId.toInt(),
        typeCa: "1",
        date: dateFormat.format(DateTime.now()),
        arrayDetail: listDetail,
        idRequestTrip: purposeID,
        idCurrency: selectedCurrency,
        grandTotal: totalController.text.digitOnly(),
        remarks: notes.text,
      );

      final result = await _cashAdvanceTravelNonRepository.saveData(cashAdvanceModel);
      result.fold((l) => Get.showSnackbar(CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)), (cashAdvanceModel) {
        //update list
        Get.off(
          () => CashAdvanceScreen(),
          arguments: {
            'purposeID': purposeID,
            'codeDocument': codeDocument,
          },
        );
      });
    }catch(e){
      e.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Save',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
