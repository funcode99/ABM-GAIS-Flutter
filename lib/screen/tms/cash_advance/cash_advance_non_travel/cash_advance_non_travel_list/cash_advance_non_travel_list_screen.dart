import 'package:collection/collection.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/error/empty_list_error.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/add_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/cash_advance_non_travel_list/cash_advance_non_travel_list_controller.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/edit/edit_cash_advance_non_travel_screen.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CashAdvanceNonTravelListScreen extends StatefulWidget {
  const CashAdvanceNonTravelListScreen({Key? key}) : super(key: key);

  @override
  State<CashAdvanceNonTravelListScreen> createState() =>
      _CashAdvanceNonTravelListScreenState();
}

class _CashAdvanceNonTravelListScreenState
    extends State<CashAdvanceNonTravelListScreen> {
  @override
  Widget build(BuildContext context) {
    final CashAdvanceNonTravelListController controller =
        Get.put(CashAdvanceNonTravelListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text("cash_advance_non_travel".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomSearchBar(
              onChanged: (string) {},
              onPressedFilter: () {
                Get.bottomSheet(FilterBottomSheet(
                  onApplyFilter: () {
                    Get.back();
                  },
                  children: [
                    CustomTextFormField(
                        readOnly: true,
                        controller: controller.dateRange,
                        suffixIcon: const Icon(Icons.calendar_month),
                        onTap: () {
                          showCustomDateRangePicker(
                            context,
                            dismissible: true,
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            maximumDate:
                                DateTime.now().add(const Duration(days: 365)),
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
                        label: "Date Range".tr),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ));
              },
            ),
            CustomPagination(
              onPageChanged: (int) {},
              pageTotal: 5,
              margin: EdgeInsets.zero,
              colorSub: infoColor,
              colorPrimary: whiteColor,
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: RefreshIndicator(
              onRefresh: () async {
                controller.getData();
              },
              child: Obx(() {
                return controller.listHeader.isEmpty
                    ? const EmptyListError()
                    : ListView(
                        children: [
                          ...controller.listHeader
                              .mapIndexed((index, item) => CommonListItem(
                                    number: "${index + 1}",
                                    title: "${item.noCa}",
                                    subtitle:
                                        "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy")}",
                                    total:
                                        "${item.grandTotal?.toInt().toCurrency()}",
                                    content: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Event".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                "${item.event}",
                                                style: listSubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                    action: [
                                      CustomIconButton(
                                        title: "Edit".tr,
                                        iconData: IconlyBold.edit,
                                        backgroundColor: successColor,
                                        onPressed: () async {
                                          final result = await Get.to(
                                              () =>
                                                  const EditCashAdvanceNonTravelScreen(),
                                              arguments: {"item": item});
                                          if (result) {
                                            controller.getData();
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      CustomIconButton(
                                        title: "Delete".tr,
                                        iconData: IconlyBold.delete,
                                        backgroundColor: redColor,
                                        onPressed: () {
                                          Get.dialog(DeleteConfirmationDialog(
                                            onDeletePressed: () {
                                              Get.back();
                                            },
                                          ));
                                        },
                                      )
                                    ],
                                    status: item.status,
                                  ))
                        ],
                      );
              }),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successColor,
        onPressed: () => Get.to(const AddCashAdvanceNonTravelScreen()),
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
