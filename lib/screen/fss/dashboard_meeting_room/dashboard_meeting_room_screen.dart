import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/master/room/room_model.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/indicator/custom_indicator.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/add/add_booking_meeting_room_screen.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_screen.dart';
import 'package:gais/screen/fss/dashboard_meeting_room/dashboard_meeting_room_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:time_planner/time_planner.dart';
import 'package:url_launcher/url_launcher.dart';

class DashboardMeetingRoomScreen extends StatelessWidget {
  const DashboardMeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardMeetingRoomController controller =
    Get.put(DashboardMeetingRoomController());

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
                child: Obx(() {
                  return DropdownButton(
                    hint: Text(
                      "Month",
                      style: appTitle,
                    ),
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    borderRadius: BorderRadius.circular(8),
                    value: controller.selectedDate.value?.month.toString(),
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
                      controller.selectedMonth.value = value!.toInt();
                      controller.generateListOfDates(DateTime(controller.selectedYear.value, controller.selectedMonth.value, 1), firstDateSelected: true);
                    },
                  );
                }),
              ),
              Container(
                // width: 200,
                height: 40,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                // decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), border: Border.all(color: greyColor)),
                child: Obx(() {
                  return DropdownButton(
                    hint: Text(
                      "Year",
                      style: appTitle,
                    ),
                    underline: const SizedBox(),
                    icon: const Icon(Icons.keyboard_arrow_down),
                    borderRadius: BorderRadius.circular(8),
                    value: controller.selectedDate.value?.year.toString(),
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
                      controller.selectedYear.value = value!.toInt();
                      controller.generateListOfDates(DateTime(controller.selectedYear.value, controller.selectedMonth.value, 1), firstDateSelected: true);
                    },
                  );
                }),
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
                        controller.generatePrevWeek();
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
                    Expanded(
                      child: Center(
                        child: Obx(() {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: controller.listDate
                                  .map((e) =>
                                  GestureDetector(
                                    onTap: () {
                                      controller.selectedDate.value = e;
                                      controller.getHeader();
                                    },
                                    child: Column(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(6),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 5),
                                          decoration: BoxDecoration(
                                              color: e.isAtSameMomentAs(
                                                  controller.selectedDate
                                                      .value!)
                                                  ? infoColor
                                                  : baseColor,
                                              borderRadius: BorderRadius
                                                  .circular(
                                                  5)),
                                          child: Text(
                                            " ${controller.dayDateFormat.format(
                                                e)[0]} ",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: e.isAtSameMomentAs(
                                                    controller.selectedDate
                                                        .value!)
                                                    ? whiteColor
                                                    : blackColor),
                                          ),
                                        ),
                                        Container(
                                            padding: const EdgeInsets.all(6),
                                            margin: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                                color: e.isAtSameMomentAs(
                                                    controller.selectedDate
                                                        .value!)
                                                    ? infoColor
                                                    : baseColor,
                                                borderRadius: BorderRadius
                                                    .circular(50)),
                                            child: Text(
                                              " ${e.day} ",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: e.isAtSameMomentAs(
                                                      controller.selectedDate
                                                          .value!)
                                                      ? whiteColor
                                                      : blackColor),
                                            )),
                                      ],
                                    ),
                                  ))
                                  .toList(),
                            ),
                          );
                        }),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.generateNextWeek();
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
                Wrap(
                  runSpacing: 10,
                  spacing: 16,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: Get.width / 2.3
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: baseColor, borderRadius: BorderRadius
                                .circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: Obx(() {
                              if (!controller.enableSelectCompany.value) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15),
                                  child: Text(
                                    "${controller.companyName}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }
                              return DropdownButton(
                                isExpanded: true,
                                hint: Text(
                                  "Company",
                                  style: listTitleTextStyle,
                                ),
                                underline: const SizedBox(),
                                value: controller.selectedCompany.value != null
                                    ? controller.selectedCompany.value?.id
                                    .toString()
                                    : "",
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
                                      child: Text("${e.companyName}"),
                                    ))
                                    .toList(),
                                onChanged: (item) {
                                  controller.onChangeSelectedCompany(
                                      item.toString());
                                },
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: Get.width / 2.3
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: baseColor, borderRadius: BorderRadius
                                .circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: Obx(() {
                              if (!controller.enableSelectSite.value) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15),
                                  child: Text(
                                    "${controller.siteName}",
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              }
                              return DropdownButton(
                                isExpanded: true,
                                items: controller.listSite
                                    .map((e) =>
                                    DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text("${e.siteName}"),
                                    ))
                                    .toList(),
                                onChanged: (item) {
                                  controller.onChangeSelectedSite(
                                      item.toString());
                                },
                                value: controller.selectedSite.value != null
                                    ? controller.selectedSite.value?.id
                                    .toString()
                                    : "",
                                hint: Text(
                                  "Site",
                                  style: listTitleTextStyle,
                                ),
                                underline: const SizedBox(),
                                style: listSubTitleTextStyle.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                    color: blackColor),
                                icon: const Icon(Icons.arrow_drop_down),
                                borderRadius: BorderRadius.circular(8),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: Get.width / 2.3
                      ),
                      child: LayoutBuilder(
                        builder: (context, constraint) {
                          return Container(
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                                color: baseColor, borderRadius: BorderRadius
                                .circular(14)),
                            padding: const EdgeInsets.symmetric(horizontal: 9),
                            child: Obx(() {
                              return Container(
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 8),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Wrap(
                                  runSpacing: 8,
                                  runAlignment: WrapAlignment.center,
                                  children: [
                                    ...controller.listSelectedRoom
                                        .mapIndexed((index, item) => Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(4.0),
                                        ),
                                        color: Colors.white,
                                      ),
                                      margin: const EdgeInsets.only(
                                          right: 5.0, left: 5),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0, vertical: 4.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          InkWell(
                                            child: Text(
                                              item.nameMeetingRoom ?? "",
                                              style: listSubTitleTextStyle,
                                            ),
                                          ),
                                          const SizedBox(width: 4.0),
                                          InkWell(
                                            child: const Icon(
                                              Icons.cancel,
                                              size: 14.0,
                                              color: greyColor,
                                            ),
                                            onTap: () {
                                              controller.deleteMeetingRoom(item.id);
                                            },
                                          )
                                        ],
                                      ),
                                    ))
                                        .toList(),
                                    SizedBox(
                                      width: 150,
                                      child: TypeAheadFormField<RoomModel>(
                                        textFieldConfiguration: TextFieldConfiguration(
                                          controller: controller.autocompleteController,
                                          autofocus: false,
                                          style: Theme.of(context).textTheme.titleMedium,
                                          decoration: InputDecoration(
                                            fillColor: Colors.transparent,
                                              isDense: true,
                                              hintText: "Meeting Room".tr,
                                              hintStyle: const TextStyle(
                                                color: Colors.grey
                                              ),
                                              border: InputBorder.none,
                                              contentPadding: const EdgeInsets.symmetric(
                                                  horizontal: 4.0, vertical: 4.0),
                                              errorText: null,
                                              errorBorder: const OutlineInputBorder(
                                                borderSide: BorderSide.none,
                                                gapPadding: 0,
                                              ),
                                              errorStyle: const TextStyle(height: 0)),
                                        ),
                                        suggestionsCallback: (pattern) async {
                                          final list = await controller.getRoomByKeyword(pattern);
                                          return list;
                                        },
                                        itemBuilder: (context, suggestion) {
                                          return ListTile(
                                            title: Text("${suggestion.nameMeetingRoom}"),
                                          );
                                        },
                                        onSuggestionSelected: (suggestion) {
                                          controller.addMeetingRoom(suggestion);
                                          controller.autocompleteController.text = "";
                                        },
                                        debounceDuration:
                                        const Duration(milliseconds: 1500),
                                        hideOnLoading: true,
                                        hideSuggestionsOnKeyboardHide: true,
                                        keepSuggestionsOnLoading: false,
                                        minCharsForSuggestions: 0,
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                          );
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const CustomIndicator();
                }
                if (controller
                    .listMappedRoom
                    .isEmpty) {
                  return const DataEmpty();
                }
                return Container(
                  color: Colors.white,
                  child: TimePlanner(
                    key: Key(controller.listMappedRoom.length.toString()),
                    startHour: 0,
                    endHour: 23,
                    use24HourFormat: true,
                    setTimeOnAxis: true,
                    style: TimePlannerStyle(
                      cellHeight: 120,
                      cellWidth: 200,
                      showScrollBar: false,
                      interstitialEvenColor: Colors.grey[50],
                      interstitialOddColor: Colors.grey[200],
                    ),
                    headers: controller.listMappedRoom.isNotEmpty ? controller
                        .listMappedRoom.mapIndexed((index,
                        element) =>
                        TimePlannerTitle(
                          title: element,
                        )).toList() : [
                      const TimePlannerTitle(
                        title: "Room Name",
                      )
                    ],
                    tasks: [
                      ...controller.listMappedBooking.map((element) {
                        bool isScheduled = element.isScheduled ?? false;
                        return TimePlannerTask(
                          color: isScheduled ? controller.getColor(element.codeStatusDoc) : Colors.transparent,
                          dateTime: TimePlannerDateTime(day: element.position!,
                              hour: element.hour!,
                              minutes: element.minute!),
                          leftSpace: (200 * element.position!.toDouble()),
                          minutesDuration: element.durationInMinute!,
                          daysDuration: 1,
                          onTap: () {
                            if(isScheduled){
                              Get.to(() => const DetailBookingMeetingRoomScreen(),
                                  arguments: {
                                    "item": element
                                  })?.then((value) => controller.getHeader());
                            }else{
                              controller.addToSelectedBooking(element);
                            }
                          },
                          child: isScheduled ?
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            width: double.infinity,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${element.startTime?.toDateFormat(
                                            targetFormat: "HH:mm",
                                            originFormat: "HH:mm:ss")} - ${element
                                            .endTime?.toDateFormat(
                                            targetFormat: "HH:mm",
                                            originFormat: "HH:mm:ss")}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            color: blackColor,
                                            fontSize: 12,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "${element.title}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            color: blackColor,
                                            fontSize: 12,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                      Text(
                                        "${element.employeeName}",
                                        textAlign: TextAlign.start,
                                        style: const TextStyle(
                                            color: blackColor,
                                            fontSize: 12,
                                            overflow: TextOverflow.ellipsis),
                                      ),
                                    ],
                                  ),
                                ),
                                if(element.isOnlineMeeting)
                                  if(element.link != null)
                                    if(element.link!.isNotEmpty)
                                      OutlinedButton(
                                        onPressed: () async {
                                          if (!await launchUrl(Uri.parse(
                                              element.link.toString()))) {
                                            throw Exception(
                                                'Could not launch ${element.link
                                                    .toString()}');
                                          }
                                        },
                                        style: OutlinedButton.styleFrom(
                                          minimumSize: const Size(75, 30),

                                        ),
                                        child: Text("Join".tr),
                                      ),
                              ],
                            ),
                          ) : Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black12,
                                  width: 0.5
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      ...controller.listAvailableBooking.map((element) {
                        return TimePlannerTask(
                          color: Colors.transparent,
                          dateTime: TimePlannerDateTime(day: element.position!,
                              hour: element.hour!,
                              minutes: element.minute!),
                          leftSpace: (200 * element.position!.toDouble()),
                          minutesDuration: element.durationInMinute!,
                          daysDuration: 1,
                          onTap: () {
                            controller.addToSelectedBooking(element);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black12,
                                  width: 0.5
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                      ...controller.listSelectedBooking.mapIndexed((index, element) {
                        int length = controller.listSelectedBooking.length;
                        bool isEven = length.isEven;
                        bool showAddButton = false;
                        if(isEven){

                        }
                        return TimePlannerTask(
                          color: const Color(0xffdefcf1),
                          dateTime: TimePlannerDateTime(day: element.position!,
                              hour: element.hour!,
                              minutes: element.minute!),
                          leftSpace: (200 * element.position!.toDouble()),
                          // Minutes duration of task
                          minutesDuration: element.durationInMinute!,
                          // Days duration of task (use for multi days task)
                          daysDuration: 1,
                          onTap: () {
                            controller.removeFromSelectedBooking(element);
                          },
                          child: Container(
                            width: 100,
                            child: index == controller.listSelectedBooking.length - 1 ?
                            CustomIconButton(
                              title: "Add".tr,
                              iconData: Icons.add,
                              backgroundColor: infoColor,
                              onPressed: () {
                                Get.to(() => const AddBookingMeetingRoomScreen(), arguments: {
                                  "item" : controller.getItem()
                                })?.then((value){
                                  if(value){
                                    controller.getHeader();
                                    controller.listSelectedBooking.clear();
                                  }
                                });
                              },
                            ) : const SizedBox(),
                          ),
                        );
                      }).toList(),
                    ],
                  ),
                );
              })
          ),
          SizedBox(
            height: 0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successColor,
        onPressed: () =>
            Get.to(() => const AddBookingMeetingRoomScreen())?.then(
                  (value) {
                    if(value){
                      controller.getHeader();
                    }
                  }
            ),
        child: const Icon(Icons.add_rounded, size: 45),
      ),
    );
  }
}