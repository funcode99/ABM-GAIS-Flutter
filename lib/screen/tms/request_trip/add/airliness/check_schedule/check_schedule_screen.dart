import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:collection/collection.dart';
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
import 'package:gais/util/ext/int_ext.dart';
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
                onPressed: () => Get.off(const AirlinessScreen(), arguments: {
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
                              "${controller.departureModel.cityName} (${controller.departureModel.code})",
                              style: listTitleTextStyle.copyWith(color: whiteColor),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const Icon(IconlyLight.arrow_right, color: whiteColor),
                          SizedBox(
                            width: Get.width / 4,
                            child: Text(
                              "${controller.arrivalModel.cityName} (${controller.arrivalModel.code})",
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
                              children: controller.listOfDates
                                  .mapIndexed(
                                    (i, e) => Expanded(
                                      child: ListView(
                                        children: [
                                          Column(
                                            children: controller.scheduleList1
                                                .map<Widget>(
                                                  (flight) => flight.classObjects!.isNotEmpty
                                                      ? Column(
                                                          children: flight.classObjects!
                                                              .map((classObject) => Card(
                                                                    elevation: 4,
                                                                    child: Padding(
                                                                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                                                      child: Column(
                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            flight.airlineName.toString(),
                                                                            style: listTitleTextStyle,
                                                                          ),
                                                                          Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                            children: [
                                                                              flight.airlineImageUrl != null
                                                                                  ? Image.network(
                                                                                      flight.airlineImageUrl.toString(),
                                                                                      height: 40,
                                                                                      width: 40,
                                                                                    )
                                                                                  : SvgPicture.asset(
                                                                                      ImageConstant.airplane,
                                                                                      height: 40,
                                                                                      color: blueColor,
                                                                                    ),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(flight.departTime.toString()),
                                                                                  Text(flight.origin.toString()),
                                                                                  Text(
                                                                                    flight.number.toString(),
                                                                                    style: listTitleTextStyle,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  const Icon(
                                                                                    Icons.arrow_forward,
                                                                                    size: 19,
                                                                                  ),
                                                                                  Text(flight.arriveTime.toString()),
                                                                                  Text(classObject.category.toString()),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(flight.arriveTime.toString()),
                                                                                  Text(flight.destination.toString()),
                                                                                  const Text("")
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                children: [
                                                                                  Text(flight.fare!.toInt().toCurrency().toString(),
                                                                                      style: listTitleTextStyle),
                                                                                  GestureDetector(
                                                                                    onTap: () => controller.selectAirlines(
                                                                                      flight.id.toString(),
                                                                                      flight.number!.substring(0, 2).toString(),
                                                                                      flight.number.toString(),
                                                                                      flight.fare.toString(),
                                                                                    ),
                                                                                    child: Container(
                                                                                      padding: const EdgeInsets.all(8),
                                                                                      margin: const EdgeInsets.only(top: 5),
                                                                                      decoration: BoxDecoration(
                                                                                          color: infoColor, borderRadius: BorderRadius.circular(5)),
                                                                                      child: const Text(
                                                                                        "Select",
                                                                                        style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                                                                                      ),
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                              )
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ))
                                                              .toList(),
                                                        )
                                                      : flight.connectingFlights!.isNotEmpty
                                                          ? Column(
                                                              children: [
                                                                Card(
                                                                  elevation: 4,
                                                                  child: Padding(
                                                                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                                                                    child: Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text(
                                                                          flight.airlineName.toString(),
                                                                          style: listTitleTextStyle,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                                          children: [
                                                                            flight.airlineImageUrl != null
                                                                                ? Image.network(
                                                                                    flight.airlineImageUrl.toString(),
                                                                                    height: 40,
                                                                                    width: 40,
                                                                                  )
                                                                                : SvgPicture.asset(
                                                                                    ImageConstant.airplane,
                                                                                    height: 40,
                                                                                    color: blueColor,
                                                                                  ),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(flight.departTime.toString()),
                                                                                Text(flight.origin.toString()),
                                                                                Text(
                                                                                  flight.number.toString(),
                                                                                  style: listTitleTextStyle,
                                                                                )
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                const Icon(
                                                                                  Icons.arrow_forward,
                                                                                  size: 19,
                                                                                ),
                                                                                Text(flight.arriveTime.toString()),
                                                                                Text(flight.classObjects?.length.toString() ?? ""),
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Text(flight.arriveTime.toString()),
                                                                                Text(flight.destination.toString()),
                                                                                const Text("")
                                                                              ],
                                                                            ),
                                                                            Column(
                                                                              children: [
                                                                                Text(flight.fare!.toInt().toCurrency().toString(),
                                                                                    style: listTitleTextStyle),
                                                                                GestureDetector(
                                                                                  onTap: () => controller.selectAirlines(
                                                                                    flight.id.toString(),
                                                                                    flight.number!.substring(0, 2).toString(),
                                                                                    flight.number.toString(),
                                                                                    flight.fare.toString(),
                                                                                  ),
                                                                                  child: Container(
                                                                                    padding: const EdgeInsets.all(8),
                                                                                    margin: const EdgeInsets.only(top: 5),
                                                                                    decoration: BoxDecoration(
                                                                                        color: infoColor, borderRadius: BorderRadius.circular(5)),
                                                                                    child: const Text(
                                                                                      "Select",
                                                                                      style: TextStyle(color: whiteColor, fontWeight: FontWeight.bold),
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            )
                                                          : Container(),
                                                )
                                                .toList(),
                                          ),
                                          SizedBox(height: 50,)
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
