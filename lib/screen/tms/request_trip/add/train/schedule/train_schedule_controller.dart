import 'package:collection/collection.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/antavaya/get_train_schedule_model.dart';
import 'package:gais/screen/tms/request_trip/add/train/reservation/train_reservation_screen.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:gais/data/model/antavaya/get_train_station_model.dart' as station;
import 'package:gais/data/model/antavaya/get_train_schedule_model.dart' as schedule;

class TrainScheduleController extends BaseController {
  String purposeID = Get.arguments['purposeID'];
  int? codeDocument = Get.arguments['codeDocument'];
  bool? formEdit = Get.arguments['formEdit'];
  bool? isEdit = Get.arguments['isEdit'];
  station.Data? originModel = Get.arguments['origin'];
  station.Data? destinationModel = Get.arguments['destination'];
  DateTime? departureDate = Get.arguments['departDate'];
  DateTime? returnDate = Get.arguments['returnDate'];
  String? adult = Get.arguments['adult'];
  String? child = Get.arguments['child'];
  String? trainID = Get.arguments['id'];

  bool isLoading = true;
  List listOfDates = [];

  DateFormat saveDateFormat = DateFormat("yyyy-MM-dd");
  DateFormat dateFormat = DateFormat("dd MMM yyy");

  List<schedule.Journeys> scheduleList1 = [];
  List<schedule.Journeys> scheduleList2 = [];
  List<schedule.Journeys> scheduleList3 = [];
  List<schedule.Journeys> scheduleList4 = [];
  List<List<schedule.Journeys>> schedules = [];

  @override
  void onInit() {
    super.onInit();
    daysInMonth(DateTime(DateTime.now().month));
    schedules = [scheduleList1, scheduleList2, scheduleList3, scheduleList4];
    update();
    Future.wait([fetchList()]);
  }

  Future<void> fetchList() async {
    isLoading = true;
    scheduleList1 = [];
    scheduleList2 = [];
    scheduleList3 = [];
    scheduleList4 = [];

    schedules.forEachIndexed((i, sc) {
      fetchSchedule(departureDate!.add(Duration(days: i))).then((value) {
        schedules[i].addAll(value?.data?.schedules?.first.journeys?.toSet().toList() ?? []);
        // print(schedules[i]);
      });
      update();
    });

    update();
  }

  Future<schedule.GetTrainScheduleModel?> fetchSchedule(DateTime departDate) async {
    try {
      var scheduleData = await antavaya.getTrainSchedule(
        originModel!.stationCode.toString(),
        destinationModel!.stationCode.toString(),
        saveDateFormat.format(departDate),
        adult!,
        child!,
      );
      isLoading = false;
      update();
      return scheduleData;
    } catch (e) {
      e.printError();
      return null;
    }
  }

  int daysInMonth(DateTime date) {
    var initialDate = departureDate!;
    var nextDate = initialDate.add(const Duration(days: 4));
    listOfDates = List<String>.generate(nextDate.difference(initialDate).inDays,
        (i) => "${DateFormat("MMM").format(initialDate)} ${int.parse(DateFormat("dd").format(initialDate)) + i}");
    return nextDate.difference(initialDate).inDays;
  }

  void selectTrain(schedule.Journeys train, TrainSegments trainSegments) {
    Get.to(TrainReservationScreen(), arguments: {
      'purposeID': purposeID,
      'codeDocument': codeDocument,
      'formEdit': formEdit,
      'isEdit': isEdit,
      'trainData': train.copyWith(segments: [trainSegments]),
      'id': trainID,
      'adult': adult,
      'child': child,
    });
  }
}
