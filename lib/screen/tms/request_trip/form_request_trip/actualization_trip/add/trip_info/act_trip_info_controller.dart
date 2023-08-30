import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;

class ActTripInfoController extends BaseController {
  final String actualID = Get.arguments['idActual'];
  final String zonaID = Get.arguments['idZona'];
  final String tlkRate = Get.arguments['tlkRate'];
  final bool isEdit = Get.arguments['isEdit'];
  final String? idTripInfo = Get.arguments['id'];

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
    print("trip info id: $idTripInfo");
    print("actual id: $actualID");
    Future.wait([fetchList()]);
    if (isEdit) {
      fetchData();
    }
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
    if (isEdit) {
      updateData();
    } else {
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
      } catch (e, i) {
        e.printError();
        i.printError();
      }
    }
  }

  Future<void> fetchData() async {
    try {
      await actualizationTrip.getTripInfoByID(idTripInfo!).then((value) {
        departureDate.text = dateFormat.format(DateTime.parse(value.data?.first.dateDeparture.toString() ?? ""));
        arrivalDate.text = dateFormat.format(DateTime.parse(value.data?.first.dateArrival.toString() ?? ""));
        fromCity.text = value.data?.first.idCityFrom.toString() ?? "";
        toCity.text = value.data?.first.idCityTo.toString() ?? "";
      });
    } catch (e) {
      e.printError();
    }
    update();
  }

  Future<void> updateData() async {
    try {
      await actualizationTrip
          .updateTripInfo(
            idTripInfo!,
            actualID,
            departureDate.text,
            arrivalDate.text,
            fromCity.text,
            toCity.text,
            zonaID,
            tlkRate,
          )
          .then((value) => Get.back());
    } catch (e, i) {
      e.printError();
      i.printError();
    }
  }


}
