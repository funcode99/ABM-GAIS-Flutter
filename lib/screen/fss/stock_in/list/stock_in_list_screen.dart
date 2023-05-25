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
              onChanged: (string) {},
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
                          child: Text("Warehouse".tr),
                        ),
                        const DropdownMenuItem(
                          value: "Warehouse A",
                          child: Text("Warehouse A"),
                        ),
                        const DropdownMenuItem(
                          value: "Warehouse B",
                          child: Text("Warehouse B"),
                        ),
                      ],
                      onChanged: (value) {
                        controller.tempSelectedValue = value!;
                      },
                      label: "Warehouse".tr,
                      value: controller.selectedValue,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CustomTextFormField(
                        readOnly: true,
                        controller: controller.dateRange,
                        suffixIcon: const Icon(
                            Icons.calendar_month),
                        onTap: (){
                          showCustomDateRangePicker(
                            context,
                            dismissible: true,
                            minimumDate: DateTime.now().subtract(const Duration(days: 365)),
                            maximumDate: DateTime.now().add(const Duration(days: 365)),
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
                  ],
                ));
              },
            ),
            CustomPagination(
              onPageChanged: (int) {},
              pageTotal: 5,
              margin: EdgeInsets.zero,
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...controller.listItem.mapIndexed((index, element) =>
                          CommonListItem(
                              number: "${index+1}",
                              subtitle: element.id,
                              title: element.itemName,
                              content: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Warehouse".tr,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                          "${element.warehouse}",
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
                                          "${index + 10}",
                                          style: listSubTitleTextStyle,
                                        ),
                                      ],
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
                                      onDeletePressed: (){
                                        Get.back();
                                      },
                                    ));
                                  },
                                )
                              ]))
                    ],
                  ),
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successColor,
        onPressed: () => Get.to(const AddStockInATKScreen()),
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
