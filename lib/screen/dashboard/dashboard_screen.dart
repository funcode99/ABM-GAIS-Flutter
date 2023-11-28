import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/dashboard/dashboard_item_model.dart';
import 'package:gais/data/model/meeting_room_used.dart';
import 'package:gais/data/model/supplies_out_model.dart';
import 'package:gais/data/model/trip_purpose_model.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/dashboard/dashboard_controller.dart';
import 'package:gais/screen/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController controller = Get.put(DashboardController());

    return Container(
      margin: const EdgeInsets.only(top: 8, left: 6, right: 6),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(8)),
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Obx(() {
                  return Container(
                    // width: 200,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: greyColor)),
                    child: DropdownButton(
                      hint: const Text("Month"),
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      borderRadius: BorderRadius.circular(8),
                      items: controller.listMonths.map((item) {
                        return DropdownMenuItem<String>(
                          value: item["id"].toString(),
                          child: Text(
                            item["value"].toString(),
                            style: const TextStyle(fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        );
                      }).toList(),
                      value: controller.selectedMonth.value.toString(),
                      onChanged: (value) {
                        controller.selectedMonth.value = value!;
                        controller.getData();
                      },
                    ),
                  );
                }),
                Obx(() {
                  return Container(
                    // width: 200,
                    height: 40,
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: greyColor)),
                    child: DropdownButton(
                      hint: const Text("Year"),
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      borderRadius: BorderRadius.circular(8),
                      items: controller.listyears.map((item) {
                        return DropdownMenuItem<String>(
                          value: item.toString(),
                          child: Text(
                            item.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        );
                      }).toList(),
                      value: controller.selectedYear.value.toString(),
                      onChanged: (value) {
                        controller.selectedYear.value = value!;
                        controller.getData();
                      },
                    ),
                  );
                }),
                CustomFilledButton(
                  color: redColor,
                  title: "Reset",
                  width: Get.width >= 1201 ? 100 : 70,
                  icon: Icons.restart_alt,
                  onPressed: () {
                    controller.resetFilter();
                  },
                )
              ],
            ),
            Obx((){
              if(controller.showError.value){
                return const DataEmpty();
              }
              return const SizedBox()
;            }),
            Obx(() {
              if (controller.dashboardData.value.statusTrip == null) {
                return const SizedBox();
              }
              return Text("My Trip Status", style: listTitleTextStyle);
            }),
            Obx(() {
              if (controller.dashboardData.value.statusTrip == null) {
                return const SizedBox();
              }

              if (controller.dashboardData.value.statusTrip!.isEmpty) {
                return const SizedBox();
              }

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 100,
                  child: Row(
                    children: [
                      ...controller.dashboardData.value.statusTrip!.mapIndexed(
                              (index, e) =>
                              Card(
                                elevation: 5,
                                color: controller.tripColors.elementAt(index),
                                child: Container(
                                  height: 70,
                                  width: 130,
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceBetween,
                                    children: [
                                      Icon(IconlyBold.tick_square, size: 30,
                                          color: e.status?.toLowerCase() ==
                                              "waiting"
                                              ? blackColor
                                              : whiteColor),
                                      Text(
                                        "${e.status?.capitalizeFirst}\n${e.total
                                            ?.toInt()}",
                                        style: listSubTitleTextStyle.copyWith(
                                            fontFamily: 'Poppins',
                                            color: e.status?.toLowerCase() ==
                                                "waiting"
                                                ? blackColor
                                                : whiteColor,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                ),
                              )
                      ).toList(),
                    ],
                  ),
                ),
              );
            }),
            Obx(() {
              if (controller.dashboardData.value.tripPurpose == null) {
                return const SizedBox();
              }

              if (controller.dashboardData.value.tripPurpose!.isEmpty) {
                return const SizedBox();
              }
              return Card(
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
                          style: listTitleTextStyle.copyWith(fontSize: 18)),
                      Obx(() {
                        return SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          isTransposed: true,
                          series: <CartesianSeries<DashboardItemModel, String>>[
                            BarSeries<DashboardItemModel, String>(
                              dataSource: controller.dashboardData.value
                                  .tripPurpose!,
                              xValueMapper: (DashboardItemModel tp,
                                  int index) =>
                              tp.type
                                  ?.replaceAll("_", "\n")
                                  .capitalizeFirst,
                              yValueMapper: (DashboardItemModel tp,
                                  int index) => tp.total,
                              pointColorMapper: (DashboardItemModel tp,
                                  int index) =>
                                  controller.listColors.elementAt(
                                      index % controller.listColors.length),
                              dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  useSeriesColor: true,
                                  color: whiteColor,
                                  textStyle: TextStyle(fontSize: 10),
                                  showZeroValue: true,
                                  labelAlignment: ChartDataLabelAlignment.top),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
            Obx(() {
              if (controller.dashboardData.value.bookMeetingUsed ==
                  null) {
                return const SizedBox();
              }

              if (controller.dashboardData.value.bookMeetingUsed!
                  .isEmpty) {
                return const SizedBox();
              }

              return Card(
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
                          style: listTitleTextStyle.copyWith(fontSize: 18)),
                      Obx(() {
                        return SingleChildScrollView(
                          child: SfCartesianChart(
                            primaryXAxis: CategoryAxis(
                            ),
                            series: <
                                CartesianSeries<DashboardItemModel, String>>[
                              BarSeries<DashboardItemModel, String>(
                                dataSource: controller.dashboardData.value
                                    .bookMeetingUsed!,
                                xValueMapper: (DashboardItemModel tp,
                                    int index) =>
                                    tp.roomName?.replaceAll("-", "\n"),
                                yValueMapper: (DashboardItemModel tp,
                                    int index) => tp.total,
                                pointColorMapper: (DashboardItemModel tp,
                                    int index) =>
                                    controller.listColors.elementAt(
                                        index % controller.listColors.length),
                                dataLabelSettings: const DataLabelSettings(
                                    overflowMode: OverflowMode.shift,
                                    isVisible: true,
                                    useSeriesColor: true,
                                    color: whiteColor,
                                    textStyle: TextStyle(fontSize: 10),
                                    showZeroValue: true,
                                    labelAlignment: ChartDataLabelAlignment
                                        .top),
                              ),
                            ],
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
            Obx(() {
              if (controller.dashboardData.value.atkRequest == null) {
                return const SizedBox();
              }

              if (controller.dashboardData.value.atkRequest!
                  .isEmpty) {
                return const SizedBox();
              }

              return Card(
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
                          style: listTitleTextStyle.copyWith(fontSize: 18)),
                      Obx(() {
                        return SfCircularChart(
                          legend: Legend(isVisible: true),
                          series: <CircularSeries<DashboardItemModel, String>>[
                            PieSeries<DashboardItemModel, String>(
                              dataSource: controller.dashboardData.value
                                  .atkRequest!,
                              radius: '100%',
                              xValueMapper: (DashboardItemModel tp, _) =>
                              tp.itemName,
                              yValueMapper: (DashboardItemModel tp, _) =>
                                  tp.total?.toInt(),
                              pointColorMapper: (DashboardItemModel tp,
                                  int index) =>
                                  controller.listColors.elementAt(
                                      index % controller.listColors.length),
                              strokeColor: blackColor,
                              strokeWidth: 2,
                              dataLabelSettings: const DataLabelSettings(
                                  isVisible: true,
                                  useSeriesColor: true,
                                  color: whiteColor,
                                  textStyle: TextStyle(fontSize: 10),
                                  showZeroValue: true,
                                  labelAlignment: ChartDataLabelAlignment.top),
                            ),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }

}