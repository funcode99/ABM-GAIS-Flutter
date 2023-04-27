import 'package:datepicker_dropdown/datepicker_dropdown.dart';
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
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                  HomeController.appTitle.elementAt(controller.selectedIndex),
                  style: appTitle),
              flexibleSpace: TopBar(),
            ),
            body: controller.selectedIndex != 0
                ? HomeController.widgetOptions
                    .elementAt(controller.selectedIndex)
                : SingleChildScrollView(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Text(
                            "Dashboard",
                            style: appTitle.copyWith(
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 250,
                              height: 60,
                              child: DropdownDatePicker(
                                showDay: false,
                              ),
                            ),
                            CustomFilledButton(
                              color: redColor,
                              title: "Reset",
                              width: 100,
                              height: 57,
                              icon: Icons.restart_alt,
                            )
                          ],
                        ),
                        Text("My Trip Status", style: listTitleTextStyle),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            height: 100,
                            child: Row(
                              children: [
                                Card(
                                  elevation: 5,
                                  color: successColor,
                                  child: Container(
                                    width: Get.width / 3,
                                    height: 70,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(IconlyBold.tick_square,
                                            size: 30, color: whiteColor),
                                        Text("Approved\n10",
                                            style:
                                                listTitleTextStyle.copyWith(
                                                    fontFamily: 'Poppins',
                                                    color: whiteColor))
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  color: warningColor,
                                  child: Container(
                                    width: Get.width / 3,
                                    height: 70,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(IconlyBold.time_circle,
                                            size: 30),
                                        Text("Waiting\n5",
                                            style:
                                                listTitleTextStyle.copyWith(
                                                    fontFamily: 'Poppins'))
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  color: errorColor,
                                  child: Container(
                                    width: Get.width / 3,
                                    height: 70,
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(IconlyBold.close_square,
                                            size: 30, color: whiteColor),
                                        Text("Rejected\n3",
                                            style:
                                                listTitleTextStyle.copyWith(
                                                    fontFamily: 'Poppins',
                                                    color: whiteColor))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("TRIP PURPOSE",
                                    style: listTitleTextStyle.copyWith(
                                        fontSize: 18)),
                                SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  isTransposed: true,
                                  series: <
                                      CartesianSeries<TripPurposeModel,
                                          String>>[
                                    BarSeries<TripPurposeModel, String>(
                                      dataSource: controller.tpData,
                                      xValueMapper:
                                          (TripPurposeModel tp, _) =>
                                              tp.requestTrip,
                                      yValueMapper:
                                          (TripPurposeModel tp, _) => tp.trip,
                                      pointColorMapper:
                                          (TripPurposeModel tp, _) =>
                                              tp.color,
                                      dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                          useSeriesColor: true,
                                          color: whiteColor,
                                          textStyle: TextStyle(fontSize: 10),
                                          showZeroValue: true,
                                          labelAlignment:
                                              ChartDataLabelAlignment.top),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("MEETING ROOM USED",
                                    style: listTitleTextStyle.copyWith(
                                        fontSize: 18)),
                                SfCartesianChart(
                                  primaryXAxis: CategoryAxis(),
                                  series: <
                                      CartesianSeries<MeetRoomUsedModel,
                                          String>>[
                                    BarSeries<MeetRoomUsedModel, String>(
                                      dataSource: controller.mrData,
                                      xValueMapper:
                                          (MeetRoomUsedModel tp, _) =>
                                              tp.room,
                                      yValueMapper:
                                          (MeetRoomUsedModel tp, _) =>
                                              tp.used,
                                      pointColorMapper:
                                          (MeetRoomUsedModel tp, _) =>
                                              tp.color,
                                      dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                          useSeriesColor: true,
                                          color: whiteColor,
                                          textStyle: TextStyle(fontSize: 10),
                                          showZeroValue: true,
                                          labelAlignment:
                                              ChartDataLabelAlignment.top),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("TOTAL OFFICE SUPPLIES OUT",
                                    style: listTitleTextStyle.copyWith(
                                        fontSize: 18)),
                                SfCircularChart(
                                  legend: Legend(isVisible: true),
                                  series: <
                                      CircularSeries<SuppliesOutModel,
                                          String>>[
                                    PieSeries<SuppliesOutModel, String>(
                                      dataSource: controller.soData,
                                      radius: '100%',
                                      xValueMapper:
                                          (SuppliesOutModel tp, _) =>
                                              tp.supply,
                                      yValueMapper:
                                          (SuppliesOutModel tp, _) => tp.out,
                                      pointColorMapper:
                                          (SuppliesOutModel tp, _) =>
                                              tp.color,
                                      strokeColor: blackColor,
                                      strokeWidth: 2,
                                      dataLabelSettings: DataLabelSettings(
                                          isVisible: true,
                                          useSeriesColor: true,
                                          color: whiteColor,
                                          textStyle: TextStyle(fontSize: 10),
                                          showZeroValue: true,
                                          labelAlignment:
                                              ChartDataLabelAlignment.top),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 10,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(controller.selectedIndex != 0
                        ? IconlyLight.home
                        : IconlyBold.home),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(controller.selectedIndex != 1
                        ? IconlyLight.category
                        : IconlyBold.category),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(controller.selectedIndex != 2
                        ? IconlyLight.notification
                        : IconlyBold.notification),
                    label: ""),
                BottomNavigationBarItem(
                    icon: Icon(controller.selectedIndex != 3
                        ? IconlyLight.profile
                        : IconlyBold.profile),
                    label: ""),
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
