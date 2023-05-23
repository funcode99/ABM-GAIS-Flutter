import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/master/cost_center_model.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddCashAdvanceController extends BaseController{
  int purposeID = Get.arguments['purposeID'];
  int codeDocument = Get.arguments['codeDocument'];

  final formKey = GlobalKey<FormState>();
  final TextEditingController frequency = TextEditingController();
  final TextEditingController otherItem = TextEditingController();
  final TextEditingController amount = TextEditingController();
  final TextEditingController total = TextEditingController();
  final TextEditingController remarks = TextEditingController();
  CashAdvanceDetailModel? item;

  final listCostCenter = <CostCenterModel>[].obs;
  final selectedCostCenterId = "".obs;
  final isButtonEnabled = false.obs;

  int? selectedItemID;
  String? selectedItem;
  int? selectedCurencyID;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData(){
    if(item!=null){
      amount.text = item!.nominal?.toInt().toCurrency() ?? "";
      remarks.text = item!.remarks ?? "";
      selectedCostCenterId(item!.idCostCenter.toString());
    }
  }

  CashAdvanceDetailModel getAddedItem() {
    if(item!=null){
      item?.idItemCa = selectedItemID;
      item?.itemName = selectedItem ?? otherItem.text;
      item?.frequency = frequency.text.toInt();
      //curency
      item?.nominal = amount.text.digitOnly();
      item?.total = total.text.digitOnly();
      item?.remarks = remarks.text;
      return item!;
    }else{
      return CashAdvanceDetailModel(
          key: DateTime.now().microsecondsSinceEpoch.toString(),
          idItemCa: selectedItemID,
          itemName: selectedItem ?? otherItem.text,
          frequency: frequency.text.toInt(),
          //curency
          nominal: amount.text.digitOnly(),
          total: total.text.digitOnly(),
          remarks: remarks.text,
          );
    }
  }


}