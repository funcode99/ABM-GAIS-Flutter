import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/storage_core.dart';
import 'package:get/get.dart';


class MyProfileMainController extends BaseController with GetTickerProviderStateMixin{
  final tabController = Rxn<TabController>();
  final isEmployee = false.obs;

  @override
  void onInit() {
    super.onInit();
    initData();
    tabController.value = TabController(length: 1, vsync: this);
  }

  @override
  void onClose() {
    tabController.value?.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void initData()async{
    String isEmployee = await storage.readString(StorageCore.isEmployee);

    if(isEmployee == "1"){
      print("HEREEE");
      tabController.value = TabController(length: 2, vsync: this);
    }
    print("IS EMPLOYEE $isEmployee");

    this.isEmployee.value = isEmployee == "1";
    update();

  }

}