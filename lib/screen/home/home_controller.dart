import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/meeting_room_used.dart';
import 'package:gais/data/model/supplies_out_model.dart';
import 'package:gais/data/model/trip_purpose_model.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:gais/screen/menu/menu_screen.dart';
import 'package:gais/screen/notification/notification_screen.dart';
import 'package:gais/screen/profil/profil_screen.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  int? currentIndex = Get.arguments;
  int selectedIndex = 0;
  int? selectedMonth;
  int? selectedYear;

  var monthselVal = '';
  var dayselVal = '';
  var yearselVal = '';
  int daysIn = 32;
  late List listdates = [];
  late List listyears = [];
  // late List<dynamic> listMonths = [];

  static const List<Widget> widgetOptions = <Widget>[
    HomeScreen(),
    MenuScreen(),
    NotificationScreen(),
    ProfilScreen()
  ];

  static const List<String> appTitle = <String>[
    "Home",
    "Menu",
    "Notification",
    "Profil"
  ];

  List<TripPurposeModel> tpData = [
    TripPurposeModel('Company\nBusiness', 15, brownColor),
    TripPurposeModel('Field Break', 2, infoColor),
    TripPurposeModel('Site Visit', 3, successColor),
    TripPurposeModel('Taxi Voucher Only', 1, warningColor),
    TripPurposeModel('Taxi Voucher Only', 1, warningColor),
  ];

  List<MeetRoomUsedModel> mrData = [
    MeetRoomUsedModel("Room 999", 4, Color(0xffFFCC06)),
    MeetRoomUsedModel("Room ABC", 8, Color(0xff6B95D2)),
    MeetRoomUsedModel("Room 123", 10, Color(0xffC4E87D)),
    MeetRoomUsedModel("Room A", 2, Color(0xffE0F1E3)),
  ];

  List<SuppliesOutModel> soData = [
    SuppliesOutModel("Paper Clip", 4, Color(0xff5B9BD5)),
    SuppliesOutModel("Pen", 6, Color(0xff66AD2D)),
    SuppliesOutModel("Pencil", 12, Color(0xffED7D31)),
  ];

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

  @override
  void onInit() {
    super.onInit();
    if (currentIndex != null) selectedIndex = currentIndex ?? 0;
    cekRole();
    update();

    listyears =
        Iterable<int>.generate((DateTime.now().year) + 1)
            .skip(1900)
            .toList()
            .reversed
            .toList();
  }

  void cekRole() async{
    print("role : ${await storage.readRole()}");
  }

}
