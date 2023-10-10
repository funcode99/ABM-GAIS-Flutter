import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/train/schedule/train_schedule_controller.dart';
import 'package:gais/screen/tms/request_trip/add/train/train_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class TrainScheduleScreen extends StatefulWidget {
  const TrainScheduleScreen({super.key});

  @override
  State<TrainScheduleScreen> createState() => _TrainScheduleScreenState();
}

class _TrainScheduleScreenState extends State<TrainScheduleScreen> with TickerProviderStateMixin {
  late TabController tabController;
  final _tabs = TrainScheduleController().daysInMonth(DateTime(DateTime.now().month));

  @override
  void initState() {
    tabController = TabController(length: _tabs, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TrainScheduleController>(
        init: TrainScheduleController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              title: Text(
                "Train",
                style: appTitle,
              ),
              centerTitle: true,
              leading: CustomBackButton(
                onPressed: () => Get.off(const TrainScreen(), arguments: {
                  'purposeID': controller.purposeID,
                  'codeDocument': controller.codeDocument,
                  'formEdit': controller.formEdit,
                }),
              ),
              flexibleSpace: const TopBar(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.train_rounded, color: whiteColor),
                    ),
                    Text("Train Schedule", style: appTitle),
                    const SizedBox(height: 14),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.train, color: whiteColor),
                          SizedBox(
                            width: Get.width / 4,
                            child: Text(
                              "${controller.originModel?.cityName} (${controller.originModel?.stationCode})",
                              style: listTitleTextStyle.copyWith(color: whiteColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Icon(IconlyLight.arrow_right, color: whiteColor),
                          SizedBox(
                            width: Get.width / 4,
                            child: Text(
                              "${controller.destinationModel?.cityName} (${controller.destinationModel?.stationCode})",
                              style: listTitleTextStyle.copyWith(color: whiteColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    ButtonsTabBar(
                      controller: tabController,
                      radius: 12,
                      contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                      borderWidth: 1,
                      borderColor: Colors.transparent,
                      decoration: const BoxDecoration(
                        color: lightGreyColor,
                      ),
                      unselectedLabelStyle: const TextStyle(color: Colors.black),
                      labelStyle: const TextStyle(color: Colors.white),
                      height: 56,
                      unselectedBackgroundColor: whiteColor,
                      tabs: controller.listOfDates
                          .map(
                            (e) => Tab(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  e,
                                  style: listSubTitleTextStyle.copyWith(color: blackColor),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    controller.isLoading
                        ? Container(margin: EdgeInsets.only(top: Get.height / 5), child: CircularProgressIndicator.adaptive())
                        : Container(
                            padding: const EdgeInsets.only(bottom: 300),
                            height: Get.height,
                            child: TabBarView(
                              controller: tabController,
                              children: controller.schedules
                                  .mapIndexed(
                                    (i, schedule) => controller.schedules[i].isEmpty
                                        ? DataEmpty()
                                        : SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                Column(
                                                    children: controller.schedules[i]
                                                        .map((trains) => Column(
                                                              children: trains.segments!
                                                                  .map(
                                                                    (segments) => GestureDetector(
                                                                      onTap: () => controller.selectTrain(),
                                                                      child: Card(
                                                                        elevation: 3,
                                                                        child: Padding(
                                                                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                                                                          child: Column(
                                                                            children: [
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(trains.trainName.toString(),
                                                                                      style: listTitleTextStyle.copyWith(color: infoColor)),
                                                                                  Text("Rp. ${segments.fare!.toInt().toCurrency()}",
                                                                                      style: listTitleTextStyle.copyWith(color: infoColor)),
                                                                                ],
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(segments.className ?? '',
                                                                                          style: TextStyle(
                                                                                              color: lightGreyColor, fontSize: 12, fontWeight: bold)),
                                                                                      Text(trains.departureTime.toString(),
                                                                                          style: TextStyle(fontWeight: bold)),
                                                                                      Text(
                                                                                        '${controller.originModel?.cityName.toString()} (${trains.origin})',
                                                                                        style: TextStyle(color: Colors.grey, fontWeight: bold),
                                                                                      ),
                                                                                      Text(
                                                                                        controller.dateFormat
                                                                                            .format(DateTime.parse(trains.departureDate.toString())),
                                                                                        style: TextStyle(fontWeight: extraBold),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    children: [
                                                                                      Icon(Icons.arrow_forward_rounded, color: greyColor, size: 30),
                                                                                      Text(
                                                                                        trains.duration.toString(),
                                                                                        style: TextStyle(color: greyColor),
                                                                                      )
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.end,
                                                                                    children: [
                                                                                      Text("Available",
                                                                                          style: TextStyle(
                                                                                              color: greenColor, fontSize: 12, fontWeight: bold)),
                                                                                      Text(trains.arrivalTime.toString(),
                                                                                          style: TextStyle(fontWeight: bold)),
                                                                                      Text(
                                                                                        '${controller.destinationModel?.cityName} (${trains.destination})',
                                                                                        style: TextStyle(color: Colors.grey, fontWeight: bold),
                                                                                      ),
                                                                                      Text(
                                                                                        controller.dateFormat
                                                                                            .format(DateTime.parse(trains.arrivalDate.toString())),
                                                                                        style: TextStyle(fontWeight: extraBold),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  )
                                                                  .toList(),
                                                            ))
                                                        .toList()),
                                                SizedBox(height: 100)
                                              ],
                                            ),
                                          ),
                                  )
                                  .toList(),
                            ),
                          ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
