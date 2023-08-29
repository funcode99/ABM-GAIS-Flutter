import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/get_activities_byactualid_model.dart' as act;
import 'package:gais/data/model/actualization_trip/get_actual_trip_model.dart' as actual;
import 'package:gais/data/model/actualization_trip/get_trip_info_byactualid_model.dart' as ti;
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ActualizationTripController extends BaseController {
  final actualID = Get.arguments['idActual'];
  final zonaID = Get.arguments['idZona'];
  final tlkRate = Get.arguments['tlkRate'];

  final formKey = GlobalKey<FormState>();
  final purpose = TextEditingController();
  final totalTLK = TextEditingController();
  final notes = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  bool isLoading = false;

  actual.Data? actualModel;
  List<ti.Data> listTripInfo = [];
  List<act.Data> listActivities = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
    print("actualID : $actualID");
  }

  Future<void> fetchList() async {
    listTripInfo = [];
    listActivities = [];
    isLoading = true;
    try {
      await actualizationTrip.getActualTripByID(actualID).then((value) {
        actualModel = value.data?.first;
        purpose.text = value.data?.first.purpose ?? "";
        totalTLK.text = value.data?.first.totalTlk?.toInt().toCurrency().toString() ?? "";
        notes.text = value.data?.first.notes ?? "";
      });

      await actualizationTrip
          .getTripInfoByActual(actualID)
          // .then((value) => print("trip info data: ${value.data?.where((e) => e.deletedAt==null).first.deletedAt}"));
          .then((value) => listTripInfo.addAll(value.data?.where((e) => e.deletedAt == null).toSet().toList() ?? []));

      await actualizationTrip
          .getActivitiesByActual(actualID)
          .then((value) => listActivities.addAll(value.data?.where((e) => e.deletedAt == null).toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> deleteTripInfo(String id) async {
    try {
      await actualizationTrip.deleteTripInfoByID(id).then(
            (value) => Get.showSnackbar(GetSnackBar(
              icon: Icon(
                Icons.error,
                color: Colors.white,
              ),
              message: "Data Deleted",
              isDismissible: true,
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
            )),
          );
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
    fetchList();
    update();
  }

  Future<void> deleteActivities(String id) async {
    try {
      await actualizationTrip.deleteActivitiesByID(id).then(
            (value) => Get.showSnackbar(GetSnackBar(
              icon: Icon(
                Icons.error,
                color: Colors.white,
              ),
              message: "Data Deleted",
              isDismissible: true,
              duration: Duration(seconds: 3),
              backgroundColor: Colors.green,
            )),
          );
    } catch (e, i) {
      e.printError();
      i.printError();
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Delete Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
    fetchList();
    update();
  }

  Future<void> updateActualization() async {
    try {
      await actualizationTrip
          .updateActualizationTrip(
            actualID,
            actualModel!.idRequestTrip.toString(),
            purpose.text,
            totalTLK.text.digitOnly(),
            notes.text,
          )
          .then((value) => submitActualization());
    } catch (e) {
      e.printError();
    }
  }

  Future<void> submitActualization() async {
    try {
      await actualizationTrip.submitActualizationTripByID(actualID).then((value) => Get.showSnackbar(const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: "Data Submitted",
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.green,
          )));
    } catch (e) {
      e.printError();
      Get.showSnackbar(const GetSnackBar(
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
        message: "Submit Failed",
        isDismissible: true,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
      ));
    }
  }
}
