import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_model.dart';
import 'package:gais/data/repository/stock_in/stock_in_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class DetailStockInController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController rejectNoteController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final enableButton = false.obs;
  final onEdit = false.obs;

  final selectedItem = StockInATKModel().obs;

  // final listDetail = <StockInATKDetailModel>[].obs;
  final mapDetail = <String, dynamic>{}.obs;
  final mapDetailTemp = <String, dynamic>{}.obs;

  final StockInATKRepository _repository = Get.find();

  @override
  void onReady() {
    super.onReady();
    initData();
    detailHeader();
  }

  void initData() {
    getDetailData();
    setValue();
  }

  void setValue() {
    createdByController.text = selectedItem.value.nameCreated ?? "-";
    createdDateController.text = selectedItem.value.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss") ??
        "-";
    if (selectedItem.value.status?.toLowerCase() == "reject") {
      rejectNoteController.text = selectedItem.value.remarks ?? "-";
    }
  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      selectedItem(r);
      setValue();
    });
  }

  void submitHeader() async {
    final result = await _repository.submitData(selectedItem.value.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (cashAdvanceModel) {
      detailHeader();
    });
  }

  void getDetailData() async {
    final result = await _repository.getDataDetails(selectedItem.value.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (r) {
          Map<String, List<StockInATKDetailModel>> tempMap = {};
          for(StockInATKDetailModel stockInATKDetailModel in r){
            if(!tempMap.containsKey("${stockInATKDetailModel.idItem}")){
              tempMap.putIfAbsent("${stockInATKDetailModel.idItem}", () => []);
            }

            tempMap["${stockInATKDetailModel.idItem}"]?.add(stockInATKDetailModel);
          }

          Map<String, dynamic> result = {};
          tempMap.keys.forEachIndexed((index, key){
            result.putIfAbsent(key, () => <String, dynamic>{});
            result[key]["listDetail"] = tempMap[key];
            result[key]["idItem"] = key;
            result[key]["itemName"] = tempMap[key]?.first.itemName;
          });
          
          mapDetail.value = Map<String, dynamic>.from(result);
          mapDetailTemp.value = Map<String, dynamic>.from(result);
    });
  }

  void updateEnableButton() {
    enableButton(formKey.currentState!.validate());
  }

  void updateOnEdit() {
    onEdit(!onEdit.value);
    if(!onEdit.value){
      mapDetailTemp.clear();
      mapDetailTemp.value = Map<String, dynamic>.from(mapDetail);
    }
  }

  void addDetail(StockInATKDetailModel item) async {
    item.idStockIn = selectedItem.value.id;
    final result = await _repository.addDetail(item);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (detailModel) {
      getDetailData();
    });
  }

  void deleteDetail(StockInATKDetailModel item) async {
    if (item.id != null) {
      final result = await _repository.deleteDetail(item.id!);
      result.fold(
          (l) => Get.showSnackbar(CustomGetSnackBar(
              message: l.message, backgroundColor: Colors.red)), (model) {
        Get.showSnackbar(CustomGetSnackBar(
          message: "Success Delete Data".tr,
        ));
        //update state
        // listDetail.remove(item);
      });
    } else {
      Get.showSnackbar(CustomGetSnackBar(
        message: "Success Delete Data".tr,
      ));

      // listDetail.remove(item);
    }
  }

  void updateDetail(StockInATKDetailModel item) async {
    item.idStockIn = selectedItem.value.id;
    final result = await _repository.updateDetail(item, item.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (model) {
      getDetailData();
    });
  }

  void editItem(dynamic key, Map<String, dynamic> items){
    mapDetailTemp["$key"] = items;
  }

  void addItems(dynamic key, Map<String, dynamic> item) {
    mapDetailTemp["$key"] = item;
  }

  void removeItem(dynamic keyNeedle) {
    mapDetailTemp.removeWhere((key, value){
      return key.toString() == keyNeedle.toString();
    });
    Get.showSnackbar(CustomGetSnackBar(
      message: "Success Delete Data".tr,
    ));
  }

  void updateData() async {
    String userId = await storage.readString(StorageCore.userID);
    String companyId = await storage.readString(StorageCore.companyID);
    // String departmentId = await storage.readString(StorageCore.departmentID);
    String siteId = await storage.readString(StorageCore.siteID);
    int warehouseId = 0; //dummies TODO this should inside the item

    List<StockInATKDetailModel> arrayDetail = [];
    mapDetailTemp.forEach((key, value) {arrayDetail.addAll(value["listDetail"]);});

    StockInATKModel stockInATKModel = StockInATKModel(
      // idEmployee: userId.toInt(),
        idCompany: companyId.toInt(),
        // idDepartement: departmentId.toInt(),
        idSite: siteId.toInt(),
        remarks: "",
        // idWarehouse: warehouseId,
        arrayDetail: arrayDetail
    );


    final result = await _repository.updateData(stockInATKModel, selectedItem.value.id);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (requestAtkModel) {

            onEdit(false);
            initData();
            detailHeader();
        });
  }
}
