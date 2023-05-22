import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/loadingdialog.dart';
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
              flexibleSpace: const TopBar(),
            ),
            body: controller.isLoading == false
                ? CustomScrollView(
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
                                margin: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  // vertical: 5,
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: Get.width - 112,
                                      margin: const EdgeInsets.only(right: 10),
                                      child: TextField(
                                        controller: controller.search,
                                        decoration: const InputDecoration(
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
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AnimatedContainer(
                                              padding: const EdgeInsets.all(45),
                                              duration: const Duration(
                                                  milliseconds: 5000),
                                              child: ListView(
                                                shrinkWrap: true,
                                                children: [
                                                  Text("Purpose of trip",
                                                      style:
                                                          listTitleTextStyle),
                                                  Container(
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 6),
                                                    padding: const EdgeInsets
                                                            .symmetric(
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
                                                      icon: const Icon(Icons
                                                          .keyboard_arrow_down),
                                                      hint: const Text(
                                                          "Company Business"),
                                                      value: controller
                                                          .purposeValue,
                                                      isExpanded: true,
                                                      underline:
                                                          const SizedBox(),
                                                      items: const [
                                                        DropdownMenuItem(
                                                          value: "CB",
                                                          child: Text(
                                                              "Company Business"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "FB",
                                                          child: Text(
                                                              "Field Break"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "SV",
                                                          child: Text(
                                                              "Site Visit"),
                                                        ),
                                                        DropdownMenuItem(
                                                          value: "TV",
                                                          child: Text(
                                                              "Taxi Voucher Only"),
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
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 6),
                                                    child: TextField(
                                                      readOnly: true,
                                                      controller:
                                                          controller.dateRange,
                                                      decoration: const InputDecoration(
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
                                                  const CustomFilledButton(
                                                    color: successColor,
                                                    title: "Filter",
                                                    width: 120,
                                                  )
                                                ],
                                                // ),
                                              ),
                                            );
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
                                colorSub: whiteColor,
                                colorPrimary: infoColor,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 16),
                                onPageChanged: (int pageNumber) {
                                  controller.currentPage = pageNumber;
                                  controller.fetchList();
                                  controller.update();
                                },
                                pageTotal:
                                    // controller.rtlModel!.data!.total! >= 10
                                    //     ? (controller.rtlModel!.data!.total! /
                                    //             controller.perPage)
                                    //         .ceil()
                                    //     : 1,
                                controller.rtlModel?.data?.lastPage?.toInt() ?? 1,
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
                            return controller.isLoading == true
                                ? CircularProgressIndicator.adaptive()
                                : Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: CustomTripCard(
                                          listNumber: controller.currentPage > 1
                                              ? (index +
                                                  controller
                                                      .rtlModel!.data!.from!
                                                      .toInt())
                                              : (index + 1),
                                          title: controller
                                              .requestList[index].noRequestTrip
                                              .toString(),
                                          status: controller
                                              .requestList[index].status,
                                          subtitle: controller
                                              .requestList[index].createdAt
                                              ?.substring(0, 10),
                                          info: controller
                                              .requestList[index].documentName,
                                          isEdit: true,
                                          editAction: () => Get.to(
                                              const FormRequestTripScreen()),
                                          isDelete: true,
                                          deleteAction: () {
                                            controller.isLoading == true
                                                ? LoadingDialog().show(context)
                                                : LoadingDialog()
                                                    .close(context);
                                            controller.delete(int.parse(
                                                controller.requestList[index].id
                                                    .toString()));

                                            controller.update();
                                          },
                                          content: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Requestor",
                                                  style: listTitleTextStyle),
                                              Text(
                                                  controller.requestList[index]
                                                          .employeeName ??
                                                      "",
                                                  style: listSubTitleTextStyle)
                                            ],
                                          ),
                                        ),
                                      ),
                                      controller.requestList.length == index + 1
                                          ? SizedBox(height: 100)
                                          : SizedBox()
                                    ],
                                  );
                          },
                          childCount: controller.requestList.length,
                        ),
                      ),
                    ],
                  )
                : const Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: successColor,
              onPressed: () => Get.to(const RequesterInfoScreen()),
              child: const Icon(Icons.add_rounded, size: 45),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
