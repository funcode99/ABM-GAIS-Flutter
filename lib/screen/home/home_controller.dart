import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/const/color.dart';
import 'package:gais/data/model/meeting_room_used.dart';
import 'package:gais/data/model/supplies_out_model.dart';
import 'package:gais/data/model/trip_purpose_model.dart';
import 'package:gais/screen/dashboard/dashboard_screen.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:gais/screen/menu/menu_screen.dart';
import 'package:gais/screen/notification/notification_screen.dart';
import 'package:gais/screen/profil/profil_screen.dart';
import 'package:get/get.dart';

class HomeController extends BaseController {
  final selectedIndex = 0.obs;


  static const List<Widget> widgetOptions = <Widget>[
    MenuScreen(),
    DashboardScreen(),
    NotificationScreen(),
    ProfilScreen()
  ];

  static const List<String> appTitle = <String>[
    "Home",
    "Dashboard",
    "Notification",
    "Profile"
  ];

  @override
  void onInit() {
    super.onInit();
    cekRole();
    update();
  }


  void cekRole() async{
    print("role : ${await storage.readRole()}");
  }

}
