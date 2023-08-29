import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_field.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/get/actual_trip_list_controller.dart';
import 'package:get/get.dart';

class ActualTripListScreen extends StatelessWidget {
  const ActualTripListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActualTripListController>(
        init: ActualTripListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Actualization Trip", style: appTitle),
              leading: CustomBackButton(onPressed: () => Get.off(const HomeScreen(), arguments: 0)),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.fetchList(controller.currentPage);
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: controller.dataisnull || controller.isLoading ? Get.height : 180,
                        maxHeight: 32,
                        child: Container(
                          color: baseColor,
                          child: Column(
                            children: [
                              CustomSearchBar(
                                onSubmit: (value) {
                                  controller.searchValue = value;
                                  controller.filterValue = "All";
                                  controller.currentPage = 1;
                                  controller.fetchList(controller.currentPage);
                                },
                                onClearFilter: () {
                                  controller.clearSearch("");
                                  controller.searchValue = "";
                                  controller.fetchList(1);
                                },
                                onPressedFilter: () {
                                  Get.bottomSheet(StatefulBuilder(builder: (context, setState) {
                                    return FilterBottomSheet(
                                      onApplyFilter: () {
                                        controller.fetchList(1);
                                        controller.update();
                                        Get.back();
                                      },
                                      onResetFilter: () {
                                        setState(() {
                                          controller.formKey.currentState?.reset();
                                          controller.searchValue = null;
                                          controller.filterValue = "All";
                                          controller.dateRange.text = "";
                                          // controller.startDate = null;
                                          // controller.endDate = null;
                                        });
                                        controller.update();
                                        print(controller.filterValue);
                                      },
                                      children: [
                                        Text("Filter", style: appTitle.copyWith(fontSize: 25)),
                                        const SizedBox(height: 10),
                                        // Form(
                                        //   key: controller.formKey,
                                        //   child: CustomDropDownField(
                                        //     label: "Purpose of Trip",
                                        //     items: controller.documentList
                                        //         .map((e) => DropdownMenuItem(
                                        //       value: e.documentName,
                                        //       child: Text(e.documentName.toString()),
                                        //     ))
                                        //         .toSet()
                                        //         .toList(),
                                        //     value: controller.purposeValue,
                                        //     onChanged: (value) {
                                        //       controller.searchValue = null;
                                        //       controller.purposeValue = value.toString();
                                        //       controller.update();
                                        //     },
                                        //   ),
                                        // ),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                        // CustomTextFormField(
                                        //     readOnly: true,
                                        //     controller: controller.dateRange,
                                        //     suffixIcon: const Icon(Icons.calendar_month),
                                        //     onTap: () {
                                        //       showCustomDateRangePicker(
                                        //         context,
                                        //         dismissible: true,
                                        //         minimumDate: DateTime.now().subtract(const Duration(days: 365)),
                                        //         maximumDate: DateTime.now().add(const Duration(days: 365)),
                                        //         // endDate: controller.endDate,
                                        //         // startDate: controller.startDate,
                                        //         backgroundColor: Colors.white,
                                        //         primaryColor: Colors.green,
                                        //         onApplyClick: (start, end) {
                                        //           controller.endDate = controller.rangeFormat.format(end);
                                        //           controller.startDate = controller.rangeFormat.format(start);
                                        //
                                        //           controller.dateRange.text =
                                        //           "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                                        //           controller.update();
                                        //         },
                                        //         onCancelClick: () {
                                        //           controller.endDate = null;
                                        //           controller.startDate = null;
                                        //           controller.update();
                                        //         },
                                        //       );
                                        //     },
                                        //     label: "Date Range".tr),
                                        // const SizedBox(
                                        //   height: 8,
                                        // ),
                                      ],
                                    );
                                  }));
                                },
                              ),
                              CustomPagination(
                                colorSub: whiteColor,
                                colorPrimary: infoColor,
                                onPageChanged: (int pageNumber) {
                                  controller.currentPage = pageNumber;
                                  controller.fetchList(pageNumber);
                                  controller.update();
                                },
                                threshold: 5,
                                pageTotal: controller.actualModel?.data?.lastPage?.toInt() ?? 1,
                                pageInit: controller.currentPage,
                              ),
                              controller.isLoading
                                  ? SizedBox(height: Get.height / 2, child: const Center(child: CircularProgressIndicator()))
                                  : controller.dataisnull == true
                                      ? SizedBox(height: Get.height / 2, child: const DataEmpty())
                                      : Container()
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return SizedBox(
                            child: Column(
                              children: [
                                CustomTripCard(
                                  listNumber: controller.currentPage > 1 ? (controller.actualModel?.data?.from?.toInt() ?? 0) + index : (index + 1),
                                  title: controller.actualList[index].noAct.toString(),
                                  status: controller.actualList[index].status,
                                  subtitle:
                                      controller.dateFormat.format(DateTime.parse(controller.actualList[index].createdAt.toString())).toString(),
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Request Trip", style: listTitleTextStyle),
                                          Text(controller.actualList[index].noRequestTrip ?? "", style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Created By", style: listTitleTextStyle),
                                          Text(controller.actualList[index].employeeName ?? "", style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Days of Trip", style: listTitleTextStyle),
                                          Text(controller.actualList[index].daysOfTrip ?? "", style: listSubTitleTextStyle)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (controller.actualList.length == index + 1) const SizedBox(height: 100)
                              ],
                            ),
                          );
                        },
                        childCount: !controller.dataisnull ? controller.actualList.length : 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
