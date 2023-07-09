import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/week_model.dart';
import 'package:intl/intl.dart';

class DashboardMeetingRoomController extends BaseController {
  List listYears = [];
  List<WeekModel> listDates = [];
  List listMonths = [
    {"id": 1, "value": "January"},
    {"id": 2, "value": "February"},
    {"id": 3, "value": "March"},
    {"id": 4, "value": "April"},
    {"id": 5, "value": "May"},
    {"id": 6, "value": "June"},
    {"id": 7, "value": "July"},
    {"id": 8, "value": "August"},
    {"id": 9, "value": "September"},
    {"id": 10, "value": "October"},
    {"id": 11, "value": "November"},
    {"id": 12, "value": "December"}
  ];
  List listDays = [""];

  DateTime? initialDate;
  DateTime? nextDate;
  DateTime? currenDate;
  int? selectedDate = DateTime.now().day;
  int? selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  List listOfDates(DateTime now) {
    listDates = [];
    int currentDay = now.weekday;
    initialDate = now.subtract(Duration(days: currentDay - 1));
    nextDate = initialDate?.add(Duration(days: 5));
    currenDate = initialDate;
    print(initialDate);
    print(nextDate);
    listDates = List<WeekModel>.generate(
        nextDate!.difference(initialDate!).inDays,
        (i) => WeekModel(
              day: DateFormat("EE").format(initialDate!.add(Duration(days: i))),
              date: int.parse(DateFormat("dd").format(initialDate!.add(Duration(days: i)))),
            )
        // "${DateFormat("EE").format(initialDate!.add(Duration(days: i)))}\n${DateFormat("dd").format(initialDate!.add(Duration(days: i)))}",
        );

    update();
    return listDates;
  }

  @override
  void onInit() {
    super.onInit();
    listYears = Iterable<int>.generate((DateTime.now().year) + 1).skip(1900).toList().reversed.toList();
    listOfDates(DateTime.now());
  }

  @override
  void dispose() {
    super.dispose();
    selectedDate = DateTime.now().day;
    selectedMonth = DateTime.now().month;
    selectedYear = DateTime.now().year;
  }
}
