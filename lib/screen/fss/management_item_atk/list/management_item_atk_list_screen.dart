import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/management_item_atk/detail_stock_management_item_atk_model.dart';
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
import 'package:gais/reusable/indicator/custom_indicator.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_item_atk/add/add_management_item_atk_screen.dart';
import 'package:gais/screen/fss/management_item_atk/edit/edit_management_item_atk_screen.dart';
import 'package:gais/screen/fss/management_item_atk/list/management_item_atk_list_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ManagementItemATKListScreen extends StatefulWidget {
  const ManagementItemATKListScreen({Key? key}) : super(key: key);

  @override
  State<ManagementItemATKListScreen> createState() =>
      _ManagementItemATKListScreenState();
}

class _ManagementItemATKListScreenState
    extends State<ManagementItemATKListScreen> {
  @override
  Widget build(BuildContext context) {
    final ManagementItemATKListController controller =
    Get.put(ManagementItemATKListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
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
                          if (controller.enableSelectCompany.value) {
                            return CustomDropDownFormField(
                              items: controller.listCompany
                                  .map((e) =>
                                  DropdownMenuItem(
                                    value: e.id.toString(),
                                    child: Text("${e.companyName}"),
                                  ))
                                  .toList(),
                              onChanged: (item) {
                                controller
                                    .onChangeSelectedCompany(item.toString());
                              },
                              label: "Company".tr,
                              value:
                              controller.selectedCompanyTemp.value != null
                                  ? controller.selectedCompanyTemp.value?.id
                                  .toString()
                                  : "",
                            );
                          } else {
                            return CustomTextFormField(
                              controller:
                              controller.companyTextEditingController,
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
                          if (controller.enableSelectSite.value) {
                            return CustomDropDownFormField(
                              items: controller.listSiteFiltered
                                  .map((e) =>
                                  DropdownMenuItem(
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
                          }
                          return CustomTextFormField(
                            controller:
                            controller.siteTextEditingController,
                            label: "Site",
                            readOnly: true,
                          );
                        }),
                        const SizedBox(
                          height: 8,
                        ),
                        Obx(() {
                          return CustomDropDownFormField(
                            items: controller.listWarehouseFiltered
                                .map((e) =>
                                DropdownMenuItem(
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
                        Obx(() {
                          return CustomDropDownFormField(
                            items: controller.listItem
                                .map((e) =>
                                DropdownMenuItem(
                                  value:
                                  e.id != null ? e.id.toString() : "",
                                  child: Text("${e.itemName}"),
                                ))
                                .toList(),
                            onChanged: (item) {
                              controller.onChangeSelectedItem(item.toString());
                            },
                            label: "Item".tr,
                            value: controller.selectedItemTemp.value?.id != null
                                ? controller.selectedItemTemp.value?.id
                                .toString()
                                : "",
                          );
                        }),
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
                    if(controller.isLoading.value){
                      return const CustomIndicator();
                    }
                    return controller.listHeader.isEmpty
                        ? const DataEmpty()
                        : ListView(
                      children: [
                        ...controller.listHeader.mapIndexed((index, item) {
                          bool isOpen = false;
                          return StatefulBuilder(
                            builder: (context, setState) {
                              return CommonListItem(
                                  number:
                                  "${((controller.currentPage.value - 1) *
                                      controller.limit) + (index + 1)}",
                                  subtitle: "${item.codeItem}",
                                  title: item.itemName,
                                  isEllipsis: false,
                                  total: "Real Stock\n${item.totalStock ?? "-"}",
                                  content: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            isOpen = !isOpen;
                                          });
                                        },
                                        behavior: HitTestBehavior.translucent,
                                        child: Wrap(
                                          spacing: 16,
                                          runSpacing: 8,
                                          children: [
                                            /*Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Brand".tr,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: listTitleTextStyle,
                                                    ),
                                                    Text(
                                                      item.brandName ?? "-",
                                                      style: listSubTitleTextStyle
                                                          .copyWith(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                    ),
                                                  ],
                                                ),
                                              ),*/
                                            Column(
                                              children: [
                                                Text(
                                                  "Warehouse".tr,
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  item.warehouseCount
                                                      .toString() ??
                                                      "-",
                                                  style: listSubTitleTextStyle
                                                      .copyWith(
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Alert Quantity".tr,
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  "${item.alertQty}",
                                                  style: listSubTitleTextStyle
                                                      .copyWith(
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "UOM".tr,
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  item.uomName ?? "-",
                                                  style: listSubTitleTextStyle
                                                      .copyWith(
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis),
                                                ),
                                              ],
                                            ),
                                            Column(
                                              children: [
                                                Text(
                                                  "Stock Available\nto Request".tr,
                                                  textAlign:
                                                  TextAlign.center,
                                                  style: listTitleTextStyle,
                                                ),
                                                Text(
                                                  "${item.stockToBooked ?? "-"}",
                                                  style: listSubTitleTextStyle
                                                      .copyWith(
                                                      overflow:
                                                      TextOverflow
                                                          .ellipsis),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      isOpen
                                          ? Container(
                                        padding: const EdgeInsets.symmetric(vertical: 16),
                                        color : neutralColor,
                                            child: Column(
                                        children: controller
                                              .getDetailStockManagementItemATKModel(
                                              item).mapIndexed((index, element) =>
                                              Padding(
                                                padding: const EdgeInsets
                                                    .symmetric(vertical: 4),
                                                child: Column(
                                                  children: [
                                                    Text("${element
                                                        .warehouseName}",
                                                      style: titleTextStyle.copyWith(
                                                        fontSize: 14
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 8,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Column(
                                                          children: [
                                                            const Text("Real\nStock",
                                                            textAlign: TextAlign.center,),
                                                            Text("${element
                                                                .currentStock ?? "-"}")
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text("Booked\nStock",
                                                            textAlign: TextAlign.center,),
                                                            Text("${element
                                                                .bookedStockWh ?? "-"}")
                                                          ],
                                                        ),
                                                        const SizedBox(
                                                          width: 8,
                                                        ),
                                                        Column(
                                                          children: [
                                                            const Text("Stock Available\nto Approve",
                                                            textAlign: TextAlign.center,),
                                                            Text("${element
                                                                .stockToApproveWh ?? "-"}")
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )).toList(),
                                      ),
                                          )
                                          : const SizedBox()
                                    ],
                                  ),
                                  action: [
                                    Obx(() {
                                      if (controller.isEmployee.value) {
                                        return const SizedBox();
                                      }
                                      return CustomIconButton(
                                        title: "Edit".tr,
                                        iconData: IconlyBold.edit,
                                        backgroundColor: successColor,
                                        onPressed: () async {
                                          final result = await Get.to(() =>
                                              EditManagementItemATKScreen(
                                                  item: item));
                                          if (result != null) {
                                            controller.getHeader();
                                          }
                                        },
                                      );
                                    }),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Obx(() {
                                      if(controller.isEmployee.value){
                                        return const SizedBox();
                                      }
                                      return CustomIconButton(
                                        title: "Delete".tr,
                                        iconData: IconlyBold.delete,
                                        backgroundColor: redColor,
                                        onPressed: () {
                                          Get.dialog(DeleteConfirmationDialog(
                                            onDeletePressed: () {
                                              Get.close(1);
                                              controller.deleteHeader(item);
                                            },
                                          ));
                                        },
                                      );
                                    })
                                  ]);
                            },
                          );
                        })
                      ],
                    );
                  }),
                )),
          ],
        ),
      ),
      floatingActionButton: Obx(() {
        if (controller.isEmployee.value) {
          return const SizedBox();
        }
        return FloatingActionButton(
          backgroundColor: successColor,
          onPressed: () async {
            final result = await Get
                .to(() => const AddManagementItemATKScreen());
            if (result) {
              controller.getHeader();
            }
          },
          child: const Icon(Icons.add_rounded, size: 45),
        );
      }),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
