import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_schedule_model.dart' as schedule;
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckScheduleController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  int? departure = Get.arguments['departure'];
  int? arrival = Get.arguments['arrival'];
  int? airlinessID = Get.arguments['id'];
  bool? formEdit = Get.arguments['formEdit'];

  List listOfDates = [];
  String? departureCity;
  String? arrivalCity;

  schedule.GetAirlinessScheduleModel? flightscheduleModel;
  List<schedule.Data> flightscheduleList = [];
  GetCityModel? cityModel;

  @override
  void onInit() {
    super.onInit();
    daysInMonth(DateTime(DateTime.now().month));
    Future.wait([fetchList()]);
  }

  @override
  void dispose() {
    super.dispose();
    listOfDates = [];
    print(listOfDates.length);
  }

  int daysInMonth(DateTime date) {
    var initialDate = new DateTime.now();
    var nextDate = new DateTime.now().add(Duration(days: 4));
    listOfDates = new List<String>.generate(nextDate.difference(initialDate).inDays,
        (i) => "${DateFormat("MMM").format(DateTime.now())} ${int.parse(DateFormat("dd").format(DateTime.now())) + i}");
    return nextDate.difference(initialDate).inDays;
  }

  Future<void> fetchList() async {
    flightscheduleList = [];
    try {
      var response = await repository.getAirlinessScheduleList();
      flightscheduleModel = response;
      flightscheduleList.addAll(response.data?.toSet().toList() ?? []);

      var cityData = await repository.getCityList();
      cityModel = cityData;
      cityModel?.data?.where((city) => city.id == departure).forEach((e) {
        departureCity = "${e.cityName} (${e.cityCode})";
        print("${e.cityName} (${e.cityCode})");
      });
      cityModel?.data?.where((city) => city.id == arrival).forEach((e) {
        arrivalCity = "${e.cityName} (${e.cityCode})";
        print("${e.cityName} (${e.cityCode})");
      });

      update();
    } catch (e) {
      Get.showSnackbar(
        const GetSnackBar(
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
          message: 'Failed To Load Data',
          isDismissible: true,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> selectAirlines(
    String idFlight,
    String codeAirliness,
    String flightNo,
    String price,
  ) async {
    if (airlinessID != null) {
      try {
        await repository
            .updateAirlines(
              airlinessID!,
              purposeID.toString(),
              idFlight,
              flightNo, // flight_no
              codeAirliness, // code airliness
              price.digitOnly(), // ticket price
            )
            .then(
              (value) => formEdit == true
                  ? Get.off(FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
                  : Get.off(
                      const AirlinessScreen(),
                      arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit},
                    ),
            );
      } catch (e, i) {
        e.printError();
        i.printError();
        Get.showSnackbar(
          const GetSnackBar(
            icon: Icon(
              Icons.error,
              color: Colors.white,
            ),
            message: 'Failed To Update',
            isDismissible: true,
            duration: Duration(seconds: 3),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else {
      try {
        await repository
            .saveAirlines(
              purposeID.toString(),
              idFlight,
              "QG828", // flight_no
              "QG", // code airliness
              "899000", // ticket price
            )
            .then(
              (value) => Get.off(const AirlinessScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit}),
            );
      } catch (e) {
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
}
