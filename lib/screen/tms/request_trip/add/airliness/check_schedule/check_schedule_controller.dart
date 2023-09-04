import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart' as schedule;
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_flight_schedule_model.dart' as flight;
import 'package:gais/data/model/antavaya/get_airport_model.dart' as city;
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/reservation/airport_reservation_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CheckScheduleController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  String departure = Get.arguments['departure'];
  String arrival = Get.arguments['arrival'];
  DateTime departureDate = Get.arguments['departureDate'];
  city.Data departureModel = Get.arguments['departureModel'];
  city.Data arrivalModel = Get.arguments['arrivalModel'];
  String? adult = Get.arguments['adult'];
  String? infant = Get.arguments['infant'];
  String? child = Get.arguments['child'];
  String? airlinessID = Get.arguments['id'];
  bool? formEdit = Get.arguments['formEdit'];

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  List listOfDates = [];
  String? departureCity;
  String? arrivalCity;
  bool isLoading = true;

  flight.GetFlightScheduleModel? flightScheduleModel;
  schedule.GetAirportScheduleModel? scheduleModel1;
  List<schedule.Flights> scheduleList1 = [];
  List<schedule.Flights> scheduleList2 = [];
  List<schedule.Flights> scheduleList3 = [];
  List<schedule.Flights> scheduleList4 = [];
  List<flight.Data> flightScheduleList = [];
  GetCityModel? cityModel;
  List<List<schedule.Flights>> schedules = [];

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
    print(listOfDates);
  }

  int daysInMonth(DateTime date) {
    var initialDate = departureDate;
    var nextDate = DateTime.now().add(const Duration(days: 4));
    listOfDates = List<String>.generate(nextDate.difference(initialDate).inDays,
        (i) => "${DateFormat("MMM").format(DateTime.now())} ${int.parse(DateFormat("dd").format(DateTime.now())) + i}");
    return nextDate.difference(initialDate).inDays;
  }

  Future<void> fetchList() async {
    isLoading = true;
    flightScheduleList = [];
    scheduleList1 = [];
    scheduleList2 = [];
    scheduleList3 = [];
    scheduleList4 = [];
    schedules = [scheduleList1, scheduleList2, scheduleList3, scheduleList4];

    fetchSchedule(departureDate).then((value) => scheduleList1.addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []));
    fetchSchedule(departureDate.add(const Duration(days: 1)))
        .then((value) => scheduleList2.addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []));
    fetchSchedule(departureDate.add(const Duration(days: 2)))
        .then((value) => scheduleList3.addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []));
    fetchSchedule(departureDate.add(const Duration(days: 3)))
        .then((value) => scheduleList4.addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []));
    update();
  }

  Future<schedule.GetAirportScheduleModel?> fetchSchedule(DateTime departDate) async {
    isLoading = true;
    try {
      var scheduleData = await antavaya.getAirportSchedule(
        departureModel.code.toString(),
        arrivalModel.code.toString(),
        dateFormat.format(departDate),
        adult.toString(),
        infant.toString(),
        child.toString(),
      );
      isLoading = false;
      update();
      return scheduleData;
    } catch (e, i) {
      e.printError();
      i.printError();
      return null;
    }
  }

  Future<void> selectAirlines(
    String idFlight,
    String codeAirliness,
    String flightNo,
    String price,
    schedule.Flights flights,
  ) async {
    Get.to(AirportReservationScreen(), arguments: {
      'purposeID': purposeID,
      'codeDocument': codeDocument,
      'formEdit': formEdit,
      'flight': flights,
    });
    // if (airlinessID != null) {
    //   try {
    //     await repository
    //         .updateAirlines(
    //           airlinessID!,
    //           purposeID.toString(),
    //           idFlight,
    //           flightNo, // flight_no
    //           codeAirliness, // code airliness
    //           price.digitOnly(), // ticket price
    //         )
    //         .then(
    //           (value) => formEdit == true
    //               ? Get.off(const FormRequestTripScreen(), arguments: {'id': purposeID, 'codeDocument': codeDocument})
    //               : Get.off(const AirlinessScreen(), arguments: {'purposeID': purposeID, 'codeDocument': codeDocument, 'formEdit': formEdit}),
    //         );
    //   } catch (e, i) {
    //     e.printError();
    //     i.printError();
    //     Get.showSnackbar(
    //       const GetSnackBar(
    //         icon: Icon(
    //           Icons.error,
    //           color: Colors.white,
    //         ),
    //         message: 'Failed To Update',
    //         isDismissible: true,
    //         duration: Duration(seconds: 3),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }
    // } else {
    //   try {
    //     await repository
    //         .saveAirlines(
    //           purposeID.toString(),
    //           idFlight,
    //           flightNo, // flight_no
    //           codeAirliness, // code airliness
    //           price.digitOnly(), // ticket price
    //         )
    //         .then((value) => Get.off(const AirlinessScreen(), arguments: {
    //               'purposeID': purposeID,
    //               'codeDocument': codeDocument,
    //               'formEdit': formEdit,
    //             }));
    //   } catch (e, i) {
    //     e.printError();
    //     i.printError();
    //     Get.showSnackbar(
    //       const GetSnackBar(
    //         icon: Icon(
    //           Icons.error,
    //           color: Colors.white,
    //         ),
    //         message: 'Failed To Save',
    //         isDismissible: true,
    //         duration: Duration(seconds: 3),
    //         backgroundColor: Colors.red,
    //       ),
    //     );
    //   }
    // }
  }
}
