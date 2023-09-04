import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/site/site_model.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/data/repository/request_atk/request_atk_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/screen/fss/request_atk/detail/detail_request_atk_screen.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddRequestATKController extends BaseController with MasterDataMixin{
  final TextEditingController companyController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  List<RequestATKDetailModel> listDetail = [];

  final RequestATKRepository _repository = Get.find();

  final listSite = <SiteModel>[].obs;
  final selectedSite = Rxn<SiteModel>();
  final enableSelectSite = false.obs;

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
    String siteId = await storage.readString(StorageCore.siteID);
    String codeRole = await storage.readString(StorageCore.codeRole);

    companyController.text = companyName;
    siteController.text = siteName;

    if(codeRole == RoleEnum.superAdmin.value){
      enableSelectSite(true);

      final sites = await getListSite();
      listSite.addAll(sites);

      onChangeSelectedSite(siteId);
    }else{
      selectedSite.value= SiteModel(
          id: siteId.toInt(),
          siteName: siteName
      );
    }
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
    update();
  }

  void saveData() async {
    String userId = await storage.readString(StorageCore.userID);
    String companyId = await storage.readString(StorageCore.companyID);
    // String departmentId = await storage.readString(StorageCore.departmentID);
    String siteId = await storage.readString(StorageCore.siteID);
    int warehouseId = 0; //dummies TODO this should inside the item
    RequestAtkModel requestAtkModel = RequestAtkModel(
        // idEmployee: userId.toInt(),
        idCompany: companyId.toInt(),
        // idDepartement: departmentId.toInt(),
        idSite: siteId.toInt(),
        // idWarehouse: warehouseId,
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

  void onChangeSelectedSite(String id) {
    if(listSite.isNotEmpty){
      final selected = listSite.firstWhere(
              (item) => item.id.toString() == id.toString(),
          orElse: () => listSite.first);
      selectedSite(selected);

      listDetail.clear();
    }
  }
}
