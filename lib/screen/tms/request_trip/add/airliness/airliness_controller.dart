import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/reference/get_status_document_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_bytrip_model.dart'
    as airliness;
import 'package:get/get.dart';

class AirlinessController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int codeDocument = Get.arguments['codeDocument'];
  String travellerName = "";
  bool? isLoading;

  GetStatusDocumentModel? statusModel;
  List<airliness.Data> airlinessList = [];
  airliness.GetAirlinessBytripModel? airlinessModel;

  @override
  void onInit() {
    super.onInit();

    purposeID.printInfo(info: "purposeID");
    codeDocument.printInfo(info: "code document");
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    airlinessList = [];
    try {
      var airliessData = await repository.getAirlinessBytripList(purposeID);
      airlinessModel = airliessData;
      airlinessList.addAll(
          airliessData.data?.where((e) => e.idRequestTrip == purposeID).toSet().toList() ??
              []);

      await storage
          .readEmployeeInfo()
          .then((value) => travellerName = value.first.employeeName.toString());

      var status = await repository.getStatusDocument();
      statusModel = status;

      update();
    } catch (e) {
      e.printError();
    }
  }

  Future<void> delete(int id) async {
    isLoading = true;
    try {
      await repository.deleteAirliness(id).then((value) {
        fetchList();
        GetSnackBar(
          icon: Icon(
            Icons.info,
            color: Colors.white,
          ),
          message: "Data Deleted",
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: greenColor,
        );
      });
      isLoading = false;
      update();
    } catch (e) {
      GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      );
    }
  }
}
