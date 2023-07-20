import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/dashboard_meeting_room/dashboard_meeting_room_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class DashboardMeetingRoomScreen extends StatelessWidget {
  const DashboardMeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardMeetingRoomController>(
        init: DashboardMeetingRoomController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Meeting Room\nDashboard", style: appTitle, textAlign: TextAlign.center),
              leading: CustomBackButton(),
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
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: greyColor)),
                      child: DropdownButton(
                        hint: Text(
                          "Month",
                          style: appTitle,
                        ),
                        underline: SizedBox(),
                        icon: Icon(Icons.keyboard_arrow_down),
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
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: greyColor)),
                      child: DropdownButton(
                        hint: Text(
                          "Year",
                          style: appTitle,
                        ),
                        underline: SizedBox(),
                        icon: Icon(Icons.keyboard_arrow_down),
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
                  padding: EdgeInsets.all(10),
                  decoration:
                      BoxDecoration(color: whiteColor, borderRadius: BorderRadius.only(topLeft: Radius.circular(14), topRight: Radius.circular(14))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller.listOfDates(controller.currenDate!.subtract(Duration(days: 7)));
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                              child: Icon(Icons.keyboard_arrow_left, color: whiteColor),
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
                                            padding: EdgeInsets.all(6),
                                            margin: EdgeInsets.symmetric(horizontal: 5),
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
                                              padding: EdgeInsets.all(6),
                                              margin: EdgeInsets.all(5),
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
                              controller.listOfDates(controller.currenDate!.add(Duration(days: 7)));
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                              child: Icon(Icons.keyboard_arrow_right, color: whiteColor),
                            ),
                          ),
                        ],
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(14)),
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            width: Get.width / 3.5,
                            child: DropdownButton(
                              hint: Text(
                                controller.loadCompany ? "Loading..." : "Company",
                                style: listTitleTextStyle,
                              ),
                              underline: SizedBox(),
                              isExpanded: true,
                              value: controller.selectedCompany != null ? controller.selectedCompany.toString() : null,
                              icon: Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              menuMaxHeight: 500,
                              style: listSubTitleTextStyle.copyWith(overflow: TextOverflow.ellipsis, color: blackColor),
                              items: controller.listCompany
                                  .map((e) => DropdownMenuItem(
                                        child: Text(
                                          e.companyName.toString(),
                                        ),
                                        value: e.id.toString(),
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
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            width: Get.width/5,
                            child: DropdownButton(
                              hint: Text(
                                controller.loadSite ? "Loading..." : "Site",
                                style: listTitleTextStyle,
                              ),
                              underline: SizedBox(),
                              isExpanded: true,
                              style: listSubTitleTextStyle.copyWith(overflow: TextOverflow.ellipsis, color: blackColor),
                              value: controller.selectedSite != null ? controller.selectedSite.toString() : null,
                              icon: Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              items: controller.listSite
                                  .map((e) => DropdownMenuItem(
                                        child: Text(e.siteName.toString()),
                                        value: e.id.toString(),
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
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            child: DropdownButton(
                              hint: Text(
                                "Floor",
                                style: listTitleTextStyle,
                              ),
                              underline: SizedBox(),
                              icon: Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              items: [],
                              onChanged: (value) {},
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(color: baseColor, borderRadius: BorderRadius.circular(14)),
                            padding: EdgeInsets.symmetric(horizontal: 9),
                            child: DropdownButton(
                              hint: Text(
                                "Room",
                                style: listTitleTextStyle,
                              ),
                              underline: SizedBox(),
                              icon: Icon(Icons.arrow_drop_down),
                              borderRadius: BorderRadius.circular(8),
                              items: [],
                              onChanged: (value) {},
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: infoColor,
                    borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text('Synergy 1', style: TextStyle(color: whiteColor)),
                      Text('Synergy 2', style: TextStyle(color: whiteColor)),
                      Text('Synergy 3', style: TextStyle(color: whiteColor)),
                    ],
                  ),
                ),
                Expanded(child: ListView())
              ],
            ),
          );
        });
  }
}
