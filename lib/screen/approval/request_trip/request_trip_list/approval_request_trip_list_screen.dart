import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_trip/form_request_trip/approval_form_request_trip_screen.dart';
import 'package:gais/screen/approval/request_trip/request_trip_list/approval_request_trip_controller.dart';
import 'package:gais/screen/tms/request_trip/add/requester_info/requester_info_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';

class ApprovalRequestTripListScreen extends StatelessWidget {
  const ApprovalRequestTripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalRequestTripListController>(
        init: ApprovalRequestTripListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              backgroundColor: whiteColor,
              title: Text("Request Trip", style: appTitle),
              centerTitle: true,
              flexibleSpace: TopBar(),
            ),
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 110,
                    maxHeight: 32,
                    child: Column(
                      children: [
                        Container(height: 10, color: baseColor),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Container(
                                width: Get.width - 112,
                                margin: EdgeInsets.only(right: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    prefixIcon: Icon(IconlyLight.search),
                                  ),
                                ),
                              ),
                              CustomFilledButton(
                                color: successColor,
                                icon: IconlyBold.filter_2,
                                width: 50,
                                onPressed: () {
                                  controller.showFilter =
                                      controller.showFilter! ? false : true;
                                  controller.update();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        titlePadding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        title: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: lightBlueColor,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Filter"),
                                              IconButton(
                                                  onPressed: () => Get.back(),
                                                  icon: Icon(Icons.close))
                                            ],
                                          ),
                                        ),
                                        content: GetBuilder<
                                                ApprovalRequestTripListController>(
                                            init:
                                                ApprovalRequestTripListController(),
                                            builder: (c) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Purpose of trip",
                                                      style:
                                                          listTitleTextStyle),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 3),
                                                    width: Get.width,
                                                    decoration: BoxDecoration(
                                                        color: whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                            color: blackColor)),
                                                    child: DropdownButton(
                                                      icon: Icon(Icons
                                                          .keyboard_arrow_down),
                                                      hint: Text(
                                                          "Company Business"),
                                                      value: c.purposeValue,
                                                      isExpanded: true,
                                                      underline: SizedBox(),
                                                      items: [
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Company Business"),
                                                          value:
                                                              "Company Business",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Field Break"),
                                                          value: "Field Break",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Site Visit"),
                                                          value: "Site Visit",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Taxi Voucher Only"),
                                                          value: "Taxi Voucher",
                                                        ),
                                                      ],
                                                      onChanged: (value) {
                                                        c.purposeValue = value;
                                                        c.update();
                                                      },
                                                    ),
                                                  ),
                                                  Text("Date Range",
                                                      style:
                                                          listTitleTextStyle),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6),
                                                    child: TextField(
                                                      readOnly: true,
                                                      controller: c.dateRange,
                                                      decoration: InputDecoration(
                                                          suffixIcon: Icon(Icons
                                                              .calendar_month)),
                                                      onTap: () {
                                                        showCustomDateRangePicker(
                                                          context,
                                                          dismissible: true,
                                                          minimumDate: DateTime
                                                                  .now()
                                                              .subtract(
                                                                  const Duration(
                                                                      days:
                                                                          365)),
                                                          maximumDate: DateTime
                                                                  .now()
                                                              .add(
                                                                  const Duration(
                                                                      days:
                                                                          365)),
                                                          endDate: c.endDate,
                                                          startDate:
                                                              c.startDate,
                                                          backgroundColor:
                                                              Colors.white,
                                                          primaryColor:
                                                              Colors.green,
                                                          onApplyClick:
                                                              (start, end) {
                                                            c.endDate = end;
                                                            c.startDate = start;
                                                            c.dateRange.text =
                                                                "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                                                            c.update();
                                                          },
                                                          onCancelClick: () {
                                                            c.endDate = null;
                                                            c.startDate = null;
                                                            c.update();
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Center(
                                                    child: CustomFilledButton(
                                                        color: successColor,
                                                        title: "Filter",
                                                        width: 120,
                                                        onPressed: () =>
                                                            Get.back(result: [
                                                              c.purposeValue,
                                                              c.dateRange
                                                            ])),
                                                  )
                                                ],
                                              );
                                            }),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: [],
                                      );
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        Container(height: 10, color: baseColor),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 70,
                    maxHeight: 32,
                    child: Column(
                      children: [
                        CustomPagination(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          onPageChanged: (int pageNumber) {
                            controller.currentPage = pageNumber;
                          },
                          pageTotal: 10,
                          pageInit: controller.currentPage,
                          colorPrimary: whiteColor,
                          colorSub: infoColor,
                        ),
                        Container(height: 10, color: baseColor),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: CustomTripCard(
                          listNumber: 1,
                          title: "TRV-ABM/1232/23.04",
                          status: "Waiting\nApproved",
                          subtitle: "23/04/23",
                          info: 'Company Business',
                          isEdit: true,
                          isDelete: true,
                          approval: true,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Requestor", style: listTitleTextStyle),
                              Text("jack", style: listSubTitleTextStyle)
                            ],
                          ),
                          onTap: () => Get.to(ApprovalFormRequestTripScreen()),
                        ),
                      );
                    },
                    childCount: 10, // 1000 list items
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
