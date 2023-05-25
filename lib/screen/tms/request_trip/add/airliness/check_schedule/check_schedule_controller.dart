import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/request_trip/get_airliness_vendor_model.dart'
    as vendor;
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckScheduleController extends BaseController {
  int purposeID = Get.arguments['purposeID'];
  int codeDocument = Get.arguments['codeDocument'];
  int departure = Get.arguments['departure'];
  int arrival = Get.arguments['arrival'];

  List listOfDates = [];
  String? departureCity;
  String? arrivalCity;

  vendor.GetAirlinessVendorModel? vendorModel;
  List<vendor.Data> vendorList = [];
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
    listOfDates = new List<String>.generate(
        nextDate.difference(initialDate).inDays,
        (i) =>
            "${DateFormat("MMM").format(DateTime.now())} ${int.parse(DateFormat("dd").format(DateTime.now())) + i}");
    return nextDate.difference(initialDate).inDays;
  }

  Future<void> fetchList() async {
    vendorList = [];
    try {
      var response = await repository.getAirlinessVendorList();
      vendorModel = response;
      vendorList.addAll(response.data?.toSet().toList() ?? []);

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

  Future<void> selectAirlines(String idVendor) async {
    try {
      await repository
          .saveAirlines(
            purposeID.toString(),
            idVendor,
            "QG828", // flight_no
            "QG", // code airliness
            "899000", // ticket price
          )
          .then(
            (value) => Get.off(const AirlinessScreen(), arguments: {
              'purposeID': purposeID,
              'codeDocument': codeDocument
            }),
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
