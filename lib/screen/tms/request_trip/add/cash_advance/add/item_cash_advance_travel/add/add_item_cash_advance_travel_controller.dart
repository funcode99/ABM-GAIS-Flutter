import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/master/cost_center_model.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class AddItemCashAdvanceTravelController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];

  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController frequencyController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isButtonEnabled = false.obs;
  CashAdvanceDetailModel? item;

  String? selectedItem;

  @override
  void onInit() {
    super.onInit();
    initData();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData(){
    if(item!=null){
      selectedItem = item!.itemName;
      frequencyController.text = item!.frequency.toString() ?? "";
      nominalController.text = item!.nominal?.toInt().toCurrency() ?? "";
      totalController.text = item!.total?.toInt().toCurrency() ?? "";
      remarksController.text = item!.remarks ?? "";
      update();
    }
  }

  CashAdvanceDetailModel getAddedItem() {
    if(item!=null){
      item?.itemName = selectedItem;
      item?.frequency = frequencyController.text.digitOnly().toInt();
      item?.nominal = nominalController.text.digitOnly();
      item?.total = totalController.text.digitOnly();
      item?.remarks = remarksController.text;
      return item!;
    }else{
      return CashAdvanceDetailModel(
          key: DateTime.now().microsecondsSinceEpoch.toString(),
          frequency: frequencyController.text.digitOnly().toInt(),
          nominal: nominalController.text.digitOnly(),
          total: totalController.text.digitOnly(),
          remarks: remarksController.text,
          itemName: selectedItem);
    }
  }

  // void setSelectedCostCenter(String? value){
  //   selectedCostCenterId(value);
  //   frequencyController.text = listCostCenter.firstWhere((element) => element.id.toString() == value).costCenterName!;
  // }
}
