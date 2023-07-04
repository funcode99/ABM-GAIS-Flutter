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
import 'package:gais/screen/fss/request_atk/add/add_request_atk_screen.dart';
import 'package:gais/screen/fss/request_atk/detail/detail_request_atk_screen.dart';
import 'package:gais/screen/fss/request_atk/list/request_atk_list_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
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
                        items: controller.listStatus
                            .map((e) => DropdownMenuItem(
                                  value: e.code.toString(),
                                  child: Text("${e.status}"),
                                ))
                            .toList(),
                        onChanged: (item) {
                          controller.onChangeSelectedStatus(item.toString());
                        },
                        label: "Status".tr,
                        value: controller.selectedStatusTemp.value != null
                            ? controller.selectedStatusTemp.value?.code.toString()
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
                  if(page != controller.currentPage.value){
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
                                  Get.to(() => const RequestATKDetailScreen(),
                                      arguments: {"item": item});
                                },
                                number: "${((controller.currentPage.value - 1) * controller.limit) + (index + 1)}",
                                title: "${item.noAtkRequest}",
                                subtitle: "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy")}",
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Flexible(
                                        flex: 1,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Requestor".tr,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              "${item.employeeName}",
                                              style: listSubTitleTextStyle,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Flexible(
                                        flex: 1,
                                        child: Column(
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
                                      ),
                                    ],
                                  ),
                                ),
                                action: item.codeStatusDoc == 0
                                    ? [
                                        CustomIconButton(
                                          title: "Edit".tr,
                                          iconData: IconlyBold.edit,
                                          backgroundColor: successColor,
                                          onPressed: () async {
                                            Get.to(
                                                () =>
                                                    const RequestATKDetailScreen(),
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
                                                controller.deleteHeader(item);
                                                Get.back();
                                              },
                                            ));
                                          },
                                        )
                                      ]
                                    : [],
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
        onPressed: ()async{
          Get.to(() => const AddRequestATKScreen())
              ?.then((value) => controller.getHeader());
        },
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
