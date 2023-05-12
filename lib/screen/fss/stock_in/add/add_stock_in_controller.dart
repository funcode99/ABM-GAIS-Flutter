import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/stock_in/item_stock_in_atk_model.dart';
import 'package:gais/data/model/warehouse_model.dart';
import 'package:get/get.dart';

class AddStockInATKController extends BaseController {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  List<ItemStockInATKModel> listItem = [];
  final enableButton = false.obs;

  @override
  void onInit() {
    companyController.text = "";
    siteController.text = "";

    super.onInit();
  }

  void updateButton(){
    enableButton(formKey.currentState!.validate());
  }

  void removeItem(ItemStockInATKModel item){
    listItem.removeWhere((element) => element.id == item.id);

    update();
  }
}
