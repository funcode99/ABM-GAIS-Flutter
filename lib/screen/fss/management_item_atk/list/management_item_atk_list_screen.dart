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
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_item_atk/add/add_management_item_atk_screen.dart';
import 'package:gais/screen/fss/management_item_atk/list/management_item_atk_list_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ManagementItemATKListScreen extends StatelessWidget {
  const ManagementItemATKListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final ManagementItemATKListController controller = Get.put(ManagementItemATKListController());

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
                          total: "${element.alertQuantity + 100}",
                          content: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Brand".tr,
                                      style: listTitleTextStyle,
                                    ),
                                    Text(
                                      "Pilot",
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
                                      "Warehouse A",
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
                                      "20",
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
                                      "Pcs",
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
                              onPressed: () {
                                // Get.to(const AddItemCashAdvanceNonTravelScreen());
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
        onPressed: () => Get.to(const AddManagementItemATKScreen()),
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
