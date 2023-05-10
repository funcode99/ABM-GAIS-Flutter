import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/requester_info/requester_info_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
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
          controller.search.text = "current page: ${controller.currentPage}";
          controller.update();
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
                          minHeight: 100,
                          maxHeight: 32,
                          child: Column(
                            children: [
                              Container(
                                height: 10,
                                color: baseColor,
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  // vertical: 5,
                                ),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: Get.width - 112,
                                      margin: EdgeInsets.only(right: 10),
                                      child: TextField(
                                        controller: controller.search,
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
                                            controller.showFilter
                                                ? false
                                                : true;
                                        controller.update();
                                        showModalBottomSheet(
                                          shape: const RoundedRectangleBorder(
                                            borderRadius: BorderRadius.vertical(
                                                top: Radius.circular(20)),
                                          ),
                                          isScrollControlled: false,
                                          // showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            // return AlertDialog(
                                            //   scrollable: true,
                                            //   titlePadding: EdgeInsets.zero,
                                            //   shape: RoundedRectangleBorder(
                                            //       borderRadius: BorderRadius.all(
                                            //           Radius.circular(8))),
                                            //   title: Container(
                                            //     padding: EdgeInsets.symmetric(
                                            //         horizontal: 20, vertical: 5),
                                            //     decoration: BoxDecoration(
                                            //         color: lightBlueColor,
                                            //         borderRadius: BorderRadius.only(
                                            //             topRight: Radius.circular(8),
                                            //             topLeft: Radius.circular(8))),
                                            //     child: Row(
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.spaceBetween,
                                            //       children: [
                                            //         Text("Filter"),
                                            //         IconButton(
                                            //             onPressed: () => Get.back(),
                                            //             icon: Icon(Icons.close))
                                            //       ],
                                            //     ),
                                            //   ),
                                            //   content: Column(
                                            // crossAxisAlignment:
                                            // CrossAxisAlignment.start,
                                            return AnimatedContainer(
                                              padding: const EdgeInsets.all(45),
                                              duration:
                                                  Duration(milliseconds: 5000),
                                              child: ListView(
                                                shrinkWrap: true,
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
                                                      value: controller
                                                          .purposeValue,
                                                      isExpanded: true,
                                                      underline: SizedBox(),
                                                      items: [
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Company Business"),
                                                          value:
                                                              "CB",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Field Break"),
                                                          value: "FB",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Site Visit"),
                                                          value: "SV",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Taxi Voucher Only"),
                                                          value: "TV",
                                                        ),
                                                      ],
                                                      onChanged: (value) {
                                                        controller
                                                                .purposeValue =
                                                            value;
                                                        controller.update();
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
                                                      controller:
                                                          controller.dateRange,
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
                                                          endDate: controller
                                                              .endDate,
                                                          startDate: controller
                                                              .startDate,
                                                          backgroundColor:
                                                              Colors.white,
                                                          primaryColor:
                                                              Colors.green,
                                                          onApplyClick:
                                                              (start, end) {
                                                            controller.endDate =
                                                                end;
                                                            controller
                                                                    .startDate =
                                                                start;
                                                            controller.dateRange
                                                                    .text =
                                                                "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                                                            controller.update();
                                                          },
                                                          onCancelClick: () {
                                                            controller.endDate =
                                                                null;
                                                            controller
                                                                    .startDate =
                                                                null;
                                                            controller.update();
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  CustomFilledButton(
                                                    color: successColor,
                                                    title: "Filter",
                                                    width: 120,
                                                  )
                                                ],
                                                // ),
                                              ),
                                            );
                                            //   actionsAlignment:
                                            //       MainAxisAlignment.center,
                                            //   actions: [
                                            //     CustomFilledButton(
                                            //       color: successColor,
                                            //       title: "Filter",
                                            //       width: 120,
                                            //     )
                                            //   ],
                                            // );
                                          },
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 10,
                                color: baseColor,
                              ),
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
                                  controller.update();
                                },
                                pageTotal: controller.requestList.length > 10
                                    ? (controller.requestList.length / 10)
                                        .ceil()
                                    : 1,
                                pageInit: controller.currentPage,
                              ),
                              Container(height: 10, color: baseColor),
                            ],
                          ),
                        ),
                      ),
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            // int _page = 0;
                            // controller.currentPage != 1
                            //     ? _page = controller.currentPage + 9
                            //     : 0;
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: CustomTripCard(
                                listNumber: index + 1,
                                title:
                                    "code request : ${controller.requestList[index].id}",
                                status:
                                    "code status: ${controller.requestList[index].codeStatus}",
                                subtitle:
                                    "tgl buat : ${controller.requestList[index].createdAt?.substring(0, 10)}",
                                info:
                                    'purpose : ${controller.requestList[index].noRequestTrip}',
                                isEdit: true,
                                isDelete: true,
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Requestor",
                                        style: listTitleTextStyle),
                                    Text(
                                        "employee : ${controller.requestList[index].idEmployee}",
                                        style: listSubTitleTextStyle)
                                  ],
                                ),
                                onTap: () => Get.to(FormRequestTripScreen()),
                              ),
                            );
                          },
                          // childCount: controller.requestList.length
                          childCount: controller.requestList.length < 10
                              ? controller.requestList.length
                              : 10,
                        ),
                      ),
                    ],
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
