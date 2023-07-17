import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/meeting_room_used.dart';
import 'package:gais/data/model/supplies_out_model.dart';
import 'package:gais/data/model/trip_purpose_model.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              centerTitle: true,
              title: Text(HomeController.appTitle.elementAt(controller.selectedIndex), style: appTitle),
              flexibleSpace: TopBar(),
            ),
            body: HomeController.widgetOptions.elementAt(controller.selectedIndex),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 10,
              items: [
                BottomNavigationBarItem(icon: Icon(controller.selectedIndex != 0 ? IconlyLight.home : IconlyBold.home), label: ""),
                BottomNavigationBarItem(icon: Icon(controller.selectedIndex != 1 ? IconlyLight.chart : IconlyBold.chart), label: ""),
                BottomNavigationBarItem(icon: Icon(controller.selectedIndex != 2 ? IconlyLight.notification : IconlyBold.notification), label: ""),
                BottomNavigationBarItem(icon: Icon(controller.selectedIndex != 3 ? IconlyLight.profile : IconlyBold.profile), label: ""),
              ],
              currentIndex: controller.selectedIndex,
              selectedItemColor: Colors.black,
              unselectedItemColor: Colors.grey,
              onTap: (index) {
                controller.selectedIndex = index;
                // scrindex != null
                //     ? Get.offAll(HomeScreen(), arguments: index)
                //     : scrindex;
                // Get.off(HomeController.widgetOptions[index]);
                controller.update();
                // print("scrindex $scrindex");
                // print("selected index: ${controller.selectedIndex}");
              },
            ),
          );
        });
  }
}
