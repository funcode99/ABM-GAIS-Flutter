import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;

class ActTripInfoController extends BaseController {
  final actualID = Get.arguments['idActual'];
  final zonaID = Get.arguments['idZona'];
  final tlkRate = Get.arguments['tlkRate'];

  final formKey = GlobalKey<FormState>();
  final departureDate = TextEditingController();
  final arrivalDate = TextEditingController();
  final fromCity = TextEditingController();
  final toCity = TextEditingController();

  DateTime departure = DateTime.now();
  DateTime arrival = DateTime.now();
  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy/MM/dd");

  bool isLoading = false;
  List<city.Data> cityList = [];

  @override
  void onInit() {
    super.onInit();
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    cityList = [];
    isLoading = true;
    try {
      await repository.getCityList().then((value) => cityList.addAll(value.data?.toSet().toList() ?? []));
    } catch (e) {
      e.printError();
    }
    isLoading = false;
    update();
  }

  Future<void> saveData() async {
    try {
      await actualizationTrip
          .saveTripInfo(
            actualID,
            departureDate.text,
            arrivalDate.text,
            fromCity.text,
            toCity.text,
            zonaID,
            tlkRate,
          )
          .then((value) => Get.back());
    } catch (e,i) {
      e.printError();
      i.printError();
    }
  }
}
