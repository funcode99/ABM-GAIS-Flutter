import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/dashboard_meeting_room/dashboard_meeting_room_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:calendar_view/calendar_view.dart';

class DashboardMeetingRoomScreen extends StatefulWidget {
  const DashboardMeetingRoomScreen({super.key});

  @override
  State<DashboardMeetingRoomScreen> createState() => _DashboardMeetingRoomScreenState();
}

class _DashboardMeetingRoomScreenState extends State<DashboardMeetingRoomScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardMeetingRoomController>(
        init: DashboardMeetingRoomController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Meeting Room\nDashboard", style: appTitle, textAlign: TextAlign.center),
              leading: const CustomBackButton(),
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      // width: 200,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: greyColor)),
                      child: DropdownButton(
                        hint: Text(
                          "Month",
                          style: appTitle,
                        ),
                        underline: const SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        borderRadius: BorderRadius.circular(8),
                        value: controller.selectedMonth.toString(),
                        items: controller.listMonths.map((item) {
                          return DropdownMenuItem<String>(
                            value: item["id"].toString(),
                            child: Text(
                              item["value"].toString(),
                              style: appTitle,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedMonth = value!.toInt();
                          controller.listOfDates(DateTime(controller.selectedYear, controller.selectedMonth!, controller.selectedDate!));
                          controller.update();
                        },
                      ),
                    ),
                    Container(
                      // width: 200,
                      height: 40,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: greyColor)),
                      child: DropdownButton(
                        hint: Text(
                          "Year",
                          style: appTitle,
                        ),
                        underline: const SizedBox(),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        borderRadius: BorderRadius.circular(8),
                        value: controller.selectedYear.toString(),
                        items: controller.listYears.map((item) {
                          return DropdownMenuItem<String>(
                            value: item.toString(),
                            child: Text(
                              item.toString(),
                              style: appTitle,
                            ),
                          );
                        }).toList(),
                        onChanged: (value) {
                          controller.selectedYear = value!.toInt();
                          controller.listOfDates(DateTime(controller.selectedYear, controller.selectedMonth!, controller.selectedDate!));
                          controller.update();
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.listOfDates(controller.currenDate!.subtract(const Duration(days: 7)));
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.keyboard_arrow_left, color: whiteColor),
                            ),
                          ),
                          Row(
                            children: controller.listDates
                                .map((e) => GestureDetector(
                                      onTap: () {
                                        controller.selectedDate = e.date!.toInt();
                                        controller.update();
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(6),
                                            margin: const EdgeInsets.symmetric(horizontal: 5),
                                            decoration: BoxDecoration(
                                                color: e.date == controller.selectedDate ? infoColor : baseColor,
                                                borderRadius: BorderRadius.circular(5)),
                                            child: Text(
                                              " ${e.day} ",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(color: e.date == controller.selectedDate ? whiteColor : blackColor),
                                            ),
                                          ),
                                          Container(
                                              padding: const EdgeInsets.all(6),
                                              margin: const EdgeInsets.all(5),
                                              decoration: BoxDecoration(
                                                  color: e.date == controller.selectedDate ? infoColor : baseColor,
                                                  borderRadius: BorderRadius.circular(50)),
                                              child: Text(
                                                " ${e.date} ",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: e.date == controller.selectedDate ? whiteColor : blackColor),
                                              )),
                                        ],
                                      ),
                                    ))
                                .toList(),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.listOfDates(controller.currenDate!.add(const Duration(days: 7)));
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.keyboard_arrow_right, color: whiteColor),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            width: Get.width / 3.5,
                            child: DropdownButton(
                              hint: Text(
                                controller.loadCompany ? "Loading..." : "Company",
                                style: listTitleTextStyle,
                              ),
                              underline: const SizedBox(),
                              isExpanded: true,
                              value: controller.selectedCompany != null ? controller.selectedCompany.toString() : null,
                              icon: const Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              menuMaxHeight: 500,
                              style: listSubTitleTextStyle.copyWith(overflow: TextOverflow.ellipsis, color: blackColor),
                              items: controller.listCompany
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(
                                          e.companyName.toString(),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedCompany = value?.toInt();
                                controller.listOfSite(value!.toInt());
                                controller.update();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            width: Get.width / 5,
                            child: DropdownButton(
                              hint: Text(
                                controller.loadSite ? "Loading..." : "Site",
                                style: listTitleTextStyle,
                              ),
                              underline: const SizedBox(),
                              isExpanded: true,
                              style: listSubTitleTextStyle.copyWith(overflow: TextOverflow.ellipsis, color: blackColor),
                              value: controller.selectedSite != null ? controller.selectedSite.toString() : null,
                              icon: const Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              items: controller.listSite
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.siteName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedSite = value?.toInt();
                                controller.listOfFLoor(value!.toInt());
                                controller.update();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: DropdownButton(
                              hint: Text(
                                "Floor",
                                style: listTitleTextStyle,
                              ),
                              underline: const SizedBox(),
                              icon: const Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              items: const [],
                              onChanged: (value) {},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: DropdownButton(
                              hint: Text(
                                "Room",
                                style: listTitleTextStyle,
                              ),
                              underline: const SizedBox(),
                              icon: const Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              items: const [],
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: infoColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Synergy 1', style: TextStyle(color: whiteColor)),
                      Text('Synergy 2', style: TextStyle(color: whiteColor)),
                      Text('Synergy 3', style: TextStyle(color: whiteColor)),
                    ],
                  ),
                ),
                Expanded(
                    child: SfCalendar(
                  view: CalendarView.timelineDay,
                  firstDayOfWeek: 1,
                  timeSlotViewSettings: const TimeSlotViewSettings(startHour: 9, endHour: 18),
                  dataSource: controller.events,
                  showCurrentTimeIndicator: false,
                  dragAndDropSettings: DragAndDropSettings(
                    allowScroll: false
                  ),
                  showWeekNumber: false,
                  resourceViewSettings: ResourceViewSettings(),
                  monthViewSettings: MonthViewSettings(navigationDirection: MonthNavigationDirection.horizontal),
                ))
              ],
            ),
          );
        });
  }
}
