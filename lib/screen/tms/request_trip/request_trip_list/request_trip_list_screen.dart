import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
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
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 5),
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
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Purpose of trip",
                                            style: listTitleTextStyle),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 6),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 3),
                                          width: Get.width,
                                          decoration: BoxDecoration(
                                              color: whiteColor,
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                              border: Border.all(
                                                  color: blackColor)),
                                          child: DropdownButton(
                                            icon:
                                                Icon(Icons.keyboard_arrow_down),
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
                                                child:
                                                    Text("Taxi Voucher Only"),
                                                value: "Taxi Voucher",
                                              ),
                                            ],
                                            onChanged: (value) {
                                              controller.purposeValue = value;
                                              controller.update();
                                            },
                                          ),
                                        ),
                                        Text("Date Range",
                                            style: listTitleTextStyle),
                                        Container(
                                          margin:
                                              EdgeInsets.symmetric(vertical: 6),
                                          child: TextField(
                                            readOnly: true,
                                            controller: controller.dateRange,
                                            decoration: InputDecoration(
                                                suffixIcon:
                                                    Icon(Icons.calendar_month)),
                                            onTap: () {
                                              showCustomDateRangePicker(
                                                context,
                                                dismissible: true,
                                                minimumDate: DateTime.now()
                                                    .subtract(const Duration(
                                                        days: 365)),
                                                maximumDate: DateTime.now().add(
                                                    const Duration(days: 365)),
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
                                      ],
                                    ),
                                    actionsAlignment: MainAxisAlignment.center,
                                    actions: [
                                      CustomFilledButton(
                                        color: successColor,
                                        title: "Filter",
                                        width: 120,
                                      )
                                    ],
                                  );
                                },
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 60,
                    maxHeight: 32,
                    child: CustomPagination(
                      onPageChanged: (int pageNumber) {
                        controller.currentPage = pageNumber;
                      },
                      pageTotal: 10,
                      pageInit: controller.currentPage,
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
                          status: "Submitted",
                          subtitle: "23/04/23",
                          info: 'Company Business',
                          isEdit: true,
                          isDelete: true,
                          content: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Requestor", style: listTitleTextStyle),
                              Text("jack", style: listSubTitleTextStyle)
                            ],
                          ),
                          onTap: () => Get.to(FormRequestTripScreen()),
                        ),
                      );
                    },
                    childCount: 10, // 1000 list items
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
