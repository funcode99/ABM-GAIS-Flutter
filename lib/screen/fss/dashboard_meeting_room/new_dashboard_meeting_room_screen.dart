import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/add/add_booking_meeting_room_screen.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_screen.dart';
import 'package:gais/screen/fss/dashboard_meeting_room/new_dashboard_meeting_room_controller.dart';
import 'package:gais/screen/fss/dashboard_meeting_room/new_dashboard_meeting_room_controller.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:time_planner/time_planner.dart';
import 'package:url_launcher/url_launcher.dart';

class NewDashboardMeetingRoomScreen extends StatelessWidget {
  const NewDashboardMeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewDashboardMeetingRoomController>(
        init: NewDashboardMeetingRoomController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Meeting Room\nDashboard", style: appTitle,
                  textAlign: TextAlign.center),
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
                          controller.listOfDates(DateTime(controller
                              .selectedYear, controller.selectedMonth!,
                              controller.selectedDate!));
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
                          controller.listOfDates(DateTime(controller
                              .selectedYear, controller.selectedMonth!,
                              controller.selectedDate!));
                          controller.update();
                        },
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.listOfDates(
                                  controller.currentDate!.subtract(
                                      const Duration(days: 7)));
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(color: infoColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(
                                  Icons.keyboard_arrow_left, color: whiteColor),
                            ),
                          ),
                          Row(
                            children: controller.listDates
                                .map((e) =>
                                GestureDetector(
                                  onTap: () {
                                    controller.selectedDate = e.date!.toInt();
                                    controller.getHeader();
                                    controller.update();
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: e.date ==
                                                controller.selectedDate
                                                ? infoColor
                                                : baseColor,
                                            borderRadius: BorderRadius.circular(
                                                5)),
                                        child: Text(
                                          " ${e.day} ",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: e.date ==
                                              controller.selectedDate
                                              ? whiteColor
                                              : blackColor),
                                        ),
                                      ),
                                      Container(
                                          padding: const EdgeInsets.all(6),
                                          margin: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: e.date ==
                                                  controller.selectedDate
                                                  ? infoColor
                                                  : baseColor,
                                              borderRadius: BorderRadius
                                                  .circular(50)),
                                          child: Text(
                                            " ${e.date} ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(color: e.date ==
                                                controller.selectedDate
                                                ? whiteColor
                                                : blackColor),
                                          )),
                                    ],
                                  ),
                                ))
                                .toList(),
                          ),
                          GestureDetector(
                            onTap: () {
                              controller.listOfDates(
                                  controller.currentDate!.add(
                                      const Duration(days: 7)));
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(color: infoColor,
                                  borderRadius: BorderRadius.circular(50)),
                              child: const Icon(Icons.keyboard_arrow_right,
                                  color: whiteColor),
                            ),
                          ),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: baseColor, borderRadius: BorderRadius
                                .circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            width: Get.width / 3.5,
                            child: DropdownButton(
                              hint: Text(
                                controller.loadCompany
                                    ? "Loading..."
                                    : "Company",
                                style: listTitleTextStyle,
                              ),
                              underline: const SizedBox(),
                              isExpanded: true,
                              value: controller.selectedCompany != null
                                  ? controller.selectedCompany.toString()
                                  : null,
                              icon: const Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              menuMaxHeight: 500,
                              style: listSubTitleTextStyle.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  color: blackColor),
                              items: controller.listCompany
                                  .map((e) =>
                                  DropdownMenuItem(
                                    value: e.id.toString(),
                                    child: Text(
                                      e.companyName.toString(),
                                    ),
                                  ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedCompany = value?.toInt();
                                controller.listOfSite(value!);
                                controller.update();
                              },
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: baseColor, borderRadius: BorderRadius
                                .circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            width: Get.width / 5,
                            child: DropdownButton(
                              hint: Text(
                                controller.loadSite ? "Loading..." : "Site",
                                style: listTitleTextStyle,
                              ),
                              underline: const SizedBox(),
                              isExpanded: true,
                              style: listSubTitleTextStyle.copyWith(
                                  overflow: TextOverflow.ellipsis,
                                  color: blackColor),
                              value: controller.selectedSite != null
                                  ? controller.selectedSite.toString()
                                  : null,
                              icon: const Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              items: controller.listSite
                                  .map((e) =>
                                  DropdownMenuItem(
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
                            decoration: BoxDecoration(
                                color: baseColor, borderRadius: BorderRadius
                                .circular(14)),
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
                            decoration: BoxDecoration(
                                color: baseColor, borderRadius: BorderRadius
                                .circular(14)),
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
                Expanded(
                    child: controller.getListRoom().isEmpty ? const DataEmpty() :
                    Container(
                      color: Colors.white,
                      child: TimePlanner(
                        startHour: 7,
                        endHour: 17,
                        use24HourFormat: true,
                        setTimeOnAxis: false,
                        style: TimePlannerStyle(
                          cellHeight: 120,
                          cellWidth: 200,
                          showScrollBar: true,
                          interstitialEvenColor: Colors.grey[50],
                          interstitialOddColor: Colors.grey[200],
                        ),
                        headers: controller.getListRoom().mapIndexed((index, element) => TimePlannerTitle(
                          title: element,
                        )).toList(),
                        tasks: controller.getListBooking().map((element) => TimePlannerTask(
                          // background color for task
                          color: controller.getColor(element.codeStatusDoc),
                          // day: Index of header, hour: Task will be begin at this hour
                          // minutes: Task will be begin at this minutes
                          dateTime: TimePlannerDateTime(day: element.position!, hour: element.hour!, minutes: element.minute!),
                          leftSpace: (200 * element.position!.toDouble()),
                          // Minutes duration of task
                          minutesDuration: element.durationInMinute!,
                          // Days duration of task (use for multi days task)
                          daysDuration: 1,
                          onTap: () {
                            Get.to(()=> const DetailBookingMeetingRoomScreen(), arguments: {
                              "item": element
                            })?.then((value) => controller.getHeader());
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${element.startTime?.toDateFormat(targetFormat:"HH:mm", originFormat: "HH:mm:ss")} - ${element.endTime?.toDateFormat(targetFormat:"HH:mm", originFormat: "HH:mm:ss")}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(color: blackColor, fontSize: 12, overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "${element.title}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(color: blackColor, fontSize: 12, overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "${element.employeeName}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(color: blackColor, fontSize: 12, overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ),
                                if(element.isOnlineMeeting)
                                  if(element.link != null)
                                    if(element.link!.isNotEmpty)
                                      OutlinedButton(
                                        onPressed: () async{
                                          if (!await launchUrl(Uri.parse(element.link.toString()))) {
                                            throw Exception(
                                                'Could not launch ${element.link.toString()}');
                                          }
                                        },
                                        style: OutlinedButton.styleFrom(
                                          minimumSize: const Size(75, 30),

                                        ),
                                        child: Text("Join".tr),
                                      ),
                              ],
                            ),
                          ),
                        )).toList(),
                      ),
                    )
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: successColor,
              onPressed: () => Get.to(()=>const AddBookingMeetingRoomScreen())?.then((value) => controller.getHeader()),
              child: const Icon(Icons.add_rounded, size: 45),
            ),
          );
        });
  }
}