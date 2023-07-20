import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/model/week_model.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

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
  List<comp.Data> listCompany = [];
  List<site.Data> listSite = [];
  List listFloor = [];
  List listRoom = [];

  DateTime? initialDate;
  DateTime? nextDate;
  DateTime? currenDate;
  int? selectedDate = DateTime.now().day;
  int? selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;
  int? selectedCompany;
  int? selectedSite;
  int? selectedFloor;
  int? selectedRoom;

  bool loadCompany = false;
  bool loadSite = false;
  bool loadFloor = false;
  bool loadRoom = false;

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

  Future<void> listOfCompany() async {
    loadCompany = true;
    listCompany = [];
    await repository.getCompanyList().then((value) => listCompany.addAll(value.data?.toSet().toList() ?? []));
    loadCompany = false;
    update();
  }

  Future<void> listOfSite(int idCompany) async {
    loadSite = true;
    listSite = [];
    await repository.getSiteListByCompanyID(idCompany).then((value) => listSite.addAll(value.data?.toSet().toList() ?? []));
    loadSite = false;
    update();
  }

  Future<void> listOfFLoor(int idSite) async {
    loadFloor = true;
    listFloor = [];
    loadFloor = false;
    update();
  }

  Future<void> listOfRoom(int idFloor) async{
    loadRoom = true;
    listRoom = [];
    loadRoom = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    listYears = Iterable<int>.generate((DateTime.now().year) + 1).skip(1900).toList().reversed.toList();
    listOfDates(DateTime.now());
    listOfCompany();
  }

  @override
  void dispose() {
    super.dispose();
    selectedDate = DateTime.now().day;
    selectedMonth = DateTime.now().month;
    selectedYear = DateTime.now().year;
  }
}
