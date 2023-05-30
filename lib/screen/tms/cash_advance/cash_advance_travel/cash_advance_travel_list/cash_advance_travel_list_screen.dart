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
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/error/empty_list_error.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/cash_advance_travel_detail/cash_advance_travel_detail_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/cash_advance_travel_list/cash_advance_travel_list_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CashAdvanceTravelListScreen extends StatefulWidget {
  const CashAdvanceTravelListScreen({Key? key}) : super(key: key);

  @override
  State<CashAdvanceTravelListScreen> createState() =>
      _CashAdvanceTravelListScreenState();
}

class _CashAdvanceTravelListScreenState
    extends State<CashAdvanceTravelListScreen> {
  @override
  Widget build(BuildContext context) {
    final CashAdvanceTravelListController controller =
        Get.put(CashAdvanceTravelListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("cash_advance_travel".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            CustomSearchBar(
              onChanged: (string) {
                controller.keyword(string);
                controller.getHeader(page: 1);
              },
              onPressedFilter: () {
                Get.bottomSheet(FilterBottomSheet(
                  onApplyFilter: () {
                    controller.getHeader();
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
                            endDate: controller.endDate.value,
                            startDate: controller.startDate.value,
                            backgroundColor: Colors.white,
                            primaryColor: Colors.green,
                            onApplyClick: (start, end) {
                              controller.endDate.value = end;
                              controller.startDate.value = start;
                              controller.dateRange.text =
                                  "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                              controller.update();
                            },
                            onCancelClick: () {

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
              return CustomPagination(
                key: UniqueKey(),
                onPageChanged: (page) {
                  controller.getHeader(page: page);
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
                    ? const EmptyListError()
                    : ListView(
                        children: [
                          ...controller.listHeader
                              .mapIndexed((index, item) => CommonListItem(
                                    number: "${index + 1}",
                                    title: item.noCa ?? "-",
                                    subtitle: item.employeeName ?? "-",
                                    total:
                                        item.grandTotal?.toInt().toCurrency(),
                                    content: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Item Count".tr,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  "${item.itemCount}",
                                                  style: listSubTitleTextStyle,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Currency".tr,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  item.currencyName ?? "",
                                                  style: listSubTitleTextStyle,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Reference".tr,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  item.noRequestTrip ?? "-",
                                                  style: listSubTitleTextStyle,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    action: [
                                      CustomIconButton(
                                        title: "View".tr,
                                        iconData: IconlyBold.show,
                                        onPressed: () {
                                          Get.to(
                                              () =>
                                                  const CashAdvanceTravelDetailScreen(),
                                              arguments: {"item": item});
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
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
