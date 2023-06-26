import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/check_schedule/check_schedule_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CheckScheduleScreen extends StatefulWidget {
  const CheckScheduleScreen({Key? key}) : super(key: key);

  @override
  State<CheckScheduleScreen> createState() => _CheckScheduleScreenState();
}

class _CheckScheduleScreenState extends State<CheckScheduleScreen> with TickerProviderStateMixin {
  late TabController tabController;
  final _tabs = CheckScheduleController().daysInMonth(DateTime(DateTime.now().month));

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: _tabs, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckScheduleController>(
        init: CheckScheduleController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                "Airliness",
                style: appTitle,
              ),
              centerTitle: true,
              leading: CustomBackButton(
                onPressed: () => Get.off(AirlinessScreen(), arguments: {
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
              margin: const EdgeInsets.all(7),
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
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(
                        ImageConstant.airplane,
                        height: 25,
                      ),
                    ),
                    Text("Airliness Schedule", style: appTitle),
                    const SizedBox(height: 14),
                    Container(
                      alignment: Alignment.center,
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RotatedBox(
                            quarterTurns: 1,
                            child: SvgPicture.asset(
                              ImageConstant.airplane,
                              height: 25,
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 4,
                            child: Text(
                              controller.departureCity ?? "",
                              style: listTitleTextStyle.copyWith(color: whiteColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Icon(IconlyLight.arrow_right, color: whiteColor),
                          SizedBox(
                            width: Get.width / 4,
                            child: Text(
                              controller.arrivalCity ?? "",
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
                    SizedBox(
                      height: Get.height,
                      child: TabBarView(
                        controller: tabController,
                        children: controller.listOfDates
                            .map((e) => SingleChildScrollView(
                                  child: Column(
                                    children: controller.vendorList
                                        .map(
                                          (e) => Card(
                                            elevation: 4,
                                            child: Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                    "assets/img/citilink.png",
                                                    width: 50,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [Text("6.00"), Text("CGK"), Text("QG828")],
                                                  ),
                                                  Column(
                                                    children: const [
                                                      Icon(
                                                        Icons.arrow_forward,
                                                        size: 19,
                                                      ),
                                                      Text("3h 0m"),
                                                      Text("Economy")
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: const [Text("9.00"), Text("SUB"), Text("")],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Text("899.000", style: listTitleTextStyle),
                                                      GestureDetector(
                                                        onTap: () => controller.selectAirlines(e.id.toString()),
                                                        child: Container(
                                                          padding: EdgeInsets.all(8),
                                                          margin: EdgeInsets.only(top: 5),
                                                          decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(5)),
                                                          child: Text(
                                                            "Select",
                                                            style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                                                          ),
                                                        ),
                                                      )
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ),
                                ))
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
