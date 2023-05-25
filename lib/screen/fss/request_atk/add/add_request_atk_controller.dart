import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:intl/intl.dart';


class AddRequestATKController extends BaseController {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yy");

  List<ItemRequestATKModel> listItem = [];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  initData()async{
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);
    companyController.text = companyName;
    siteController.text = siteName;
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
