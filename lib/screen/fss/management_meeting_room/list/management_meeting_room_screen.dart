import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/indicator/custom_indicator.dart';
import 'package:gais/reusable/loadingdialog.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_meeting_room/add/add_room_info_screen.dart';
import 'package:gais/screen/fss/management_meeting_room/list/management_meeting_room_controller.dart';
import 'package:get/get.dart';

class ManagementMeetingRoomScreen extends StatelessWidget {
  const ManagementMeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ManagementMeetingRoomController>(
        init: ManagementMeetingRoomController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Management\nMeeting Room", style: appTitle,
                  textAlign: TextAlign.center),
              leading: const CustomBackButton(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.fetchList(1);
                  controller.update();
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: controller.meetingRoomList.isEmpty || controller.isLoading
                            ? Get.height
                            : 180,
                        // minHeight: 180,
                        maxHeight: 32,
                        child: Container(
                          color: baseColor,
                          child: Column(
                            children: [
                              CustomSearchBar(
                                onSubmit: (value) {
                                  controller.searchValue = value;
                                  controller.fetchList(1);
                                },
                                onClearFilter: () {
                                  controller.applySearch("");
                                },
                                onPressedFilter: () {
                                  controller.openFilter();
                                  Get.bottomSheet(
                                    FilterBottomSheet(
                                      onApplyFilter: () {
                                        controller.applyFilter();
                                        Get.back();
                                      },
                                      onResetFilter: () {
                                        controller.resetFilter();
                                      },
                                      children: [
                                        Text("Filter", style: appTitle.copyWith(
                                            fontSize: 25)),
                                        const SizedBox(height: 10),
                                        Column(
                                          children: [
                                            CustomTextFormField(
                                              controller: controller
                                                  .capacityController,
                                              label: "Capacity",
                                              readOnly: false,
                                              onChanged: (value) {
                                                controller.filterCapacity =
                                                    value.toString();
                                                controller.update();
                                              },
                                              inputFormatters: [
                                                FilteringTextInputFormatter.digitsOnly,
                                              ],
                                              inputType: TextInputType.number,
                                            ),
                                            const SizedBox(height: 8),
                                            GetBuilder<ManagementMeetingRoomController>(
                                                builder: (controller2) {
                                                  return CustomDropDownFormField(
                                                    label: "Status",
                                                    hintText: "Status",
                                                    value: controller2
                                                        .filterStatusTemp,
                                                    items: controller2.statusList
                                                        .map((e) =>
                                                        DropdownMenuItem(
                                                          value: e,
                                                          child: Text(e.isEmpty
                                                              ? "Status"
                                                              : e),
                                                        ))
                                                        .toSet()
                                                        .toList(),
                                                    onChanged: (value) {
                                                      controller2.filterStatusTemp = value.toString();
                                                      controller2.update();
                                                    },
                                                  );
                                                }),
                                            const SizedBox(height: 8),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                              controller.meetingRoomList.isEmpty ? SizedBox() :
                              CustomPagination(
                                colorSub: whiteColor,
                                colorPrimary: infoColor,
                                onPageChanged: (int pageNumber) {
                                  controller.currentPage = pageNumber;
                                  controller.fetchList(pageNumber);
                                  controller.update();
                                },
                                pageTotal: controller.totalPage,
                                // pageTotal: 5,
                                pageInit: controller.currentPage,
                              ),
                              Expanded(
                                child: controller.isLoading
                                    ? const CustomIndicator()
                                    : controller.meetingRoomList.isEmpty
                                    ? const DataEmpty()
                                    : Container()
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return SizedBox(
                            child: Column(
                              children: [
                                CustomTripCard(
                                  listNumber:
                                  controller.currentPage > 1 ? (controller
                                      .meetingRoomModel?.data?.from?.toInt() ??
                                      0) + index : (index + 1),
                                  // listNumber: (index + 1),
                                  title: controller.meetingRoomList[index]
                                      .nameMeetingRoom.toString(),
                                  status: controller.meetingRoomList[index]
                                      .availableStatus,
                                  subtitle: controller.meetingRoomList[index]
                                      .codeMeetingRoom,
                                  isEdit: true,
                                  editAction: () =>
                                      Get.to(
                                        const AddRoomInfoScreen(),
                                        arguments: {
                                          'id': controller
                                              .meetingRoomList[index].id
                                              ?.toInt(),
                                          'isEdit': true
                                        },
                                      )?.then((value) {
                                        controller.fetchList(
                                            controller.currentPage);
                                        controller.update();
                                      }),
                                  isDelete: true,
                                  deleteAction: () {
                                    Get.dialog(DeleteConfirmationDialog(
                                      onDeletePressed: () {
                                        Get.close(1);
                                        controller.deleteData(
                                            controller.meetingRoomList[index].id!
                                                .toInt());
                                      },
                                    ));
                                  },
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment
                                        .spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text("Capacity",
                                              style: listTitleTextStyle),
                                          Text(controller.meetingRoomList[index]
                                              .capacity.toString(),
                                              style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text("Floor",
                                              style: listTitleTextStyle),
                                          Text(controller.meetingRoomList[index]
                                              .floor.toString(),
                                              style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text("Company",
                                              style: listTitleTextStyle),
                                          Text(controller.meetingRoomList[index]
                                              .companyName.toString(),
                                              style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text("Site",
                                              style: listTitleTextStyle),
                                          Text(controller.meetingRoomList[index]
                                              .siteName.toString(),
                                              style: listSubTitleTextStyle)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                // if (controller.ddList.length == index + 1) const SizedBox(height: 100)
                              ],
                            ),
                          );
                        },
                        // childCount: !controller.dataisnull ? controller.ddList.length : 1,
                        childCount: controller.meetingRoomList.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add_rounded, size: 45),
              backgroundColor: successColor,
              onPressed: () =>
                  Get.to(const AddRoomInfoScreen(), arguments: {'isEdit': false})
                      ?.then((value) {
                    controller.fetchList(1);
                    controller.update();
                  }),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
