import 'package:collection/collection.dart';
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
import 'package:gais/reusable/indicator/custom_indicator.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/actualization_trip/add/select_request_trip_screen.dart';
import 'package:gais/screen/tms/actualization_trip/detail/actualization_trip_detail_screen.dart';
import 'package:gais/screen/tms/actualization_trip/list/actualization_trip_list_controller.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ActualizationTripListScreen extends StatelessWidget {
  const ActualizationTripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ActualizationTripListController controller =
        Get.put(ActualizationTripListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Actualization Trip".tr, style: appTitle),
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
                            ? controller.selectedStatusTemp.value?.code
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
                          if (DateUtils.isSameDay(
                              controller.startDateTemp.value,
                              controller.endDateTemp.value)) {
                            controller.endDateTemp.value = null;
                          }
                          showCustomCalendarPicker(
                            context,
                            dismissible: true,
                            minimumDate: DateTime.now()
                                .subtract(const Duration(days: 365)),
                            maximumDate:
                                DateTime.now().add(const Duration(days: 365)),
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
                              if (controller.startDateTemp.value != null) {
                                controller.endDateTemp.value ??=
                                    controller.startDateTemp.value;
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
                if (controller.isLoading.value) {
                  return const CustomIndicator();
                }
                return controller.listHeader.isEmpty
                    ? const DataEmpty()
                    : ListView(
                        children: [
                          ...controller.listHeader.mapIndexed((index, item) {
                            bool isOpen = false;
                            return StatefulBuilder(
                                builder: (context, setState){
                                  return CommonListItem(
                                    number:
                                    "${((controller.currentPage.value - 1) * controller.limit) + (index + 1)}",
                                    title: "${item.noAct}",
                                    subtitle:
                                    "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd HH:mm:ss", targetFormat: "dd/MM/yyyy HH:mm:ss")}",
                                    content: GestureDetector(
                                      behavior: HitTestBehavior.translucent,
                                      onTap: () {
                                        setState(() {
                                          isOpen = !isOpen;
                                        });
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 8, vertical: 8),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                              children: [
                                                Flexible(
                                                  flex: 1,
                                                  child: Column(
                                                    children: [
                                                      Text(
                                                        "Created By".tr,
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
                                                        "Days of Trip".tr,
                                                        style: listTitleTextStyle,
                                                      ),
                                                      Text(
                                                        "${item.daysOfTrip ?? "-"}",
                                                        style: listSubTitleTextStyle,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            isOpen
                                                ? Container(
                                              width: double.infinity,
                                              margin: EdgeInsets.only(top: 16),
                                              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                                              color : neutralColor,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text("Request Trip"),
                                                  if(item.noRequestTrip != null)
                                                    ...item.noRequestTrip!.map((element) =>
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .symmetric(vertical: 4),
                                                          child: Text("${element}",
                                                            style: titleTextStyle.copyWith(
                                                                fontSize: 14
                                                            ),
                                                          ),
                                                        )).toList()
                                                ],
                                              ),
                                            )
                                                : const SizedBox()
                                          ],
                                        ),
                                      ),
                                    ),
                                    action: [
                                      CustomIconButton(
                                        title: item.codeStatusDoc == ActualizationTripEnum.reject ? "Edit".tr : "View".tr,
                                        iconData: item.codeStatusDoc == ActualizationTripEnum.reject ? IconlyBold.edit : IconlyBold.show,
                                        backgroundColor: successColor,
                                        onPressed: () async {
                                          Get.to(
                                            () => const ActualizationTripDetailScreen(), arguments: {
                                              "item": item
                                             }
                                         )?.then((value) =>
                                            controller.getHeader()
                                          );
                                        },
                                      ),
                                    ],
                                    status: item.status,
                                  );
                                },
                              );
                          })
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
          Get.to(() => const SelectRequestTripScreen())
              ?.then((value) => controller.getHeader());
        },
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
