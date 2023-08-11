import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart' as city;
import 'package:gais/data/model/reference/get_flight_class_model.dart' as flight;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddAirlinessController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  String? airlinessID = Get.arguments['id'];
  bool? formEdit = Get.arguments['formEdit'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final departureDate = TextEditingController();
  final travellerflightClass = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime lastDate = DateTime.now().add(const Duration(days: 30));

  int? travellerID;
  int? flightClassID;
  DateTime? selectedDate;
  String? flightClass;
  String? departure;
  String? arrival;

  GetRequestTripByidModel? rtModel;
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
        travellerID = int.parse(value.first.id.toString());
        travellerName.text = value.first.employeeName.toString();
        // flightClassID = value.first.idFlightClass?.toInt();
        // travellerflightClass.text = value.first.flightClass ?? "";
      });
      await storage.readEmployeeFlight().then((value) {
        travellerflightClass.text = value.first.flightClass.toString();
        flightClassID = value.first.idFlightClass.toInt();
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

    var dataFlight = await repository.getFlightClassList();
    flightModel = dataFlight;
    flightList.addAll(dataFlight.data?.toSet().toList() ?? []);

    var rtData = await repository.getRequestTripByid(purposeID);
    rtModel = rtData;
    lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");

    update();
  }
}
