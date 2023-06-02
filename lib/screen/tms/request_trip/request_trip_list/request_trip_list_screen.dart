import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/customsearchbar.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/dialog/filter_bottom_sheet.dart';
import 'package:gais/reusable/dialog/filterdialog.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/loadingdialog.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:gais/screen/tms/request_trip/add/requester_info/requester_info_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
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
              leading: CustomBackButton(),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  CustomSearchBar(
                    onSubmit: (value) {
                      controller.searchValue = value;
                      controller.purposeValue = "All";
                      controller.fetchList();
                      print("cari : ${controller.searchNotFound}");
                    },
                    onPressedFilter: () {
                      Get.bottomSheet(StatefulBuilder(builder: (context, setState) {
                        return FilterBottomSheet(
                          onApplyFilter: () {
                            controller.fetchList();
                            controller.update();
                            Get.back();
                          },
                          onResetFilter: () {
                            controller.formKey.currentState?.reset();
                            controller.purposeValue = "All";
                            controller.dateRange.text = "";
                            controller.update();
                          },
                          children: [
                            Text("Filter", style: appTitle.copyWith(fontSize: 25)),
                            SizedBox(height: 10),
                            Form(
                              key: controller.formKey,
                              child: CustomDropDownFormField(
                                label: "Purpose of Trip",
                                hintText: "Purpose of Trip",
                                items: controller.documentList
                                    .map((e) => DropdownMenuItem(
                                          child: Text(e.documentName.toString()),
                                          value: e.documentName,
                                        ))
                                    .toSet()
                                    .toList(),
                                value: controller.purposeValue,
                                onChanged: (value) {
                                  controller.searchValue = null;
                                  controller.purposeValue = value ?? "";
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

                                      controller.dateRange.text = "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
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
                      controller.fetchList();
                      controller.update();
                    },
                    threshold: 5,
                    pageTotal: controller.rtlModel?.data?.lastPage?.toInt() ?? 1,
                    pageInit: controller.currentPage,
                  ),
                  RefreshIndicator(
                    onRefresh: () async {
                      controller.fetchList();
                    },
                    child: Flexible(
                      child: SizedBox(
                        height: Get.width >= 380 ? (Get.height / 1.65) : (Get.height / 2.4),
                        child: controller.isLoading
                            ? Center(child: CircularProgressIndicator.adaptive())
                            : controller.dataisnull
                                ? DataEmpty()
                                : ListView(
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    children: [
                                      ...controller.requestList.mapIndexed(
                                        (index, item) => CustomTripCard(
                                          listNumber:
                                              controller.currentPage > 1 ? (controller.rtlModel?.data?.from?.toInt() ?? 0) + index : (index + 1),
                                          title: item.noRequestTrip.toString(),
                                          status: item.status,
                                          subtitle: item.createdAt?.substring(0, 10),
                                          info: item.documentName,
                                          isEdit: true,
                                          editAction: () => Get.to(
                                            const FormRequestTripScreen(),
                                            arguments: {
                                              'id': item.id?.toInt(),
                                              'idDocument': item.codeDocument
                                            },
                                          )?.then((value) {
                                            controller.fetchList();
                                            controller.update();
                                          }),
                                          isDelete: true,
                                          deleteAction: () {
                                            controller.isLoading == true ? LoadingDialog().show(context) : LoadingDialog().close(context);
                                            controller.delete(int.parse(item.id.toString()));

                                            controller.update();
                                          },
                                          content: Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Requestor", style: listTitleTextStyle),
                                              Text(item.employeeName ?? "", style: listSubTitleTextStyle)
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 100)
                                    ],
                                  ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: successColor,
              onPressed: () => Get.to(const RequesterInfoScreen()),
              child: const Icon(Icons.add_rounded, size: 45),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
