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
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/error/empty_list_error.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/request_atk/add/add_request_atk_screen.dart';
import 'package:gais/screen/fss/request_atk/detail/detail_request_atk_screen.dart';
import 'package:gais/screen/fss/request_atk/list/request_atk_list_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class RequestATKListScreen extends StatefulWidget {
  const RequestATKListScreen({Key? key}) : super(key: key);

  @override
  State<RequestATKListScreen> createState() => _RequestATKListScreenState();
}

class _RequestATKListScreenState extends State<RequestATKListScreen> {

  @override
  Widget build(BuildContext context) {
    final RequestATKListController controller =
    Get.put(RequestATKListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("ATK Request".tr, style: appTitle),
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
                controller.getHeader();
              },
              onPressedFilter: () {
                Get.bottomSheet(FilterBottomSheet(
                  onApplyFilter: () {
                    controller.applyFilter();
                    Get.back();
                  },
                  children: [
                    const SizedBox(
                      height: 8,
                    ),
                    CustomDropDownFormField(
                      items: [
                        DropdownMenuItem(
                          value: "",
                          child: Text("Status".tr),
                        ),
                        const DropdownMenuItem(
                          value: "Completed",
                          child: Text("Completed"),
                        ),
                        const DropdownMenuItem(
                          value: "Pending",
                          child: Text("Pending"),
                        ),
                      ],
                      onChanged: (value) {
                        controller.tempSelectedValue = value!;
                      },
                      label: "Status".tr,
                      value: controller.selectedValue,
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
                              "${controller.dateFormat.format(
                                  start)} - ${controller.dateFormat.format(
                                  end)}";
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
            Obx(() {
              return CustomPagination(
                key: UniqueKey(),
                onPageChanged: (page) {
                  controller.getHeader(page: page);
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
                        ? const EmptyListError()
                        : ListView(
                      children: [
                        ...controller.listHeader
                            .mapIndexed((index, item) =>
                            CommonListItem(
                              onTap: () {
                                Get.to(() => const RequestATKDetailScreen());
                              },
                              number: "${index+1}",
                              title: "${item.noAtkRequest}",
                              subtitle: "${item.employeeName}",
                              content: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Warehouse".tr,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                          "${item.warehouseName}",
                                          style: listSubTitleTextStyle,
                                        ),
                                      ],
                                    ),
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
                                    )
                                  ],
                                ),
                              ),
                              action: [
                                CustomIconButton(
                                  backgroundColor: redColor,
                                  title: "Delete".tr,
                                  iconData: IconlyBold.delete,
                                  onPressed: () {
                                    Get.dialog(DeleteConfirmationDialog(
                                      onDeletePressed: () {
                                        controller.deleteHeader(item);
                                        Get.back();
                                      },
                                    ));
                                  },
                                )
                              ],
                              status: "${item.status}",
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
        onPressed: () => Get.to(const AddRequestATKScreen()),
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
