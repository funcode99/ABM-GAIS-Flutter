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
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/stock_in/add/add_stock_in_screen.dart';
import 'package:gais/screen/fss/stock_in/edit/edit_stock_in_screen.dart';
import 'package:gais/screen/fss/stock_in/list/stock_in_list_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class StockInListScreen extends StatelessWidget {
  const StockInListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StockInListController controller = Get.put(StockInListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Stock In ATK".tr, style: appTitle),
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
                  onResetFilter: () {
                    controller.resetFilter();
                  },
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    Obx(() {
                      return CustomDropDownFormField(
                        items: controller.listWarehouse
                            .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text("${e.warehouseName}"),
                                ))
                            .toList(),
                        onChanged: (item) {
                          controller.onChangeSelectedWarehouse(item.toString());
                        },
                        label: "Warehouse".tr,
                        value: controller.selectedWarehouseTemp.value != null
                            ? controller.selectedWarehouseTemp.value?.id
                                .toString()
                            : "",
                      );
                    }),
                    const SizedBox(
                      height: 8,
                    ),
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
                              controller.endDateTemp.value = end;
                              controller.startDateTemp.value = start;
                              controller.dateRangeController.text =
                                  "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                              controller.update();
                            },
                            onCancelClick: () {},
                          );
                        },
                        label: "Date Range".tr),
                  ],
                ));
              },
            ),
            Obx(() {
              if (controller.listHeader.isEmpty) {
                return const SizedBox();
              }

              return CustomPagination(
                colorSub: whiteColor,
                colorPrimary: infoColor,
                key: UniqueKey(),
                onPageChanged: (page) {
                  if (page != controller.currentPage.value) {
                    controller.getHeader(page: page);
                  }
                },
                pageTotal: controller.totalPage.value,
                margin: EdgeInsets.zero,
                pageInit: controller.currentPage.value,
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
                                  number: "${((controller.currentPage.value - 1) * 10) + (index + 1)}",
                                  subtitle: "${item.id}",
                                  title: item.noStockIn,
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Warehouse".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                item.warehouseName ?? "-",
                                                style: listSubTitleTextStyle.copyWith(
                                                  overflow: TextOverflow.ellipsis
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "Item Count".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                "${index + 10}",
                                                style: listSubTitleTextStyle.copyWith(
                                                  overflow: TextOverflow.ellipsis
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  status: "Status",
                                  action: [
                                    CustomIconButton(
                                      title: "Edit".tr,
                                      iconData: IconlyBold.edit,
                                      backgroundColor: successColor,
                                      onPressed: () {
                                        Get.to(const EditStockInScreen());
                                      },
                                    ),
                                    const SizedBox(
                                      width: 8,
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
                                  ]))
                        ],
                      );
              }),
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successColor,
        onPressed: () async {
          Get.to(() => const AddStockInATKScreen())
              ?.then((value) => controller.getHeader());
        },
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
