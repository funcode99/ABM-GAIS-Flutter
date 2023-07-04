import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/pool_car/pool_car_model.dart';
import 'package:gais/data/repository/pool_car/pool_car_repository.dart';
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

  void initData() {
    setValue();
  }

  void setValue(){
    createdDateController.text =
        selectedItem.value.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy") ?? "-";
    requestorController.text = selectedItem.value.requestorName ?? "-";
    referenceController.text = selectedItem.value.noRequestTrip ?? "-";
  }

  void detailHeader() async {
    final result = await _repository.detailData(selectedItem.value.id!);

    result.fold((l) {
      print("ERROR DETAIL HEADER ${l.message}");
    }, (r) {
      selectedItem(r);
      setValue();
      // getApprovalLog();
    });
  }

  /*void getDataDetail() async {
    final result = await _repository.getDataDetails(selectedItem.value.id!);
    result.fold(
        (l) => Get.showSnackbar(
            CustomGetSnackBar(message: l.message, backgroundColor: Colors.red)),
        (r) {
      listDetail.value = r;
      listDetail.refresh();
    });
  }*/

  /*void getApprovalLog()async{
    final result = await _repository.getApprovalLog(selectedItem.value.idRequestTrip!);

    result.fold((l) => null, (r) {
      listLogApproval.value = r;
      listLogApproval.refresh();
    });
  }*/

}
