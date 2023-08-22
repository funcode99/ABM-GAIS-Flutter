import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/actualization_trip/get_activities_byactualid_model.dart' as act;
import 'package:gais/data/model/actualization_trip/get_trip_info_byactualid_model.dart' as ti;
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
      await actualizationTrip.getTripInfoByActual(actualID).then((value) => listTripInfo.addAll(value.data?.toSet().toList() ?? []));

      await actualizationTrip.getActivitiesByActual(actualID).then((value) => listActivities.addAll(value.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }
    isLoading = false;
    update();
  }
}
