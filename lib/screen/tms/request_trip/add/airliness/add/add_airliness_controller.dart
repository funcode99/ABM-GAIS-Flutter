import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_flight_class_model.dart' as flight;

class AddAirlinessController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  int? airlinessID = Get.arguments['id'];
  bool? formEdit = Get.arguments['formEdit'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final departureDate = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");

  int? travellerID;
  DateTime? selectedDate;
  String? flightClass;
  String? departure;
  String? arrival;

  city.GetCityModel? cityModel;
  List<city.Data> cityList = [];
  List<flight.Data> flightList = [];
  flight.GetFlightClassModel? flightModel;

  @override
  void onInit() {
    super.onInit();
    departureDate.text;
    purposeID.printInfo(info: "purposeID");
    codeDocument.printInfo(info: "code document");
    Future.wait([
      getInfo(),
      fetchList(),
    ]);
  }

  @override
  void dispose() {
    super.dispose();
    departureDate.dispose();
  }

  Future<void> getInfo() async {
    if (airlinessID != null) {
      await repository.getAirlinessByid(airlinessID!).then((value) {
        travellerName.text = value.data?.first.employeeName ?? "";

      });
    } else {
      await storage.readEmployeeInfo().then((value) {
        print(value);
        travellerID = int.parse(value.first.id.toString());
        travellerName.text = value.first.employeeName.toString();
      });
    }

    update();
  }

  Future<void> fetchList() async {
    cityList = [];
    flightList = [];

    var dataCity = await repository.getCityList();
    cityModel = dataCity;
    cityList.addAll(dataCity.data?.toSet().toList() ?? []);

    var dataFlight = await repository.getFlightList();
    flightModel = dataFlight;
    flightList.addAll(dataFlight.data?.toSet().toList() ?? []);

    update();
  }
}
