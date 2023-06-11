import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/cash_advance/cash_advance_model.dart';
import 'package:gais/data/model/reference/get_currency_model.dart' as currency;
import 'package:gais/data/repository/cash_advance/cash_advance_non_travel_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/cash_advance_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddCashAdvanceTravelController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  int? idCA = Get.arguments['id'];

  final formKey = GlobalKey<FormState>();
  final TextEditingController notes = TextEditingController();
  final TextEditingController travellerName = TextEditingController();
  final TextEditingController totalController = TextEditingController();

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  bool isButtonEnabled = false;
  String currencyCode = "";
  int? selectedCurrency;
  String? currentCurrency;
  int? codeStatus;

  List<CashAdvanceDetailModel> listDetail = <CashAdvanceDetailModel>[];
  List<currency.Data> currencyList = [];
  List itemCA = [
    {'id': 1, 'item': 'Meals'},
    {'id': 2, 'item': 'Transport'},
    {'id': 3, 'item': 'Other'},
  ];

  final CashAdvanceNonTravelRepository _cashAdvanceTravelNonRepository = Get.find();

  @override
  void onInit() {
    notes.text = "";
    travellerName.text = "";
    totalController.text = _getTotal();
    super.onInit();
    print(purposeID);
    print(idCA);
    Future.wait([fetchData()]);
    if (idCA != null) fetchEditValue();
  }

  Future<void> fetchEditValue() async {
    await repository.getCashAdvanceTravelByid(idCA!).then((value) {
      travellerName.text = value.data?.first?.employeeName ?? "";
      notes.text = value.data?.first?.remarks ?? "";
      selectedCurrency = value.data?.first?.idCurrency?.toInt();
      currentCurrency = value.data?.first.idCurrency.toString();
      totalController.text = value.data?.first.grandTotal ?? "";
      codeStatus = value.data?.first.codeStatusDoc?.toInt();
    });

    var detailData = await repository.getDetailCashAdvanceTravelByid(idCA!);
    detailData.data?.forEach((e) {
      listDetail.add(CashAdvanceDetailModel(
        id: e.id?.toInt(),
        idItemCa: e.idItemCa,
        nominal: e.nominal,
        remarks: e.remarks,
        total: e.total,
        frequency: e.frequency,
        idCa: e.idCa?.toInt(),
      ));
    });

    update();
  }

  Future<void> fetchData() async {
    try {
      await storage.readEmployeeInfo().then((value) => travellerName.text = value.first.employeeName.toString());

      await repository.getCurrencyList().then((value) => currencyList.addAll(value.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }
    update();
  }

  void addItem(CashAdvanceDetailModel item) async {
    if (idCA != null) {
      item.idCa = idCA;
      final result = await _cashAdvanceTravelNonRepository.addDetail(item);
      result.fold((l) => Get.showSnackbar(CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)), (cashAdvanceDetailModel) {
        listDetail.add(cashAdvanceDetailModel);

        totalController.text = _getTotal();
        updateData();
      });
    } else {
      listDetail.add(item);
      totalController.text = _getTotal();
    }
    update();
  }

  void editItem(CashAdvanceDetailModel item) async {
    if (idCA != null) {
      item.idCa = idCA;
      final result = await _cashAdvanceTravelNonRepository.updateDetail(item, item.id!);
      result.fold((l) => Get.showSnackbar(CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)), (cashAdvanceDetailModel) {
        int index = listDetail.indexWhere((element) => element.id == item.id);
        listDetail[index] = item;

        totalController.text = _getTotal();
        updateData();
      });
    } else {
      int index = listDetail.indexWhere((element) {
        if (item.id != null) {
          return element.id == item.id;
        }
        return element.key == item.key;
      });
      listDetail[index] = item;
      totalController.text = _getTotal();
    }
    update();
  }

  void removeItem(CashAdvanceDetailModel item) async {
    if (idCA != null) {
      final result = await _cashAdvanceTravelNonRepository.deleteDetail(item.id!);
      result.fold((l) => Get.showSnackbar(CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)), (cashAdvanceModel) {
        Get.showSnackbar(CustomGetSnackBar(
          message: "Success Delete Data".tr,
        ));
        //update state
        listDetail.remove(item);

        totalController.text = _getTotal();
        updateData();
      });
    } else {
      listDetail.removeWhere((element) => element.key == item.key);

      totalController.text = _getTotal();
    }
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
    try {
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

      if (idCA != null) {
        updateData();
      } else {
        final result = await _cashAdvanceTravelNonRepository.saveData(cashAdvanceModel);
        result.fold((l) => Get.showSnackbar(CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)), (cashAdvanceModel) {
          //update list
          if (formEdit == true) {
            Get.off(
                  () => FormRequestTripScreen(),
              arguments: {'id': purposeID, 'codeDocument': codeDocument},
            );
          } else {
            Get.off(
                  () => CashAdvanceScreen(),
              arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit},
            );
          }
        });
      }
    } catch (e) {
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

  void updateData() async {
    String userId = await storage.readString(StorageCore.userID);
    try {
      await repository
          .updateCashAdvanceTravel(
        idCA!.toInt(),
        userId,
        purposeID.toString(),
        selectedCurrency.toString(),
        notes.text,
        totalController.text.digitOnly(),
        "1",
      )
          .then((value) {
        if (formEdit == true) {
          Get.off(
            () => FormRequestTripScreen(),
            arguments: {'id': purposeID, 'codeDocument': codeDocument},
          );
        } else {
          Get.off(
            () => CashAdvanceScreen(),
            arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit},
          );
        }
      });
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Update',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
