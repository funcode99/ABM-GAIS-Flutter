import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:intl/intl.dart';


class AddRequestATKController extends BaseController {
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yy");

  List<ItemRequestATKModel> listItem = [];

  @override
  void onInit() {
    super.onInit();

    requestorController.text = "John Smith";
    dateController.text = "";
  }

  void addItem(ItemRequestATKModel item){
    listItem.add(item);

    update();
  }

  void removeItem(ItemRequestATKModel item){
    listItem.removeWhere((element) => element.id == item.id);

    update();
  }

}
