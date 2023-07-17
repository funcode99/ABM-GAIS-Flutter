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
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/stock_in/add/add_stock_in_screen.dart';
import 'package:gais/screen/fss/stock_in/detail/detail_stock_in_screen.dart';
import 'package:gais/screen/fss/stock_in/list/stock_in_list_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
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
                Get.bottomSheet(
                    enableDrag: true,
                    persistent: false,
                    isScrollControlled: true,
                    FilterBottomSheet(
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
                          if(controller.enableSelectCompany.value){
                            return CustomDropDownFormField(
                              items: controller.listCompany
                                  .map((e) => DropdownMenuItem(
                                value: e.id.toString(),
                                child: Text("${e.companyName}"),
                              ))
                                  .toList(),
                              onChanged: (item) {
                                controller
                                    .onChangeSelectedCompany(item.toString());
                              },
                              label: "Company".tr,
                              value: controller.selectedCompanyTemp.value != null
                                  ? controller.selectedCompanyTemp.value?.id
                                  .toString()
                                  : "",
                            );
                          }else{
                            return CustomTextFormField(
                              controller: controller.companyTextEditingController,
                              label: "Company",
                              readOnly: true,
                            );
                          }

                          return const SizedBox();
                        }),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(() {
                          return CustomDropDownFormField(
                            items: controller.listSiteFiltered
                                .map((e) => DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text("${e.siteName}"),
                                    ))
                                .toList(),
                            onChanged: (item) {
                              controller.onChangeSelectedSite(item.toString());
                            },
                            label: "Site".tr,
                            value: controller.selectedSiteTemp.value != null
                                ? controller.selectedSiteTemp.value?.id
                                    .toString()
                                : "",
                          );
                        }),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(() {
                          return CustomDropDownFormField(
                            items: controller.listWarehouseFiltered
                                .map((e) => DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text("${e.warehouseName}"),
                                    ))
                                .toList(),
                            onChanged: (item) {
                              controller
                                  .onChangeSelectedWarehouse(item.toString());
                            },
                            label: "Warehouse".tr,
                            value:
                                controller.selectedWarehouseTemp.value != null
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
                              if(DateUtils.isSameDay(controller.startDateTemp.value, controller.endDateTemp.value)){
                                controller.endDateTemp.value = null;
                              }
                              showCustomCalendarPicker(
                                context,
                                dismissible: true,
                                minimumDate: DateTime.now()
                                    .subtract(const Duration(days: 365)),
                                maximumDate: DateTime.now()
                                    .add(const Duration(days: 365)),
                                endDate: controller.endDateTemp.value,
                                startDate: controller.startDateTemp.value,
                                backgroundColor: Colors.white,
                                primaryColor: Colors.green,
                                isRange: false,
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
                                onTap: item.codeStatusDoc == 0 ? null : (){
                                  Get.to(() => const DetailStockInScreen(),
                                      arguments: {"item": item});
                                },
                                number:
                                    "${((controller.currentPage.value - 1) *  controller.limit) + (index + 1)}",
                                subtitle:
                                    "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss")}",
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
                                              "Created By".tr,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              item.employeeName ?? "-",
                                              style: listSubTitleTextStyle
                                                  .copyWith(
                                                      overflow: TextOverflow
                                                          .ellipsis),
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
                                              "${item.itemCount ?? "-"}",
                                              style: listSubTitleTextStyle
                                                  .copyWith(
                                                      overflow: TextOverflow
                                                          .ellipsis),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                status: item.status,
                                action: item.codeStatusDoc == 0
                                    ? [
                                        CustomIconButton(
                                          title: "Edit".tr,
                                          iconData: IconlyBold.edit,
                                          backgroundColor: successColor,
                                          onPressed: () async {
                                            Get.to(
                                                () =>
                                                    const DetailStockInScreen(),
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
                                          backgroundColor: redColor,
                                          title: "Delete".tr,
                                          iconData: IconlyBold.delete,
                                          onPressed: () {
                                            Get.dialog(DeleteConfirmationDialog(
                                              onDeletePressed: () {
                                                Get.close(1);
                                                controller.deleteHeader(item);
                                              },
                                            ));
                                          },
                                        )
                                      ]
                                    : [],
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
        onPressed: () async {
          Get.to(() => const AddStockInATKScreen())
              ?.then((value) => controller.getHeader());
        },
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
