import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:intl/intl.dart';

class AddCashAdvanceNonTravelController extends BaseController{
  final TextEditingController dateController = TextEditingController();
  final TextEditingController eventController = TextEditingController();
  final TextEditingController totalController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yy");

  List<ItemCashAdvanceNonTravelModel> listItem = <ItemCashAdvanceNonTravelModel>[];

  @override
  void onInit() {
    dateController.text = "";
    eventController.text = "";
    totalController.text = _getTotal();
    super.onInit();
  }

  void addItem(ItemCashAdvanceNonTravelModel item){
    listItem.add(item);

    totalController.text = _getTotal();
    update();
  }

  void removeItem(ItemCashAdvanceNonTravelModel item){
    listItem.removeWhere((element) => element.id == item.id);

    totalController.text = _getTotal();
    update();
  }

  String _getTotal(){
    int total = 0;
    for (ItemCashAdvanceNonTravelModel element in listItem) {
      total += element.nominal.toInt();
    }

    return total.toCurrency();
  }


}