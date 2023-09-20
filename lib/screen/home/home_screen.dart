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
    int index = 0;
    if (Get.arguments != null) {
      index = Get.arguments;
    } else {
    }

    final HomeController controller = Get.put(HomeController()
      ..selectedIndex(index));

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        centerTitle: true,
        title: Obx(() {
          return Text(
              HomeController.appTitle.elementAt(controller.selectedIndex.value),
              style: appTitle);
        }),
        flexibleSpace: const TopBar(),
      ),
      body: Obx(() =>
          HomeController.widgetOptions.elementAt(
              controller.selectedIndex.value)),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          elevation: 10,
          items: [
            BottomNavigationBarItem(icon: Icon(
                controller.selectedIndex.value != 0 ? IconlyLight.home : IconlyBold
                    .home), label: ""),
            BottomNavigationBarItem(icon: Icon(
                controller.selectedIndex.value != 1 ? IconlyLight.chart : IconlyBold
                    .chart), label: ""),
            BottomNavigationBarItem(icon: Icon(controller.selectedIndex.value != 2
                ? IconlyLight.notification
                : IconlyBold.notification), label: ""),
            BottomNavigationBarItem(icon: Icon(
                controller.selectedIndex.value != 3 ? IconlyLight.profile : IconlyBold
                    .profile), label: ""),
          ],
          currentIndex: controller.selectedIndex.value,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            controller.selectedIndex.value = index;
            // scrindex != null
            //     ? Get.offAll(HomeScreen(), arguments: index)
            //     : scrindex;
            // Get.off(HomeController.widgetOptions[index]);
            controller.update();
            // print("scrindex $scrindex");
            // print("selected index: ${controller.selectedIndex}");
          },
        );
      }),
    );
  }
}
