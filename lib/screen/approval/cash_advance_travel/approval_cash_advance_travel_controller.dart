import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';


class ApprovalCashAdvanceTravelController extends BaseController with GetTickerProviderStateMixin{
  late TabController tabController;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

}