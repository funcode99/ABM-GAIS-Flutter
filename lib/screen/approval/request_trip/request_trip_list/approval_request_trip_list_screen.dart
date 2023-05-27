import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
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
            appBar: TopBar(
              title: Text("Request Trip", style: appTitle),
            ),
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: controller.dataisnull ? Get.height : 180,
                    maxHeight: 32,
                    child: Container(
                      color: baseColor,
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          CustomSearchBar(
                            onSubmit: (value) {
                              controller.searchValue = value;
                              controller.fetchList();
                              print("cari : ${controller.searchNotFound}");
                            },
                            onPressedFilter: () {
                              Get.bottomSheet(StatefulBuilder(builder: (context, setState) {
                                return FilterBottomSheet(
                                  onApplyFilter: () {
                                    controller.fetchList();
                                    controller.update();
                                    Get.back();
                                  },
                                  children: [
                                    Text("Filter", style: appTitle.copyWith(fontSize: 25)),
                                    SizedBox(height: 10),
                                    // CustomFormLabel(
                                    //   label: "Purpose of Trip",
                                    // ),
                                    // SingleChildScrollView(
                                    //   scrollDirection: Axis.horizontal,
                                    //   child:
                                    // Row(
                                    //   children: controller.documentList
                                    //       .map(
                                    //         (e) =>
                                    //             GestureDetector(
                                    //           onTap: () {
                                    //             e.isSelected = e.isSelected == false ? true : false;
                                    //             if (e.id! > 0)
                                    //               controller.documentList[0].isSelected = false;
                                    //             else {
                                    //               controller.documentList[1].isSelected = false;
                                    //               controller.documentList[2].isSelected = false;
                                    //               controller.documentList[3].isSelected = false;
                                    //               controller.documentList[4].isSelected = false;
                                    //             }
                                    //             controller.update();
                                    //             setState(() {});
                                    //             print(e.isSelected);
                                    //             print(e.id);
                                    //           },
                                    //           child: Container(
                                    //             margin: EdgeInsets.all(10),
                                    //             padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                                    //             decoration: BoxDecoration(
                                    //                 color: e.isSelected ? successColor : whiteColor,
                                    //                 borderRadius: BorderRadius.circular(8),
                                    //                 border: Border.all(color: e.isSelected ? Colors.transparent : blackColor)),
                                    //             child: Text(
                                    //               e.documentName.toString(),
                                    //               style: TextStyle(color: e.isSelected! ? whiteColor : blackColor),
                                    //             ),
                                    //           ),
                                    //         ),
                                    //       )
                                    //       .toList(),
                                    // ),
                                    // ),
                                    CustomDropDownFormField(
                                      label: "Purpose of Trip",
                                      hintText: "Purpose of Trip",
                                      items: controller.documentList
                                          .map((e) => DropdownMenuItem(
                                                child: Text(e.documentName.toString()),
                                                value: e.documentName,
                                              ))
                                          .toList(),
                                      value: controller.searchValue,
                                      onChanged: (value) {
                                        controller.searchValue = value ?? "";
                                        controller.update();
                                      },
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    CustomTextFormField(
                                        readOnly: true,
                                        controller: controller.dateRange,
                                        suffixIcon: const Icon(Icons.calendar_month),
                                        onTap: () {
                                          showCustomDateRangePicker(
                                            context,
                                            dismissible: true,
                                            minimumDate: DateTime.now().subtract(const Duration(days: 365)),
                                            maximumDate: DateTime.now().add(const Duration(days: 365)),
                                            // endDate: controller.endDate,
                                            // startDate: controller.startDate,
                                            backgroundColor: Colors.white,
                                            primaryColor: Colors.green,
                                            onApplyClick: (start, end) {
                                              controller.endDate = controller.rangeFormat.format(end);
                                              controller.startDate = controller.rangeFormat.format(start);

                                              controller.dateRange.text =
                                                  "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";

                                              controller.fetchList();
                                              controller.update();
                                            },
                                            onCancelClick: () {
                                              controller.endDate = null;
                                              controller.startDate = null;
                                              controller.update();
                                            },
                                          );
                                        },
                                        label: "Date Range".tr),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                  ],
                                );
                              }));
                            },
                          ),
                          controller.dataisnull
                              ? DataEmpty()
                              : CustomPagination(
                                  colorSub: whiteColor,
                                  colorPrimary: infoColor,
                                  onPageChanged: (int pageNumber) {
                                    controller.currentPage = pageNumber;
                                    controller.fetchList();
                                    controller.update();
                                  },
                                  threshold: 5,
                                  pageTotal: controller.rtlModel?.data?.lastPage?.toInt() ?? 1,
                                  pageInit: controller.currentPage,
                                ),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: CustomTripCard(
                              listNumber:
                                  controller.currentPage > 1 ? (index + controller.rtlModel!.data!.from!.toInt()) : (index + 1),
                              title: controller.requestList[index].noRequestTrip.toString(),
                              status: controller.requestList[index].status,
                              subtitle: controller.requestList[index].createdAt?.substring(0, 10),
                              info: controller.requestList[index].documentName,
                              approval: true,
                              isEdit: true,
                              editAction: () => Get.to(
                                const FormRequestTripScreen(),
                                arguments: {
                                  'id': controller.requestList[index].id?.toInt(),
                                },
                              ),
                              isDelete: true,
                              content: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Requestor", style: listTitleTextStyle),
                                  Text(controller.requestList[index].employeeName ?? "", style: listSubTitleTextStyle)
                                ],
                              ),
                              onTap: () => Get.to(ApprovalFormRequestTripScreen(), arguments: {
                                'id': controller.requestList[index].id?.toInt(),
                              }),
                            ),
                          ),
                          controller.requestList.length == index + 1 ? SizedBox(height: 100) : SizedBox()
                        ],
                      );
                    },
                    childCount: controller.requestList.length ?? 1,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
