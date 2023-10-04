import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/car/car_model.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/data/repository/pool_car/pool_car_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class PoolCarDetailController extends BaseController {
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();
  final TextEditingController referenceController = TextEditingController();

  final selectedItem = PoolCarModel().obs;

  final selectedTab = Rx<TabEnum>(TabEnum.detail);

  final PoolCarRepository _repository = Get.find();

  final showP2H = false.obs;
  final showP2HEnd = false.obs;
  final showChangeCar = false.obs;
  final showSubmitButton = false.obs;

  final idSite = Rxn<int>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();

    detailHeader();
    // getDataDetail();
  }

  void initData() async {
    String codeRole = await storage.readString(StorageCore.codeRole);
    String siteID = await storage.readString(StorageCore.siteID);

    showP2H.value = codeRole == RoleEnum.driver.value ||
        selectedItem.value.codeStatusDoc == PoolCarEnum.ready.value || selectedItem.value.codeStatusDoc == PoolCarEnum.done.value;

    showP2HEnd.value =
        selectedItem.value.codeStatusDoc == PoolCarEnum.done.value;

    showSubmitButton.value = codeRole == RoleEnum.driver.value &&
        selectedItem.value.codeStatusDoc == PoolCarEnum.ready.value;

    idSite.value = siteID.toInt();

    setValue();
  }

  void setValue() async{
    createdDateController.text = selectedItem.value.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss") ??
        "-";
    requestorController.text = selectedItem.value.requestorName ?? "-";
    referenceController.text = selectedItem.value.noRequestTrip ?? "-";

    String codeRole = await storage.readString(StorageCore.codeRole);

    showChangeCar.value = selectedItem.value.isChanged == 1 && selectedItem.value.codeStatusDoc == PoolCarEnum.ready.value && codeRole == RoleEnum.superAdmin.value;
  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      selectedItem(r);
      initData();
      setValue();
      // getApprovalLog();
    });
  }

  submitHeader(){
    showP2HEnd.value = true;
  }

  /*void submitHeader() async {
      isLoadingHitApi(true);

    final result = await _repository.submitData(selectedItem.value.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (cashAdvanceModel) {
      Get.back(result: true);
    });
    result.every((r){
      isLoadingHitApi(false);
      return false;
    });
  }*/

  void changeCar(CarModel newCar)async{
    isLoadingHitApi(true);
    final result = await _repository.changeCar(selectedItem.value.id, newCar);
    result.fold(
            (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
            (bool result) {
              detailHeader();
        });
    result.every((r){
      isLoadingHitApi(false);
      return false;
    });
  }
}
