import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_field.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/loadingdialog.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_trip/form_request_trip/approval_form_request_trip_screen.dart';
import 'package:gais/screen/approval/request_trip/request_trip_list/approval_request_trip_controller.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:gais/screen/menu/menu_screen.dart';
import 'package:gais/util/enum/approval_action_enum.dart';
import 'package:gais/screen/tms/request_trip/add/requester_info/requester_info_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';

class ApprovalRequestTripListScreen extends StatelessWidget {
  const ApprovalRequestTripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalRequestTripListController>(
        init: ApprovalRequestTripListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Request Trip", style: appTitle),
              leading: CustomBackButton(onPressed: () => Get.off(HomeScreen(), arguments: 0)),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.fetchList(controller.currentPage);
                },
                child: CustomScrollView(
                  slivers: [
                    SliverPersistentHeader(
                      pinned: true,
                      delegate: SliverAppBarDelegate(
                        minHeight: controller.dataisnull || controller.isLoading ? Get.height : 180,
                        maxHeight: 32,
                        child: Container(
                          color: baseColor,
                          child: Column(
                            children: [
                              CustomSearchBar(
                                onSubmit: (value) {
                                  controller.searchValue = value;
                                  controller.purposeValue = "All";
                                  controller.currentPage = 1;
                                  controller.fetchList(1);
                                },
                                onClearFilter: () {
                                  controller.clearSearch("");
                                  controller.searchValue = "";
                                  controller.fetchList(1);
                                },
                                onPressedFilter: () {
                                  Get.bottomSheet(StatefulBuilder(builder: (context, setState) {
                                    PersistentBottomSheetController _controller; // <------ Instance variable
                                    final _scaffoldKey = GlobalKey<ScaffoldState>();

                                    return FilterBottomSheet(
                                      onApplyFilter: () {
                                        controller.fetchList(1);
                                        controller.update();
                                        Get.back();
                                      },
                                      onResetFilter: () {
                                        setState(() {
                                          controller.formKey.currentState?.reset();
                                          controller.searchValue = null;
                                          controller.purposeValue = "All";
                                          controller.dateRange.text = "";
                                          controller.startDate = null;
                                          controller.endDate = null;
                                        });
                                        controller.update();
                                        print(controller.purposeValue);
                                      },
                                      children: [
                                        Text("Filter", style: appTitle.copyWith(fontSize: 25)),
                                        const SizedBox(height: 10),
                                        Form(
                                          key: controller.formKey,
                                          child: CustomDropDownField(
                                            label: "Purpose of Trip",
                                            items: controller.documentList
                                                .map((e) => DropdownMenuItem(
                                                      value: e.codeDocument,
                                                      child: Text(e.documentName.toString()),
                                                    ))
                                                .toSet()
                                                .toList(),
                                            value: controller.purposeValue,
                                            onChanged: (value) {
                                              controller.searchValue = null;
                                              controller.purposeValue = value.toString();
                                              controller.update();
                                            },
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                        CustomTextFormField(
                                            readOnly: true,
                                            controller: controller.dateRange,
                                            suffixIcon: const Icon(Icons.calendar_month),
                                            onTap: () {
                                              showCustomDateRangePicker(
                                                context,
                                                dismissible: true,
                                                minimumDate: DateTime.now().subtract(const Duration(days: 365)),
                                                maximumDate: DateTime.now().add(const Duration(days: 365)),
                                                // endDate: controller.endDate,
                                                // startDate: controller.startDate,
                                                backgroundColor: Colors.white,
                                                primaryColor: Colors.green,
                                                onApplyClick: (start, end) {
                                                  controller.endDate = controller.rangeFormat.format(end);
                                                  controller.startDate = controller.rangeFormat.format(start);

                                                  controller.dateRange.text =
                                                      "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                                                  controller.update();
                                                },
                                                onCancelClick: () {
                                                  controller.endDate = null;
                                                  controller.startDate = null;
                                                  controller.update();
                                                },
                                              );
                                            },
                                            label: "Date Range".tr),
                                        const SizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    );
                                  }));
                                },
                              ),
                              CustomPagination(
                                colorSub: whiteColor,
                                colorPrimary: infoColor,
                                onPageChanged: (int pageNumber) {
                                  controller.currentPage = pageNumber;
                                  controller.fetchList(controller.currentPage);
                                  controller.update();
                                },
                                threshold: 5,
                                pageTotal: controller.rtlModel?.data?.lastPage?.toInt() ?? 1,
                                // pageTotal: controller.rtlModel?.data?.data?.length?.toInt() ?? 1,
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
                                  listNumber: controller.currentPage > 1 ? (controller.rtlModel?.data?.from?.toInt() ?? 0) + index : (index + 1),
                                  // listNumber: index + 1,
                                  title: controller.requestList[index].noRequestTrip.toString(),
                                  subtitle:
                                      controller.dateFormat.format(DateTime.parse(controller.requestList[index].createdAt.toString())).toString(),
                                  status: controller.requestList[index].status,
                                  info: controller.requestList[index].documentName,
                                  approval: true,
                                  isEdit: true,
                                  approveAction: () {
                                    Get.to(
                                      ApprovalFormRequestTripScreen(
                                        approvalActionEnum: ApprovalActionEnum.approve,
                                      ),
                                      arguments: {
                                        'id': controller.requestList[index].id,
                                        'idRequestTrip': controller.requestList[index].idRequestTrip,
                                        'approvalEnum': ApprovalActionEnum.approve,
                                        'approvalData': controller.requestList[index],
                                        'idApprovalAuth': controller.requestList[index].idApprovalAuth?.toInt(),
                                        'idCompany': controller.requestList[index].idCompany?.toInt(),
                                      },
                                    )?.then((value) => controller.fetchList(controller.currentPage));
                                  },
                                  isDelete: true,
                                  rejectAction: () {
                                    Get.to(
                                      ApprovalFormRequestTripScreen(
                                        approvalActionEnum: ApprovalActionEnum.reject,
                                      ),
                                      arguments: {
                                        'id': controller.requestList[index].id,
                                        'idRequestTrip': controller.requestList[index].idRequestTrip,
                                        'approvalEnum': ApprovalActionEnum.reject,
                                        'approvalData': controller.requestList[index],
                                        'idApprovalAuth': controller.requestList[index].idApprovalAuth?.toInt(),
                                        'idCompany': controller.requestList[index].idCompany?.toInt(),
                                      },
                                    )?.then((value) => controller.fetchList(controller.currentPage));
                                  },
                                  content: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Requestor", style: listTitleTextStyle),
                                      Text(controller.requestList[index].employeeName ?? "", style: listSubTitleTextStyle)
                                    ],
                                  ),
                                ),
                                if (controller.requestList.length == index + 1) const SizedBox(height: 100)
                              ],
                            ),
                          );
                        },
                        childCount: !controller.dataisnull ? controller.requestList.length : 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 0),
          );
        });
  }
}
