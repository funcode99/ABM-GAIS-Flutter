import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/form/custom_dropdown_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/loadingdialog.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:gais/screen/tms/request_trip/add/requester_info/requester_info_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_controller.dart';
import 'package:get/get.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';

class RequestTripListScreen extends StatelessWidget {
  const RequestTripListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequestTripListController>(
        init: RequestTripListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Request Trip", style: appTitle),
              leading: CustomBackButton(onPressed: () => Get.off(const HomeScreen(), arguments: 0)),
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
                                  controller.fetchList(controller.currentPage);
                                },
                                onClearFilter: () {
                                  controller.clearSearch("");
                                  controller.searchValue = "";
                                  controller.fetchList(1);
                                },
                                onPressedFilter: () {
                                  Get.bottomSheet(StatefulBuilder(builder: (context, setState) {
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
                                        // print(controller.purposeValue);
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
                                                      value: e.documentName,
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
                                  controller.fetchList(pageNumber);
                                  controller.update();
                                },
                                threshold: 5,
                                pageTotal: controller.rtlModel?.data?.lastPage?.toInt() ?? 1,
                                pageInit: controller.currentPage,
                              ),
                              controller.isLoading
                                  ? SizedBox(height: Get.height / 2, child: const Center(child: CircularProgressIndicator()))
                                  : controller.dataisnull == true
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
                                  title: controller.requestList[index].noRequestTrip.toString(),
                                  // title: controller.requestList[index].id.toString(),
                                  status: controller.requestList[index].status,
                                  subtitle:
                                      controller.dateFormat.format(DateTime.parse(controller.requestList[index].createdAt.toString())).toString(),
                                  info: controller.requestList[index].documentName,
                                  isEdit: true,
                                  editAction: () {
                                    Get.to(
                                      const FormRequestTripScreen(),
                                      arguments: {
                                        'id': controller.requestList[index].id,
                                        'codeDocument': controller.requestList[index].idDocument,
                                      },
                                    )?.then((value) {
                                      controller.fetchList(controller.currentPage);
                                      controller.update();
                                    });
                                    // print("id: ${controller.requestList[index].id}");
                                    // Get.showSnackbar(GetSnackBar(
                                    //   icon: Icon(
                                    //     Icons.error,
                                    //     color: Colors.white,
                                    //   ),
                                    //   message: controller.requestList[index].id,
                                    //   isDismissible: true,
                                    //   duration: Duration(seconds: 3),
                                    //   backgroundColor: Colors.red,
                                    // ));
                                  },

                                  isDelete: true,
                                  deleteAction: () {
                                    Get.dialog(DeleteConfirmationDialog(
                                      onDeletePressed: () {
                                        controller.isLoading == true ? LoadingDialog().show(context) : LoadingDialog().close(context);
                                        controller.delete(controller.requestList[index].id.toString());
                                        controller.update();
                                        Get.back();
                                      },
                                    ));
                                    // Get.showSnackbar(GetSnackBar(
                                    //   icon: Icon(
                                    //     Icons.error,
                                    //     color: Colors.white,
                                    //   ),
                                    //   message: controller.requestList[index].id,
                                    //   isDismissible: true,
                                    //   duration: Duration(seconds: 3),
                                    //   backgroundColor: Colors.red,
                                    // ));
                                  },
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Requestor", style: listTitleTextStyle),
                                          Text(controller.requestList[index].employeeName ?? "", style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          controller.requestList[index].documentReady?.travellerGuestTrip == 1
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  margin: const EdgeInsets.symmetric(horizontal: 1),
                                                  // padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                                                  child: const Icon(Icons.groups, color: whiteColor),
                                                )
                                              : Container(),
                                          controller.requestList[index].documentReady?.flightTrip == 1
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  margin: const EdgeInsets.symmetric(horizontal: 1),
                                                  // padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                                                  child: SvgPicture.asset(
                                                    ImageConstant.airplane,
                                                    height: 25,
                                                  ),
                                                )
                                              : Container(),
                                          controller.requestList[index].documentReady?.transportation == 1
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  margin: const EdgeInsets.symmetric(horizontal: 1),
                                                  // padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                                                  child: SvgPicture.asset(
                                                    ImageConstant.car,
                                                    height: 25,
                                                  ),
                                                )
                                              : Container(),
                                          // controller.requestList[index].documentReady?.taxiVoucher == 1
                                          //     ? Container(
                                          //         alignment: Alignment.center,
                                          //         height: 35,
                                          //         width: 35,
                                          //         margin: const EdgeInsets.symmetric(horizontal: 1),
                                          //         // padding: EdgeInsets.all(10),
                                          //         decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                                          //         child: SvgPicture.asset(
                                          //           ImageConstant.car,
                                          //           height: 25,
                                          //         ),
                                          //       )
                                          //     : Container(),
                                          controller.requestList[index].documentReady?.trainTrip == 1
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  margin: const EdgeInsets.symmetric(horizontal: 1),
                                                  // padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                                                  child: const Icon(Icons.train_rounded, color: whiteColor),
                                                )
                                              : Container(),
                                          // controller.requestList[index].documentReady?.otherTransportation == 1
                                          //     ? Container(
                                          //         alignment: Alignment.center,
                                          //         height: 35,
                                          //         width: 35,
                                          //         margin: const EdgeInsets.symmetric(horizontal: 1),
                                          //         // padding: EdgeInsets.all(10),
                                          //         decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                                          //         child: SvgPicture.asset(
                                          //           ImageConstant.car,
                                          //           height: 25,
                                          //         ),
                                          //       )
                                          //     : Container(),
                                          controller.requestList[index].documentReady?.accomodationTrip == 1
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  margin: const EdgeInsets.symmetric(horizontal: 1),
                                                  // padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                                                  child: SvgPicture.asset(
                                                    ImageConstant.building,
                                                    height: 25,
                                                  ),
                                                )
                                              : Container(),
                                          controller.requestList[index].documentReady?.cashAdvance == 1
                                              ? Container(
                                                  alignment: Alignment.center,
                                                  height: 35,
                                                  width: 35,
                                                  margin: const EdgeInsets.symmetric(horizontal: 1),
                                                  // padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                                                  child: SvgPicture.asset(
                                                    ImageConstant.emptyWalletTime,
                                                    height: 25,
                                                  ),
                                                )
                                              : Container(),
                                        ],
                                      )
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
            floatingActionButton: FloatingActionButton(
              backgroundColor: successColor,
              onPressed: () => Get.to(const RequesterInfoScreen()),
              child: const Icon(Icons.add_rounded, size: 45),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
