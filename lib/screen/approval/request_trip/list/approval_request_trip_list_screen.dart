import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/calendar/custom_calendar_picker.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/indicator/custom_indicator.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/screen/approval/request_trip/list/approval_request_trip_list_controller.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class ApprovalRequestTripListScreen extends StatelessWidget {
  const ApprovalRequestTripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApprovalRequestTripListController controller =
    Get.put(ApprovalRequestTripListController());

    return Padding(
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
                  Obx(() {
                    return CustomDropDownField(
                      label: "Purpose of Trip",
                      items: controller.documentList
                          .map((e) =>
                          DropdownMenuItem(
                            value: e.codeDocument,
                            child: Text(e.documentName.toString()),
                          ))
                          .toSet()
                          .toList(),
                      value: controller.purposeValueTemp.value,
                      onChanged: (value) {
                        controller.purposeValueTemp.value = value.toString();
                      },
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
                        if (DateUtils.isSameDay(controller.startDateTemp.value,
                            controller.endDateTemp.value)) {
                          controller.endDateTemp.value = null;
                        }

                        showCustomCalendarPicker(
                          context,
                          isRange: false,
                          dismissible: true,
                          minimumDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
                          maximumDate:
                          DateTime.now().add(const Duration(days: 365)),
                          endDate: controller.endDateTemp.value,
                          startDate: controller.startDateTemp.value,
                          backgroundColor: Colors.white,
                          primaryColor: Colors.green,
                          onApplyClick: (start, end) {
                            controller.endDateTemp.value = end ?? start;
                            controller.startDateTemp.value = start;
                            controller.dateRangeController.text =
                            "${controller.dateFormat.format(
                                controller.startDateTemp.value!)} - ${controller
                                .dateFormat.format(
                                controller.endDateTemp.value!)}";
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
              key: UniqueKey(),
              onPageChanged: (page) {
                if (page != controller.currentPage.value) {
                  controller.getHeader(page: page);
                }
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
                  if (controller.isLoading.value) {
                    return const CustomIndicator();
                  }
                  return controller.listHeader.isEmpty
                      ? const DataEmpty()
                      : ListView(
                    children: [
                      ...controller.listHeader.mapIndexed((index, item) =>
                          CommonListItem(
                            onTap: () {
                              /*Get.to(
                                      () =>
                                  const ApprovalRequestTripDetailScreen(
                                    approvalActionEnum:
                                    ApprovalActionEnum.none,
                                  ),
                                  arguments: {
                                    "item": item
                                  })?.then(
                                      (value) => controller.getHeader());*/
                            },
                            number:
                            "${((controller.currentPage.value - 1) *
                                controller.limit) + (index + 1)}",
                            title: item.noRequestTrip ?? "-",
                            subtitle:
                            "${item.createdAt?.toDateFormat(
                                originFormat: "yyyy-MM-dd HH:mm:ss",
                                targetFormat: "dd/MM/yyyy HH:mm:ss")}",
                            total: item.documentName ?? "-",
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
                                        Text("${item.employeeName ?? "-"}",
                                            style: listSubTitleTextStyle
                                                .copyWith(
                                                overflow: TextOverflow
                                                    .ellipsis)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            action: item.codeStatusDoc ==
                                RequestTripEnum
                                    .waitingApproval.value
                                ? [
                              CustomIconButton(
                                title: "Approve".tr,
                                iconData: Icons.check,
                                backgroundColor: successColor,
                                onPressed: () {
                                  /*Get.to(
                                          () =>
                                      const ApprovalRequestTripDetailScreen(
                                        approvalActionEnum:
                                        ApprovalActionEnum
                                            .approve,
                                      ),
                                      arguments: {
                                        "item": item
                                      })?.then((value) =>
                                      controller.getHeader());*/
                                },
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              CustomIconButton(
                                title: "Reject".tr,
                                iconData: Icons.close,
                                backgroundColor: redColor,
                                onPressed: () {
                                  /*Get.to(
                                          () =>
                                      const ApprovalRequestTripDetailScreen(
                                        approvalActionEnum:
                                        ApprovalActionEnum
                                            .reject,
                                      ),
                                      arguments: {
                                        "item": item
                                      })?.then((value) =>
                                      controller.getHeader());*/
                                },
                              )
                            ]
                                : [],
                            status: item.status,
                          ))
                    ],
                  );
                }),
              )),
        ],
      ),
    );
  }
}
