import 'package:collection/collection.dart';
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
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_item_atk/add/add_management_item_atk_screen.dart';
import 'package:gais/screen/fss/management_item_atk/edit/edit_management_item_atk_controller.dart';
import 'package:gais/screen/fss/management_item_atk/edit/edit_management_item_atk_screen.dart';
import 'package:gais/screen/fss/management_item_atk/list/management_item_atk_list_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ManagementItemATKListScreen extends StatelessWidget {
  const ManagementItemATKListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ManagementItemATKListController controller =
        Get.put(ManagementItemATKListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: whiteColor,
        title: Text("Management Item ATK".tr, style: appTitle),
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
                          child: Text("Item".tr),
                        ),
                        const DropdownMenuItem(
                          value: "Pen",
                          child: Text("Pen"),
                        ),
                        const DropdownMenuItem(
                          value: "Book",
                          child: Text("Book"),
                        ),
                      ],
                      onChanged: (value) {
                        controller.tempSelectedValue = value!;
                      },
                      label: "Item".tr,
                      value: controller.selectedValue,
                    ),
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
                              .mapIndexed((index, item) => CommonListItem(
                                      number: "${index + 1}",
                                      subtitle: "${item.codeItem}",
                                      title: item.itemName,
                                      total: "${item.currentStock}",
                                      content: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            Column(
                                              children: [
                                                Text(
                                                  "Brand".tr,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  "${item.brandName}",
                                                  style: listSubTitleTextStyle,
                                                ),
                                              ],
                                            ),
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
                                                  "Alert Quantity".tr,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  "${item.alertQty}",
                                                  style: listSubTitleTextStyle,
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "UOM".tr,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  "${item.uomName}",
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
                                            final result = await Get.to(() =>
                                                EditManagementItemATKScreen(
                                                    item: item));
                                            if (result) {
                                              controller.getHeader();
                                            }
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
                                                controller.deleteHeader(item);
                                                Get.back();
                                              },
                                            ));
                                          },
                                        )
                                      ]))
                        ],
                      );
              }),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successColor,
        onPressed: () async {
          final result = await Get.to(() => const AddManagementItemATKScreen());
          if (result) {
            controller.getHeader();
          }
        },
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
