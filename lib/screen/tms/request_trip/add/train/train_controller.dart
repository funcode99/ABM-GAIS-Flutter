import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/request_trip/get_train_trip_bytripid_model.dart' as train;
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/add/transportation/transportation_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TrainController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  List<train.Data> trainList = [];
  train.GetTrainTripBytripidModel? trainModel;

  @override
  void onInit() {
    super.onInit();
    Future.wait([getList()]);
    print('purposeID: $purposeID');
  }

  Future<void> getList() async {
    trainList = [];
    try {
      var trainData = await requestTrip.getTrainTripByTrip(purposeID);
      trainModel = trainData;
      trainList.addAll(trainData.data?.toSet().toList() ?? []);
    } catch (e) {
      e.printError();
    }
    update();
  }

  Future<void> delete(String id) async {
    try {
      await requestTrip.deleteTrainTrip(id).then((value) => Get.showSnackbar(
            const GetSnackBar(
              icon: Icon(
                Icons.error,
                color: Colors.white,
              ),
              message: 'Data Deleted',
              isDismissible: true,
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
            ),
          ));
    } catch (e) {
      e.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Delete Data',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
    update();
  }

  void next() {
    if (formEdit == true) {
      Get.back();
    } else {
      Get.to(const TransportationScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument});
    }
  }
}
