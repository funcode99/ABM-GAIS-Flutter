import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
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
            appBar: TopBar(
              title: Text("Management\nMeeting Room", style: appTitle, textAlign: TextAlign.center),
              leading: CustomBackButton(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
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
                        minHeight: controller.dataisnull || controller.isLoading ? Get.height : 180,
                        // minHeight: 180,
                        maxHeight: 32,
                        child: Container(
                          color: baseColor,
                          child: Column(
                            children: [
                              CustomSearchBar(
                                onSubmit: (value) {
                                  controller.searchValue = value;
                                  controller.filterStatus = "-1";
                                  controller.fetchList(1);
                                },
                                onPressedFilter: () {
                                  Get.bottomSheet(
                                    StatefulBuilder(
                                      builder: (context, setState) {
                                        return FilterBottomSheet(
                                          onApplyFilter: () {
                                            controller.fetchList(1);
                                            controller.update();
                                            Get.back();
                                          },
                                          onResetFilter: () {
                                            setState(() {
                                              controller.resetFilter();
                                            });
                                          },
                                          children: [
                                            Text("Filter", style: appTitle.copyWith(fontSize: 25)),
                                            const SizedBox(height: 10),
                                            Form(
                                              key: controller.formKey,
                                              child: Column(
                                                children: [
                                                  CustomDropDownFormField(
                                                    label: "Capacity",
                                                    hintText: "Capacity",
                                                    value: controller.filterCapacity,
                                                    items: controller.capacityList
                                                        .map((e) => DropdownMenuItem(
                                                              value: e.code.toString(),
                                                              child: Text(e.status.toString()),
                                                            ))
                                                        .toSet()
                                                        .toList(),
                                                    onChanged: (value) {
                                                      controller.searchValue = null;
                                                      controller.filterCapacity = value.toString();
                                                      controller.update();
                                                    },
                                                  ),
                                                  const SizedBox(height: 8),
                                                  CustomDropDownFormField(
                                                    label: "Status",
                                                    hintText: "Status",
                                                    value: controller.filterStatus,
                                                    items: controller.statusList
                                                        .map((e) => DropdownMenuItem(
                                                              value: e.code.toString(),
                                                              child: Text(e.status.toString()),
                                                            ))
                                                        .toSet()
                                                        .toList(),
                                                    onChanged: (value) {
                                                      controller.searchValue = null;
                                                      controller.filterStatus = value.toString();
                                                      controller.update();
                                                    },
                                                  ),
                                                  const SizedBox(height: 8),
                                                ],
                                              ),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
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
                              controller.isLoading
                                  ? Container(height: Get.height / 2, child: const Center(child: CircularProgressIndicator()))
                                  : controller.dataisnull
                                      ? SizedBox(height: Get.height / 2, child: const DataEmpty())
                                      : Container()
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
                                      controller.currentPage > 1 ? (controller.meetingRoomModel?.data?.from?.toInt() ?? 0) + index : (index + 1),
                                  // listNumber: (index + 1),
                                  title: controller.meetingRoomList[index].nameMeetingRoom.toString(),
                                  status: controller.meetingRoomList[index].availableStatus,
                                  subtitle: controller.meetingRoomList[index].codeMeetingRoom,
                                  isEdit: true,
                                  editAction: () => Get.to(
                                    const AddRoomInfoScreen(),
                                    arguments: {'id': controller.meetingRoomList[index].id?.toInt(), 'isEdit': true},
                                  )?.then((value) {
                                    controller.fetchList(controller.currentPage);
                                    controller.update();
                                  }),
                                  isDelete: true,
                                  deleteAction: () {
                                    // controller.isLoading == true ? LoadingDialog().show(context) : LoadingDialog().close(context);
                                    // controller.deleteDocumentDelivery(int.parse(controller.ddList[index].id.toString()));
                                    controller.update();
                                  },
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Capacity", style: listTitleTextStyle),
                                          Text(controller.meetingRoomList[index].capacity.toString(), style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Floor", style: listTitleTextStyle),
                                          Text(controller.meetingRoomList[index].floor.toString(), style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Company", style: listTitleTextStyle),
                                          Text(controller.meetingRoomList[index].companyName.toString(), style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text("Site", style: listTitleTextStyle),
                                          Text(controller.meetingRoomList[index].siteName.toString(), style: listSubTitleTextStyle)
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
              child: Icon(Icons.add_rounded, size: 45),
              backgroundColor: successColor,
              onPressed: () => Get.to(AddRoomInfoScreen(), arguments: {'isEdit': false})?.then((value) {
                controller.fetchList(1);
                controller.update();
              }),
            ),
            bottomNavigationBar: BottomBar(menu: 0),
          );
        });
  }
}
