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
import 'package:gais/screen/fss/booking_meeting_room/add/add_booking_meeting_room_screen.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_screen.dart';
import 'package:gais/screen/fss/booking_meeting_room/list/booking_meeting_room_list_controller.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class BookingMeetingRoomListScreen extends StatelessWidget {
  const BookingMeetingRoomListScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final BookingMeetingRoomListController controller = Get.put(BookingMeetingRoomListController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Booking Meeting Room".tr, style: appTitle),
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
              onClearFilter: (){
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
                        items: controller.listMeetingRoom
                            .map((e) => DropdownMenuItem(
                          value: e.id.toString(),
                          child: Text("${e.nameMeetingRoom}"),
                        ))
                            .toList(),
                        onChanged: (id) {
                          controller.onChangeSelectedMeetingRoom(id.toString());
                        },
                        label: "Room".tr,
                        value: controller.selectedMeetingRoomTemp.value != null
                            ? controller.selectedMeetingRoomTemp.value?.id.toString()
                            : "",
                      );
                    }),
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
                          if(DateUtils.isSameDay(controller.startDateTemp.value, controller.endDateTemp.value)){
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
                                onTap: item.codeStatusDoc == BookingMeetingRoomEnum.draft.value ? null : (){
                                  Get.to(()=> const DetailBookingMeetingRoomScreen(), arguments: {
                                    "item": item
                                  })?.then((value) => controller.getHeader());
                                },
                                number: "${((controller.currentPage.value - 1) * controller.limit) + (index + 1)}",
                                subtitle: "${item.createdAt?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy")}",
                                title: item.noBookingMeeting,
                                total: item.nameMeetingRoom,
                                status: item.status,
                                content: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: [
                                            Text(
                                              "Title".tr,
                                              textAlign: TextAlign.center,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              item.title ?? "-",
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
                                              "Requestor".tr,
                                              textAlign: TextAlign.center,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              item.employeeName ?? "-",
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
                                              "Date".tr,
                                              textAlign: TextAlign.center,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              "${item.startDate?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yy")}",
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
                                              "Time".tr,
                                              textAlign: TextAlign.center,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              "${item.startTime?.toDateFormat(originFormat: "HH:mm:ss", targetFormat: "HH:mm")} - ${item.endTime?.toDateFormat(originFormat: "HH:mm:ss", targetFormat: "HH:mm")}",
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
                                action: item.codeStatusDoc == BookingMeetingRoomEnum.draft.value ? [
                                  CustomIconButton(
                                    title: "Edit".tr,
                                    iconData: IconlyBold.edit,
                                    backgroundColor: successColor,
                                    onPressed: () {
                                      Get.to(
                                              () =>
                                          const DetailBookingMeetingRoomScreen(),
                                          arguments: {
                                            "item": item
                                          })?.then((value) =>
                                          controller.getHeader());
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
                                          Get.close(1);
                                          controller.deleteHeader(item);
                                        },
                                      ));
                                    },
                                  )
                                ] : []))
                      ],
                    );
                  }),
                )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successColor,
        onPressed: () => Get.to(()=>const AddBookingMeetingRoomScreen())?.then((value) => controller.getHeader()),
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
