import 'package:collection/collection.dart';
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
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/add/add_booking_meeting_room_screen.dart';
import 'package:gais/screen/fss/booking_meeting_room/list/booking_meeting_room_list_controller.dart';
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
              onChanged: (string) {},
              onClearFilter: (){

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
            CustomPagination(
              onPageChanged: (int) {},
              pageTotal: 5,
              margin: EdgeInsets.zero,
              colorSub: whiteColor,
              colorPrimary: infoColor,
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
                child: ListView(
                  children: [
                    ...controller.listItem.mapIndexed((index, element) =>
                        CommonListItem(
                            number: "${index+1}",
                            subtitle: "${element.startDate}-${element.endDate}",
                            title: element.title,
                            total: element.roomName,
                            status: element.status,
                            content: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: [
                                        Text(
                                          "Brand".tr,
                                          textAlign: TextAlign.center,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                          "Pilot",
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
                                          "Warehouse".tr,
                                          textAlign: TextAlign.center,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                          "Warehouse A",
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
                                          "Alert Quantity".tr,
                                          textAlign: TextAlign.center,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                          "20",
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
                                          "UOM".tr,
                                          textAlign: TextAlign.center,
                                          style: listTitleTextStyle,
                                        ),
                                        Text(
                                          "Pcs",
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
                            action: [
                              CustomIconButton(
                                title: "Edit".tr,
                                iconData: IconlyBold.edit,
                                backgroundColor: successColor,
                                onPressed: () {

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
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: successColor,
        onPressed: () => Get.to(()=>const AddBookingMeetingRoomScreen()),
        child: const Icon(Icons.add_rounded, size: 45),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
