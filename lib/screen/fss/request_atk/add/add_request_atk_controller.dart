import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/fss/request_atk/detail/detail_request_atk_screen.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddRequestATKController extends BaseController {
  final TextEditingController companyController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  List<RequestATKDetailModel> listDetail = [];

  final RequestATKRepository _repository = Get.find();

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
    siteController.text = siteName;
  }

  void addItem(RequestATKDetailModel item) {
    listDetail.add(item);

    update();
  }

  void editItem(RequestATKDetailModel item){
    int index = listDetail.indexWhere((element){
      if(item.id != null){
        return element.id == item.id;
      }
      return element.key == item.key;
    });
    listDetail[index] = item;
    update();
  }

  void removeItem(RequestATKDetailModel item) {
    listDetail.removeWhere((element) => element.key == item.key);
  }

  void saveData() async {
    String userId = await storage.readString(StorageCore.userID);
    String companyId = await storage.readString(StorageCore.companyID);
    String departmentId = await storage.readString(StorageCore.departmentID);
    String siteId = await storage.readString(StorageCore.siteID);
    int warehouseId = 0; //dummies TODO this should inside the item
    RequestAtkModel requestAtkModel = RequestAtkModel(
        idEmployee: userId.toInt(),
        idCompany: companyId.toInt(),
        idDepartement: departmentId.toInt(),
        idSite: siteId.toInt(),
        idWarehouse: warehouseId,
        arrayDetail: listDetail);

    final result = await _repository.saveData(requestAtkModel);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (requestAtkModel) {
      //update list
      Get.off(() => const RequestATKDetailScreen(),
          arguments: {"item": requestAtkModel});
    });
  }
}
