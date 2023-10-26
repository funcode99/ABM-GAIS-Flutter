import 'package:collection/collection.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart' as schedule;
import 'package:gais/data/model/reference/get_city_model.dart';
import 'package:gais/data/model/reference/get_flight_schedule_model.dart' as flight;
import 'package:gais/data/model/antavaya/get_airport_model.dart' as city;
import 'package:gais/data/model/request_trip/get_airliness_model.dart' as airline;
import 'package:gais/screen/tms/request_trip/add/airliness/reservation/airport_reservation_screen.dart';
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
  bool? isEdit = Get.arguments['isEdit'];
  bool? formEdit = Get.arguments['formEdit'];
  airline.Data? airlinessModel = Get.arguments['airlinessData'];

  DateFormat dateFormat = DateFormat("yyyy-MM-dd");
  List listOfDates = [];
  String? departureCity;
  String? arrivalCity;
  bool isLoading = true;
  List airliness = ["2", "4", "5", "11", "22", "48"];

  flight.GetFlightScheduleModel? flightScheduleModel;
  schedule.GetAirportScheduleModel? scheduleModel1;
  List<schedule.Flights> scheduleList1 = [];
  List<schedule.Flights> scheduleList2 = [];
  List<schedule.Flights> scheduleList3 = [];
  List<schedule.Flights> scheduleList4 = [];
  List<flight.Data> flightScheduleList = [];
  GetCityModel? cityModel;
  List<List<schedule.Flights>> schedules = [];

  // schedules = [scheduleList1, scheduleList2, scheduleList3, scheduleList4];

  @override
  void onInit() {
    super.onInit();
    daysInMonth(DateTime(DateTime.now().month));
    schedules = [scheduleList1, scheduleList2, scheduleList3, scheduleList4];
    update();
    Future.wait([fetchList()]);
    print('airlinessID : $airlinessID');
    print('airlinessID : ${airlinessModel?.pnrid}');
  }

  @override
  void dispose() {
    super.dispose();
    listOfDates = [];
    print(listOfDates);
  }

  int daysInMonth(DateTime date) {
    var initialDate = departureDate;
    var nextDate = initialDate.add(const Duration(days: 4));
    listOfDates = List<String>.generate(nextDate.difference(initialDate).inDays,
        (i) => "${DateFormat("MMM").format(initialDate)} ${int.parse(DateFormat("dd").format(initialDate)) + i}");
    return nextDate.difference(initialDate).inDays;
  }

  Future<void> fetchList() async {
    print(schedules.length);
    // flightScheduleList = [];
    // scheduleList1 = [];
    // scheduleList2 = [];
    // scheduleList3 = [];
    // scheduleList4 = [];

    schedules.forEachIndexed((i, sc) {
      airliness.forEach((e) {
        fetchSchedule(departureDate.add(Duration(days: i)), e).then((value) {
          schedules[i].addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []);
          // print(schedules[i]);
        });
        update();
      });
    });

    // fetchSchedule(departureDate).then((value) => scheduleList1.addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []));
    // fetchSchedule(departureDate.add(const Duration(days: 1)))
    //     .then((value) => scheduleList2.addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []));
    // fetchSchedule(departureDate.add(const Duration(days: 2)))
    //     .then((value) => scheduleList3.addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []));
    // fetchSchedule(departureDate.add(const Duration(days: 3)))
    //     .then((value) => scheduleList4.addAll(value?.data?.schedules?.first.flights?.toSet().toList() ?? []));

    update();
  }

  Future<schedule.GetAirportScheduleModel?> fetchSchedule(DateTime departDate, String airlines) async {
    try {
      var scheduleData = await antavaya.getAirportSchedule(
        departureModel.code.toString(),
        arrivalModel.code.toString(),
        dateFormat.format(departDate),
        adult.toString(),
        infant.toString(),
        child.toString(),
        airlines,
      );
      // print("length : ${schedules[1].length}");
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
      'id': airlinessID,
      'isEdit': isEdit,
      'adult': adult,
      'child': child,
      'infant': infant,
      'airlinessData': airlinessModel,
    });
  }
}
