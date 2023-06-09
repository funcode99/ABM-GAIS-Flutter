import 'package:collection/collection.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/approval/detail/approval_cash_advance_non_travel_detail_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/approval/list/approval_cash_advance_non_travel_list_controller.dart';
import 'package:gais/screen/tms/cash_advance/enum/approval_action_enum.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class ApprovalCashAdvanceNonTravelListScreen extends StatefulWidget {
  const ApprovalCashAdvanceNonTravelListScreen({Key? key}) : super(key: key);

  @override
  State<ApprovalCashAdvanceNonTravelListScreen> createState() =>
      _ApprovalCashAdvanceNonTravelListScreenState();
}

class _ApprovalCashAdvanceNonTravelListScreenState
    extends State<ApprovalCashAdvanceNonTravelListScreen> {
  @override
  Widget build(BuildContext context) {
    final ApprovalCashAdvanceNonTravelListController controller =
        Get.put(ApprovalCashAdvanceNonTravelListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            Get.back(result: true);
          },
        ),
        backgroundColor: whiteColor,
        title: Text("approval_cash_advance_non_travel".tr, style: appTitle),
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
                    Get.back();
                  },
                  children: [
                    CustomTextFormField(
                        readOnly: true,
                        controller: controller.dateRangeController,
                        suffixIcon: const Icon(Icons.calendar_month),
                        onTap: () {
                          showCustomDateRangePicker(
                            context,
                            dismissible: true,
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            maximumDate:
                                DateTime.now().add(const Duration(days: 365)),
                            endDate: controller.endDate.value,
                            startDate: controller.startDate.value,
                            backgroundColor: Colors.white,
                            primaryColor: Colors.green,
                            onApplyClick: (start, end) {
                              controller.endDate.value = end;
                              controller.startDate.value = start;
                              controller.dateRangeController.text =
                                  "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                            },
                            onCancelClick: () {},
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
                          ...controller.listHeader
                              .mapIndexed((index, item) => CommonListItem(
                                    onTap: () {
                                      Get.to(
                                          () =>
                                              const ApprovalCashAdvanceNonTravelDetailScreen(
                                                approvalActionEnum:
                                                    ApprovalActionEnum.none,
                                              ),
                                          arguments: {"item": item});
                                    },
                                    number:
                                        "${((controller.currentPage.value - 1) * 10) + (index + 1)}",
                                    title: item.noCa ?? "-",
                                    subtitle:
                                        "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy")}",
                                    total:
                                        "${item.currencyCode ?? ""} ${item.grandTotal?.toInt().toCurrency()}",
                                    content: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              children: [
                                                Text(
                                                  "Event".tr,
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                          fontSize: 14,
                                                          color: Colors.black,
                                                          height: 1.5),
                                                ),
                                                Text(
                                                  "${item.event}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyText1
                                                      ?.copyWith(
                                                          fontSize: 14,
                                                          color: greyColor,
                                                          height: 1.5),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    action: item.codeStatusDoc ==
                                            CashAdvanceNonTravelEnum
                                                .waitingApproval.value
                                        ? [
                                            CustomIconButton(
                                              title: "Approve".tr,
                                              iconData: Icons.check,
                                              backgroundColor: successColor,
                                              onPressed: () {
                                                Get.to(
                                                    () =>
                                                        const ApprovalCashAdvanceNonTravelDetailScreen(
                                                          approvalActionEnum:
                                                              ApprovalActionEnum
                                                                  .approve,
                                                        ),
                                                    arguments: {"item": item});
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
                                                        const ApprovalCashAdvanceNonTravelDetailScreen(
                                                          approvalActionEnum:
                                                              ApprovalActionEnum
                                                                  .reject,
                                                        ),
                                                    arguments: {"item": item});
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
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
