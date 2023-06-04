import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/stock_in/item_stock_in_atk_model.dart';
import 'package:gais/data/model/master/warehouse/warehouse_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_model.dart';
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
  DateFormat dateFormat = DateFormat("dd/MM/yy");

  final listDetail = <StockInATKDetailModel>[].obs;

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

  void removeItem(StockInATKDetailModel item) {
    listDetail.removeWhere((element) => element.key == item.key);
    Get.showSnackbar(CustomGetSnackBar(
      message: "Success Delete Data".tr,
    ));
  }

  void editItem(StockInATKDetailModel item){
    int index = listDetail.indexWhere((element){
      if(item.id != null){
        return element.id == item.id;
      }
      return element.key == item.key;
    });
    listDetail[index] = item;
  }

  void addItem(StockInATKDetailModel item) {
    listDetail.add(item);
  }

  void saveData() async {
    String userId = await storage.readString(StorageCore.userID);
    String companyId = await storage.readString(StorageCore.companyID);
    String departmentId = await storage.readString(StorageCore.departmentID);
    String siteId = await storage.readString(StorageCore.siteID);
    int warehouseId = 0; //dummies TODO this should inside the item
    StockInATKModel stockInATKModel = StockInATKModel(
        idEmployee: userId.toInt(),
        idCompany: companyId.toInt(),
        idDepartement: departmentId.toInt(),
        idSite: siteId.toInt(),
        remarks: "",
        idWarehouse: warehouseId,
        arrayDetail: listDetail);

    final result = await _repository.saveData(stockInATKModel);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (requestAtkModel) {

          Get.off(() => const DetailStockInScreen(),
              arguments: {"item": requestAtkModel});
        });
  }

}
