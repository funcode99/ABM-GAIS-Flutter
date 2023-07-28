import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/master/cost_center/cost_center_model.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class AddItemCashAdvanceNonTravelController extends BaseController with MasterDataMixin{
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isButtonEnabled = false.obs;
  final cashAdvanceDetailModel = Rxn<CashAdvanceDetailModel>();



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
    if(cashAdvanceDetailModel.value !=null){
      itemNameController.text = cashAdvanceDetailModel.value?.itemName ?? "";
      nominalController.text = cashAdvanceDetailModel.value?.nominal?.toInt().toCurrency() ?? "";
      remarksController.text = cashAdvanceDetailModel.value?.remarks ?? "";
    }
  }


  CashAdvanceDetailModel getAddedItem() {
    if(cashAdvanceDetailModel.value!=null){
      cashAdvanceDetailModel.value?.nominal = nominalController.text.digitOnly();
      cashAdvanceDetailModel.value?.remarks = remarksController.text;
      cashAdvanceDetailModel.value?.itemName = itemNameController.text;
      return cashAdvanceDetailModel.value!;
    }else{
      return CashAdvanceDetailModel(
          key: DateTime.now().microsecondsSinceEpoch.toString(),
          nominal: nominalController.text.digitOnly(),
          remarks: remarksController.text,
          itemName: itemNameController.text);
    }
  }
}
