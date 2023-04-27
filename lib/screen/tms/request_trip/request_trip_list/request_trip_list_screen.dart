import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/requester_info/requester_info_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';

class RequestTripListScreen extends StatelessWidget {
  const RequestTripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestTripListController>(
        init: RequestTripListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              backgroundColor: whiteColor,
              title: Text("Request Trip", style: appTitle),
              centerTitle: true,
              flexibleSpace: TopBar(),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "Search",
                            prefixIcon: Icon(IconlyLight.search)),
                      ),
                    ),
                    Text("Purpose of trip", style: listTitleTextStyle),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                      width: Get.width,
                      decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: blackColor)),
                      child: DropdownButton(
                        icon: Icon(Icons.keyboard_arrow_down),
                        hint: Text("Company Business"),
                        value: controller.purposeValue,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: [
                          DropdownMenuItem(
                            child: Text("Company Business"),
                            value: "Company Business",
                          ),
                          DropdownMenuItem(
                            child: Text("Field Break"),
                            value: "Field Break",
                          ),
                          DropdownMenuItem(
                            child: Text("Site Visit"),
                            value: "Site Visit",
                          ),
                          DropdownMenuItem(
                            child: Text("Taxi Voucher Only"),
                            value: "Taxi Voucher",
                          ),
                        ],
                        onChanged: (value) {
                          controller.purposeValue = value;
                          controller.update();
                        },
                      ),
                    ),
                    Text("Date Range", style: listTitleTextStyle),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 6),
                      child: TextField(
                        readOnly: true,
                        controller: controller.dateRange,
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.calendar_month)),
                        onTap: () {
                          showCustomDateRangePicker(
                            context,
                            dismissible: true,
                            minimumDate: DateTime.now().subtract(const Duration(days: 365)),
                            maximumDate: DateTime.now().add(const Duration(days: 365)),
                            endDate: controller.endDate,
                            startDate: controller.startDate,
                            backgroundColor: Colors.white,
                            primaryColor: Colors.green,
                            onApplyClick: (start, end) {
                              controller.endDate = end;
                              controller.startDate = start;
                              controller.dateRange.text =
                                  "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                              controller.update();
                            },
                            onCancelClick: () {
                              controller.endDate = null;
                              controller.startDate = null;
                              controller.update();
                            },
                          );
                        },
                      ),
                    ),
                    CustomTripCard(
                      listNumber: 1,
                      title: "TRV-ABM/1232/23.04",
                      status: "Submitted",
                      subtitle: "23/04/23",
                      info: 'company BUsiness',
                      isEdit: true,
                      isDelete:true,
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Requestor", style: listTitleTextStyle),
                          Text("jack", style: listSubTitleTextStyle)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_rounded, size: 45),
              backgroundColor: successColor,
              onPressed: () => Get.to(RequesterInfoScreen()),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
