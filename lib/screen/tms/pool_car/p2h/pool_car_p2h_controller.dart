import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/master/check_item/check_item_model.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/data/model/pool_car/submit_check_data_model.dart';
import 'package:gais/data/model/pool_car/submit_check_model.dart';
import 'package:gais/data/repository/pool_car/pool_car_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/role_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class PoolCarP2HController extends BaseController with MasterDataMixin {
  final TextEditingController odometerController = TextEditingController();
  final TextEditingController driverNameController = TextEditingController();
  final TextEditingController plateController = TextEditingController();
  final TextEditingController noteController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  DateFormat dateFormat = DateFormat("dd/MM/yyyy");

  final PoolCarRepository _repository = Get.find();

  final selectedItem = PoolCarModel().obs;

  final listCheckItem = <CheckItemModel>[].obs;
  final mapImage = {}.obs;

  final showButton = false.obs;

  final enableButton = false.obs;

  String odometer = "";
  String note = "";
  final isUsable = true.obs;

  final status = 1.obs;

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

    showButton.value = codeRole == RoleEnum.driver.value && ((selectedItem.value.codeStatusDoc == PoolCarEnum.driverCheck.value && status.value == 1) || (selectedItem.value.codeStatusDoc == PoolCarEnum.ready.value && status.value == 2));

    getCheckData();
  }

  void getCheckData() async {
    Map<String, dynamic> queryParam = {
      "status" : status
    };

    final result = await _repository.getCheckData(selectedItem.value.id!, queryParam);

    result.fold((l) {
      print("ERROR GET CHECK DATA${l.message}");
    }, (r) {
      listCheckItem.addAll(r.data!);
      odometer = r.dataExisting?.odometer.toString() ?? "";
      note = r.dataExisting?.notes ?? "";
      isUsable.value = r.dataExisting?.isUsable == null ? true :  r.dataExisting?.isUsable == 1;



      setValue();
    });
  }

  void setValue() {
    odometerController.text = selectedItem.value.odometer.toString() ?? "";
    plateController.text = selectedItem.value.plate ?? "-";
    driverNameController.text = selectedItem.value.driverName ?? "-";
    if(!showButton.value){
      noteController.text = note.isNotEmpty ? note : "-";
    }else{
      noteController.text = note.isNotEmpty ? note : "";
    }
  }

  void saveData() async {
    List<SubmitCheckDataModel> data = [];
    for(CheckItemModel checkItemModel in listCheckItem){
      if(checkItemModel.fillable != null && checkItemModel.fillable == 1){
        data.add(
          SubmitCheckDataModel(
            idDetailCheck: checkItemModel.idDetail,
            value: checkItemModel.value.toString(),
            path: checkItemModel.path
          )
        );
      }
    }

    SubmitCheckModel submitCheckModel = SubmitCheckModel(
        idPoolCar: selectedItem.value.id,
        odometer: odometerController.text.toInt(),
        isUsable: isUsable.value ? 1 : 0,
        notes: noteController.text,
        data:data
    );


    Map<String, dynamic> queryParam = {
      "status" : status
    };

    final result = await _repository.submitCheck(submitCheckModel, queryParam);
    result.fold(
      (l) => Get.showSnackbar(
                CustomGetSnackBar(
                    message: l.message,
                    backgroundColor: Colors.red
                )
              ),
      (cashAdvanceModel) {
          Get.back(result: true);
      });
  }

  void updateChecklistValue(int index, int newValue) {
    listCheckItem[index].value = newValue;
    listCheckItem.refresh();
  }

  void updateButton() {
    enableButton(formKey.currentState!.validate());
  }

}
