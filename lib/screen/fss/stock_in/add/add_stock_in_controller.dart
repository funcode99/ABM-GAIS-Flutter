import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_model.dart';
import 'package:gais/data/repository/stock_in/stock_in_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/fss/stock_in/detail/detail_stock_in_screen.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddStockInATKController extends BaseController {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  // final listDetail = <StockInATKDetailModel>[].obs;
  final mapDetail = <String, dynamic>{}.obs;

  final StockInATKRepository _repository = Get.find();
  final enableButton = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  initData() async {
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);
    companyController.text = companyName;
    siteController.text = siteName ?? "";
  }

  void updateButton(){
    enableButton(formKey.currentState!.validate());
  }

  /*void removeItem(StockInATKDetailModel item) {
    listDetail.removeWhere((element) => element.key == item.key);
    Get.showSnackbar(CustomGetSnackBar(
      message: "Success Delete Data".tr,
    ));
  }*/

  void removeItem(dynamic keyNeedle) {
    mapDetail.removeWhere((key, value){
      return key.toString() == keyNeedle.toString();
    });
    Get.showSnackbar(CustomGetSnackBar(
      message: "Success Delete Data".tr,
    ));
  }

  void removeDetailItem(dynamic keyNeedle, StockInATKDetailModel item) {
    Map<String, dynamic> temp = mapDetail["$keyNeedle"];
    List<StockInATKDetailModel> items = List<StockInATKDetailModel>.from(temp["listDetail"]);
    //remove item from list
    items.removeWhere((element){
      return element.idWarehouse ==  item.idWarehouse;
    });

    mapDetail.removeWhere((key, value) => key.toString() == keyNeedle.toString());

    if(items.isNotEmpty){
      temp["listDetail"] = items;
      mapDetail.putIfAbsent(keyNeedle.toString(), () => temp);
    }

    Get.showSnackbar(CustomGetSnackBar(
      message: "Success Delete Data".tr,
    ));
  }

  /*void editItem(StockInATKDetailModel item){
    int index = listDetail.indexWhere((element){
      if(item.id != null){
        return element.id == item.id;
      }
      return element.key == item.key;
    });
    listDetail[index] = item;
  }*/

  void editItem(dynamic key, Map<String, dynamic> items){
    mapDetail["$key"] = items;
  }

  /*void addItem(StockInATKDetailModel items) {
    listDetail.add(item);
  }*/

  void addItems(dynamic key, Map<String, dynamic> item) {
    mapDetail["$key"] = item;
  }

  void saveData() async {
    String userId = await storage.readString(StorageCore.userID);
    String companyId = await storage.readString(StorageCore.companyID);
    // String departmentId = await storage.readString(StorageCore.departmentID);
    String siteId = await storage.readString(StorageCore.siteID);
    int warehouseId = 0; //dummies TODO this should inside the item

    List<StockInATKDetailModel> arrayDetail = [];
    mapDetail.forEach((key, value) {arrayDetail.addAll(value["listDetail"]);});

    StockInATKModel stockInATKModel = StockInATKModel(
        // idEmployee: userId.toInt(),
        idCompany: companyId.toInt(),
        // idDepartement: departmentId.toInt(),
        idSite: siteId.toInt(),
        remarks: "",
        // idWarehouse: warehouseId,
        arrayDetail: arrayDetail
    );



    isLoadingHitApi(true);
    final result = await _repository.saveData(stockInATKModel);
    result.fold(
            (l) {
              isLoadingHitApi(false);
              Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
            },
            (requestAtkModel) {
              isLoadingHitApi(false);
          Get.off(() => const DetailStockInScreen(),
              arguments: {"item": requestAtkModel});
        });
  }

}
