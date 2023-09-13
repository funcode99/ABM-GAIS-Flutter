import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/reference/get_company_model.dart' as comp;
import 'package:gais/data/model/reference/get_site_model.dart' as site;
import 'package:gais/data/model/week_model.dart';
import 'package:gais/data/repository/booking_meeting_room/dashboard_meeting_room_repository.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class NewDashboardMeetingRoomController extends BaseController with MasterDataMixin {
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
  DateTime? currentDate;
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
    nextDate = initialDate?.add(const Duration(days: 5));
    currentDate = initialDate;
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

  Future<void> listOfSite(String idCompany) async {
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

  Future<void> listOfRoom(int idFloor) async {
    loadRoom = true;
    listRoom = [];
    loadRoom = false;
    update();
  }

  DateTime? startDate;
  DateTime? endDate;
  DateFormat formatFilter = DateFormat("yyyy-MM-dd");
  final DashboardMeetingRoomRepository _repository = Get.find();

  List<BookingMeetingRoomModel> listHeader = [];

  Map<String, dynamic> listMap = {};

  final List<DateTime> _listHours = [
    DateTime.now().copyDateWith(hour: 7, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 8, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 8, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 9, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 9, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 10, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 10, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 11, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 11, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 12, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 12, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 13, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 13, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 14, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 14, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 15, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 15, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 16, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 16, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 17, minute: 00, second: 0),
  ];

  @override
  void onInit() {
    super.onInit();
    listYears = Iterable<int>.generate((DateTime.now().year) + 1).skip(2020).toList().reversed.toList();
    listOfDates(DateTime.now());
    listOfCompany();

    getHeader();
  }

  @override
  void dispose() {
    super.dispose();
    selectedDate = DateTime.now().day;
    selectedMonth = DateTime.now().month;
    selectedYear = DateTime.now().year;
  }


  void getHeader() async {
    String date = "$selectedYear-$selectedMonth-$selectedDate";
    final result = await _repository.getData(
        data: {
          "start_date" : date,
          "end_date" : date,
        }
    );

    result.fold((l) {
        Get.showSnackbar(CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
        listHeader.clear();
      },
      (r) {
        listHeader.clear();
        listHeader.addAll(r);

        populateMapping();
      });
  }


  void populateMapping(){
    Map<String, dynamic> tempMap = {};
    int position = 0;
    listMap.clear();

    for (BookingMeetingRoomModel element in listHeader) {
      tempMap.putIfAbsent("${element.idMeetingRoom}", () => {
        "room_name" : element.nameMeetingRoom,
        "listBooking" : listHeader.where((e) => e.idMeetingRoom == element.idMeetingRoom).toList(),
        "listMappedBooking" : [],
      });
    }
    tempMap.forEach((key, value) {
      List<BookingMeetingRoomModel> tempList = List<BookingMeetingRoomModel>.from(value["listBooking"]);
      List<BookingMeetingRoomModel> tempBookingMeetingRoomList = [];

      for (BookingMeetingRoomModel element in tempList) {
        DateTime? startTime = element.startTime?.toDate(originFormat: "HH:mm:ss");
        DateTime? endTime = element.endTime?.toDate(originFormat: "HH:mm:ss");
        if(startTime != null && endTime != null){
          int startHour = startTime.hour;
          int startMinute = startTime.minute;
          int endHour = endTime.hour;
          int endMinute = endTime.minute;

          if(startMinute >= 0 && startMinute < 30){
            startMinute = 0;
          }else if(startMinute >= 30 && startMinute <= 59){
            startMinute = 30;
          }

          if(endMinute >= 0 && endMinute < 30){
            endMinute = 0;
          }else if(endMinute >= 30 && endMinute <= 59){
            endMinute = 30;
          }

          int duration = ((endHour * 60) + endMinute) - ((startHour * 60) + startMinute);
          element.hour = startHour;
          element.minute = startMinute;
          element.durationInMinute = duration;
          element.position = position;

          tempBookingMeetingRoomList.add(element);
        }
      }

      tempMap[key]["listMappedBooking"] = tempBookingMeetingRoomList;
      position++;

    });
    listMap = Map<String, dynamic>.from(tempMap);
    update();
  }

  List<BookingMeetingRoomModel> getListBooking(){
    List<BookingMeetingRoomModel> result = [];

    listMap.forEach((key, value) {
      result.addAll(List<BookingMeetingRoomModel>.from(value["listMappedBooking"]));
    });

    return result;
  }

  List<String> getListRoom(){
    List<String> result = [];
    listMap.forEach((key, value) {
      result.add(value["room_name"]);
    });

    return result;
  }

  Color getColor(dynamic codeStatusDoc){
    Color color = const Color(0XFF97B3C6);
    switch(codeStatusDoc.toString()){
      case "0" : //BookingMeetingRoomEnum.draft.value
        color = const Color(0XFFf7a516);
        break;
      case "10" : //BookingMeetingRoomEnum.done.value
        color = const Color(0xff87C556);
        break;
      case "9" : //BookingMeetingRoomEnum.cancel.value
        color = const Color(0xffF04438);
        break;
      case "1" : //BookingMeetingRoomEnum.booked.value
      default:
        color = const Color(0XFF97B3C6);
        break;
    }
    return color;
  }

}