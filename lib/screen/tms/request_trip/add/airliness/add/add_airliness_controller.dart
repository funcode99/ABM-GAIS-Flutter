import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/antavaya/get_airport_model.dart' as city;
import 'package:gais/data/model/reference/get_flight_class_model.dart' as flight;
import 'package:gais/data/model/request_trip/get_airliness_model.dart' as airliness;
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/data/model/request_trip/get_request_trip_byid_model.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/check_schedule/check_schedule_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddAirlinessController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  String? airlinessID = Get.arguments['id'];
  bool? formEdit = Get.arguments['formEdit'];
  bool? isEdit = Get.arguments['isEdit'];
  airliness.Data? airlinessModel = Get.arguments['airlinessData'];
  bool? isBooking = Get.arguments['booking'];

  final formKey = GlobalKey<FormState>();
  final travellerName = TextEditingController();
  final departureDate = TextEditingController();
  final travellerflightClass = TextEditingController();
  final passengerAdult = TextEditingController();
  final passengerInfant = TextEditingController();
  final passengerChild = TextEditingController();

  DateFormat dateFormat = DateFormat("dd-MM-yyyy");
  DateFormat saveFormat = DateFormat("yyyy-MM-dd");
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
  List<guest.Data> travellerList = [];
  flight.GetFlightClassModel? flightModel;

  @override
  void onInit() {
    super.onInit();
    departureDate.text;
    purposeID.printInfo(info: "purposeID");
    codeDocument.printInfo(info: "code document");
    Future.wait([
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
      await requestTrip.getAirlinessByid(airlinessID!).then((value) {
        travellerName.text = value.data?.first.employeeName ?? "";
        selectedDate = DateTime.parse(value.data!.first.departureDate.toString());
        departureDate.text = dateFormat.format(selectedDate!) ?? "";
        travellerflightClass.text = value.data?.first.flightClass ?? "";
        cityList.where((element) => element.code == value.data?.first.origin).first.code.printInfo();
        departureModel = cityList.where((element) => element.code == value.data?.first.origin).first;
        arrivalModel = cityList.where((element) => element.code == value.data?.first.destination).first;
        print(value.data?.first.adult);
        passengerAdult.text = value.data?.first.adult.toString() ?? '1';
        passengerChild.text = value.data?.first.childs.toString() ?? '0';
        passengerInfant.text = value.data?.first.infant.toString() ?? '0';
      });
      travellerList.add(guest.Data(
        // idEmployee: value.first.id.toString(),
        nameGuest: travellerName.text,
      ));

      // await antavaya.getRsvTicket(airlinessModel!.pnrid.toString()).then((value) {
      //   var rsv = jsonDecode(value);
      //   travellerName.text = "${rsv['Passengers'][0]['FirstName']} ${rsv['Passengers'][0]['LastName']} ";
      //   departureDate.text = rsv['FlightDetails'][0]['DepartDate'];
      //   travellerflightClass.text = rsv['FlightDetails'][0]['Class'];
      //   selectedDate = DateTime.parse(rsv['FlightDetails'][0]['DepartDate']);
      // });
    } else {
      await storage.readEmployeeInfo().then((value) {
        travellerID = int.parse(value.first.id.toString());
        travellerName.text = value.first.employeeName.toString();
        // flightClassID = value.first.idFlightClass?.toInt();
        // travellerflightClass.text = value.first.flightClass ?? "";
        travellerList.add(guest.Data(
          idEmployee: value.first.id.toString(),
          nameGuest: value.first.employeeName.toString(),
        ));
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

    await requestTrip.getGuestBytripList(purposeID).then((value) => travellerList.addAll(value.data?.toSet().toList() ?? []));

    var dataFlight = await repository.getFlightClassList();
    flightModel = dataFlight;
    flightList.addAll(dataFlight.data?.toSet().toList() ?? []);

    var rtData = await requestTrip.getRequestTripByid(purposeID);
    rtModel = rtData;
    lastDate = DateTime.parse(rtModel?.data?.first.dateArrival.toString() ?? "");

    isLoading = false;
    getInfo();
    update();
  }

  void save() {
    if (airlinessID != null) {
      updateData();
      if (isBooking == true) {
        Get.off(const CheckScheduleScreen(), arguments: {
          'purposeID': purposeID,
          'codeDocument': codeDocument,
          'departure': departure.toString(),
          'arrival': arrival.toString(),
          'departureModel': departureModel,
          'arrivalModel': arrivalModel,
          'departureDate': selectedDate,
          'adult': passengerAdult.text,
          'infant': passengerInfant.text,
          'child': passengerChild.text,
          // 'flightClass': int.parse(flightClass.toString()),
          'flightClass': flightClassID,
          'formEdit': formEdit,
          'isEdit': isEdit,
          'id': airlinessID,
          'airlinessData': airlinessModel,
        });
      }
    } else {
      saveData();
    }

    update();
  }

  Future<void> saveData() async {
    try {
      await requestTrip
          .saveAirlines(
            purposeID.toString(),
            "1",
            "",
            travellerflightClass.text,
            "",
            "",
            departure.toString(),
            arrival.toString(),
            saveFormat.format(selectedDate!),
            passengerAdult.text,
            passengerChild.text,
            passengerInfant.text,
            travellerName.text,
            travellerflightClass.text,
          )
          .then(
            (value) => formEdit == true
                ? Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
                : Get.off(const AirlinessScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit}),
          );
    } catch (e) {
      e.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Save',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> updateData() async {
    try {
      await requestTrip
          .updateAirlines(
            airlinessID!,
            purposeID.toString(),
            "1",
            "",
            travellerflightClass.text,
            "",
            "",
            departureModel!.code.toString(),
            arrivalModel!.code.toString(),
            saveFormat.format(selectedDate!),
            passengerAdult.text,
            passengerChild.text,
            passengerInfant.text,
            travellerName.text,
            travellerflightClass.text,
          )
          .then(
            (value) => formEdit == true
                ? Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
                : Get.off(const AirlinessScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit}),
          );
    } catch (e) {
      e.printError();
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Save',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }
}
