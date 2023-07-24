import 'package:collection/collection.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/calendar/custom_calendar_picker.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/cash_advance_travel/detail/approval_cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/approval/cash_advance_travel/list/approval_cash_advance_travel_list_controller.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class ApprovalCashAdvanceTravelListScreen extends StatelessWidget {
  const ApprovalCashAdvanceTravelListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApprovalCashAdvanceTravelListController controller =
        Get.put(ApprovalCashAdvanceTravelListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            Get.back(result: true);
          },
        ),
        backgroundColor: whiteColor,
        title: Text("approval_cash_advance_travel".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomSearchBar(
              onSubmit: (string) {
                controller.applySearch(string);
              },
              onClearFilter: () {
                controller.applySearch("");
              },
              onPressedFilter: () {
                controller.openFilter();
                Get.bottomSheet(FilterBottomSheet(
                  onApplyFilter: () {
                    controller.applyFilter();
                    Get.back();
                  },
                  onResetFilter: (){
                    controller.resetFilter();
                  },
                  children: [
                    CustomTextFormField(
                        readOnly: true,
                        controller: controller.dateRangeController,
                        suffixIcon: const Icon(Icons.calendar_month),
                        onTap: () {
                          if(DateUtils.isSameDay(controller.startDateTemp.value, controller.endDateTemp.value)){
                            controller.endDateTemp.value = null;
                          }

                          showCustomCalendarPicker(
                            context,
                            isRange: false,
                            dismissible: true,
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            maximumDate:
                                DateTime.now().add(const Duration(days: 365)),
                            endDate: controller.endDateTemp.value,
                            startDate: controller.startDateTemp.value,
                            backgroundColor: Colors.white,
                            primaryColor: Colors.green,
                            onApplyClick: (start, end) {
                              controller.endDateTemp.value = end ?? start;
                              controller.startDateTemp.value = start;
                              controller.dateRangeController.text =
                              "${controller.dateFormat.format(controller.startDateTemp.value!)} - ${controller.dateFormat.format(controller.endDateTemp.value!)}";
                            },
                            onCancelClick: () {
                              if(controller.startDateTemp.value != null){
                                controller.endDateTemp.value ??= controller.startDateTemp.value;
                              }
                            },
                          );
                        },
                        label: "Date Range".tr),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ));
              },
            ),
            Obx(() {
              if (controller.listHeader.isEmpty) {
                return const SizedBox();
              }

              return CustomPagination(
                key: UniqueKey(),
                onPageChanged: (page) {
                  if (page != controller.currentPage.value) {
                    controller.getHeader(page: page);
                  }
                },
                pageTotal: controller.totalPage.value,
                margin: EdgeInsets.zero,
                pageInit: controller.currentPage.value,
                colorSub: whiteColor,
                colorPrimary: infoColor,
              );
            }),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                controller.getHeader();
              },
              child: Obx(() {
                return controller.listHeader.isEmpty
                    ? const DataEmpty()
                    : ListView(
                        children: [
                          ...controller.listHeader.mapIndexed((index, item) =>
                              CommonListItem(
                                onTap: () {
                                  Get.to(
                                      () =>
                                          const ApprovalCashAdvanceTravelDetailScreen(
                                            approvalActionEnum:
                                                ApprovalActionEnum.none,
                                          ),
                                      arguments: {
                                        "item": item
                                      })?.then(
                                      (value) => controller.getHeader());
                                },
                                number:
                                    "${((controller.currentPage.value - 1) * controller.limit) + (index + 1)}",
                                title: item.noCa ?? "-",
                                subtitle:
                                    "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss")}",
                                total: item.grandTotal!.isNumericOnly ? "${item.currencyCode ?? ""} ${item.grandTotal?.toInt().toCurrency()}" : null,
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Requestor".tr,
                                              style: listTitleTextStyle,
                                            ),
                                            Text("${item.employeeName ?? "-"}",
                                                style: listSubTitleTextStyle
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Item Count".tr,
                                              style: listTitleTextStyle,
                                            ),
                                            Text("${item.itemCount ?? "-"}",
                                                style: listSubTitleTextStyle
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Currency".tr,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              item.currencyName ?? "",
                                              style: listSubTitleTextStyle
                                                  .copyWith(
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Reference".tr,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(item.noRequestTrip ?? "-",
                                                style: listSubTitleTextStyle
                                                    .copyWith(
                                                        overflow: TextOverflow
                                                            .ellipsis)),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                action: item.codeStatusDoc ==
                                    RequestTripEnum
                                            .waitingApproval.value
                                    ? [
                                        CustomIconButton(
                                          title: "Approve".tr,
                                          iconData: Icons.check,
                                          backgroundColor: successColor,
                                          onPressed: () {
                                            Get.to(
                                                () =>
                                                    const ApprovalCashAdvanceTravelDetailScreen(
                                                      approvalActionEnum:
                                                          ApprovalActionEnum
                                                              .approve,
                                                    ),
                                                arguments: {
                                                  "item": item
                                                })?.then((value) =>
                                                controller.getHeader());
                                          },
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        CustomIconButton(
                                          title: "Reject".tr,
                                          iconData: Icons.close,
                                          backgroundColor: redColor,
                                          onPressed: () {
                                            Get.to(
                                                () =>
                                                    const ApprovalCashAdvanceTravelDetailScreen(
                                                      approvalActionEnum:
                                                          ApprovalActionEnum
                                                              .reject,
                                                    ),
                                                arguments: {
                                                  "item": item
                                                })?.then((value) =>
                                                controller.getHeader());
                                          },
                                        )
                                      ]
                                    : [],
                                status: item.status,
                              ))
                        ],
                      );
              }),
            )),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
