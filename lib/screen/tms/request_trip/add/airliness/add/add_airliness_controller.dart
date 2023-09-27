import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/antavaya/get_airport_model.dart' as city;
import 'package:gais/data/model/reference/get_flight_class_model.dart' as flight;
import 'package:gais/data/model/request_trip/get_airliness_model.dart' as airliness;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddAirlinessController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  String? airlinessID = Get.arguments['id'];
  bool? formEdit = Get.arguments['formEdit'];
  bool? isEdit = Get.arguments['isEdit'];
  airliness.Data? airlinessModel = Get.arguments['airlinessData'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final departureDate = TextEditingController();
  final travellerflightClass = TextEditingController();
  final passengerAdult = TextEditingController();
  final passengerInfant = TextEditingController();
  final passengerChild = TextEditingController();

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  DateTime lastDate = DateTime.now().add(const Duration(days: 30));

  int? travellerID;
  int? flightClassID;
  DateTime? selectedDate;
  String? flightClass;
  String? departure;
  String? arrival;
  Color borderColor = greyColor;
  bool isLoading = false;

  GetRequestTripByidModel? rtModel;
  // city.GetCityModel? cityModel;
  city.Data? arrivalModel;
  city.Data? departureModel;
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
    print('pnrID : ${airlinessModel?.pnrid}');
  }

  @override
  void dispose() {
    super.dispose();
    departureDate.dispose();
  }

  Future<void> getInfo() async {
    if (airlinessID != null) {
      await antavaya.getRsvTicket(airlinessModel?.pnrid).then((value) {
        var rsv = jsonDecode(value);
        travellerName.text = "${rsv['Passengers'][0]['FirstName']} ${rsv['Passengers'][0]['LastName']} ";
        departureDate.text = rsv['FlightDetails'][0]['DepartDate'];
        travellerflightClass.text = rsv['FlightDetails'][0]['Class'];
        selectedDate = DateTime.parse(rsv['FlightDetails'][0]['DepartDate']);
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
    isLoading = true;
    // var dataCity = await repository.getCityList();
    // cityModel = dataCity;
    // cityList.addAll(dataCity.data?.toSet().toList() ?? []);
    await antavaya.getairport().then((value) => cityList.addAll(value.data?.toSet().toList() ?? []));

    var dataFlight = await repository.getFlightClassList();
    flightModel = dataFlight;
    flightList.addAll(dataFlight.data?.toSet().toList() ?? []);

    var rtData = await requestTrip.getRequestTripByid(purposeID);
    rtModel = rtData;
    lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");

    isLoading = false;
    update();
  }

}
