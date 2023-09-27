import 'package:gais/base/base_controller.dart';
import 'package:gais/screen/tms/request_trip/add/train/reservation/train_reservation_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/antavaya/get_train_station_model.dart' as station;
import 'package:gais/data/model/antavaya/get_airport_schedule_model.dart' as schedule;

class TrainScheduleController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  station.Data? originModel = Get.arguments['origin'];
  station.Data? destinationModel = Get.arguments['destination'];
  DateTime? departureDate = Get.arguments['departDate'];
  DateTime? returnDate = Get.arguments['returnDate'];
  String? adult = Get.arguments['adult'];
  String? child = Get.arguments['child'];

  bool isLoading = false;
  List listOfDates = [];

  List<schedule.Flights> scheduleList1 = [];
  List<schedule.Flights> scheduleList2 = [];
  List<schedule.Flights> scheduleList3 = [];
  List<schedule.Flights> scheduleList4 = [];
  List<List<schedule.Flights>> schedules = [];

  @override
  void onInit() {
    super.onInit();
    daysInMonth(DateTime(DateTime.now().month));
    schedules = [scheduleList1, scheduleList2, scheduleList3, scheduleList4];
    update();
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {}

  int daysInMonth(DateTime date) {
    var initialDate = departureDate!;
    var nextDate = initialDate.add(const Duration(days: 4));
    listOfDates = List<String>.generate(nextDate.difference(initialDate).inDays,
        (i) => "${DateFormat("MMM").format(initialDate)} ${int.parse(DateFormat("dd").format(initialDate)) + i}");
    return nextDate.difference(initialDate).inDays;
  }

  void selectTrain() {
    Get.to(TrainReservationScreen(), arguments: {
      'purposeID': purposeID,
    });
  }
}
