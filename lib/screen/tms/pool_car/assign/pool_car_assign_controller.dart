import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/approval_model.dart';
import 'package:gais/data/model/master/car/car_model.dart';
import 'package:gais/data/model/master/driver/driver_model.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/data/repository/pool_car/pool_car_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/dialog/cancel_dialog.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';

class PoolCarAssignController extends BaseController with MasterDataMixin{
  final formKey = GlobalKey<FormState>();

  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController requestorController = TextEditingController();

  final selectedItem = PoolCarModel().obs;

  final selectedCar = Rxn<CarModel>();
  final listCar = <CarModel>[].obs;

  final selectedDriver = Rxn<DriverModel>();
  final listDriver = <DriverModel>[].obs;

  final PoolCarRepository _repository = Get.find();

  final idSite = Rxn<int>();
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

  void initData() async {
    String codeRole = await storage.readString(StorageCore.codeRole);
    String siteID = await storage.readString(StorageCore.siteID);

    idSite.value = siteID.toInt();

    listCar.clear();
    final cars = await getListCar(idSite: siteID);
    listCar.addAll(cars);

    listDriver.clear();
    final drivers = await getListDriver(idSite: siteID);
    listDriver.addAll(drivers);

    setValue();
  }

  void setValue() async {
    fromDateController.text = selectedItem.value.fromDate?.toDateFormat(
        originFormat: "yyyy-MM-dd HH:mm:ss",
        targetFormat: "dd/MM/yyyy") ??
        "-";

    toDateController.text = selectedItem.value.toDate?.toDateFormat(
        originFormat: "yyyy-MM-dd HH:mm:ss",
        targetFormat: "dd/MM/yyyy") ??
        "-";

    requestorController.text = selectedItem.value.requestorName ?? "-";

  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

  void onChangeSelectedCar(String id) {
    final selected = listCar.firstWhere((item) => item.id == id.toInt());
    selectedCar(selected);
  }

  void onChangeSelectedDriver(String id) {
    final selected = listDriver.firstWhere((item) => item.id == id.toInt());
    selectedDriver(selected);
  }

  PoolCarModel? assign(){
    return PoolCarModel(
      idCar: selectedCar.value?.id,
      idDrivers: selectedDriver.value?.id,
    );
  }

}
