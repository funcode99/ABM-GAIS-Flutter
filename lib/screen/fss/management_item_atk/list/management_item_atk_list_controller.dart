import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/management_item_atk/management_item_atk_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ManagementItemATKListController extends BaseController {
  final TextEditingController dateRange = TextEditingController();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  DateTime? startDate;
  DateTime? endDate;
  String tempSelectedValue = "";
  String selectedValue = "";

  List<ManagementItemATKModel> listItem = <ManagementItemATKModel>[].obs;

  void applyFilter() {
    selectedValue = tempSelectedValue;
  }

  @override
  void onInit() {
    super.onInit();
    dateRange.text = "10/03/2023 - 17/03/2023";

    for (int i = 1; i <= 10; i++) {
      listItem.add(ManagementItemATKModel(
          company: "Company - $i",
          site: "Site - $i",
          warehouse: "Warehouse - $i",
          id: "id - $i",
          itemName: "Item Name - $i",
          brand: "Brand - $i",
          uom: "UOM - $i",
          alertQuantity: i * 100,
          remarks: ""));
    }
  }
}
