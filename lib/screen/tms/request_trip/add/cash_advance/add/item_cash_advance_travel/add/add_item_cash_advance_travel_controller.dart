import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/data/model/master/cost_center_model.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class AddItemCashAdvanceTravelController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int codeDocument = Get.arguments['codeDocument'];

  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController costCenterController = TextEditingController();
  final TextEditingController nominalController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final isButtonEnabled = false.obs;
  CashAdvanceDetailModel? item;

  final listCostCenter = <CostCenterModel>[].obs;
  final selectedCostCenterId = "".obs;

  @override
  void onInit() {
    super.onInit();

    for(int i = 0; i < 10; i++) {
      listCostCenter.add(CostCenterModel(costCenterName: "Cost Center Name ${i+1}", id: i));
    }
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData(){
    if(item!=null){
      itemNameController.text = item!.itemName ?? "";
      costCenterController.text = item!.costCenterName ?? "";
      nominalController.text = item!.nominal?.toInt().toCurrency() ?? "";
      remarksController.text = item!.remarks ?? "";
      selectedCostCenterId(item!.idCostCenter.toString());
    }
  }

  CashAdvanceDetailModel getAddedItem() {
    if(item!=null){
      item?.costCenterName = costCenterController.text;
      item?.nominal = nominalController.text.digitOnly();
      item?.remarks = remarksController.text;
      item?.idCostCenter = selectedCostCenterId.value.toInt();
      item?.itemName = itemNameController.text;
      return item!;
    }else{
      return CashAdvanceDetailModel(
          key: DateTime.now().microsecondsSinceEpoch.toString(),
          costCenterName: costCenterController.text,
          nominal: nominalController.text.digitOnly(),
          remarks: remarksController.text,
          idCostCenter: selectedCostCenterId.value.toInt(),
          //TODO : change to dynamic one
          itemName: itemNameController.text);
    }
  }

  void setSelectedCostCenter(String? value){
    selectedCostCenterId(value);
    costCenterController.text = listCostCenter.firstWhere((element) => element.id.toString() == value).costCenterName!;
  }
}
