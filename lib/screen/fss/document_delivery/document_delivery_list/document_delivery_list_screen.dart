import 'package:custom_date_range_picker/custom_date_range_picker.dart';
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
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/loadingdialog.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_trip/request_trip_list/approval_request_trip_controller.dart';
import 'package:gais/screen/fss/document_delivery/add/add_document_delivery_screen.dart';
import 'package:gais/screen/fss/document_delivery/document_delivery_list/document_delivery_list_controller.dart';
import 'package:gais/screen/fss/document_delivery/form_document_delivery/form_document_delivery_screen.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DocumentDeliveryListScreen extends StatelessWidget {
  const DocumentDeliveryListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DocumentDeliveryListController>(
        init: DocumentDeliveryListController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Document Delivery", style: appTitle),
              leading: CustomBackButton(onPressed: ()=> Get.off(HomeScreen(), arguments: 1),),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: RefreshIndicator(
                onRefresh: () async {
                  controller.fetchList();
                  controller.update();
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
                                  controller.filterStatus = "-1";
                                  controller.fetchList();
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
                                        setState(() {
                                          controller.resetFilter();
                                        });
                                      },
                                      children: [
                                        Text("Filter", style: appTitle.copyWith(fontSize: 25)),
                                        const SizedBox(height: 10),
                                        Form(
                                          key: controller.formKey,
                                          child: CustomDropDownFormField(
                                            label: "Status Document",
                                            hintText: "Status Document",
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
                                              controller.filterStatus = value.toString() ;
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
                                  controller.fetchList();
                                  controller.update();
                                },
                                threshold: 5,
                                pageTotal: controller.ddModel?.data?.lastPage?.toInt() ?? 1,
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
                                  listNumber: controller.currentPage > 1 ? (controller.ddModel?.data?.from?.toInt() ?? 0) + index : (index + 1),
                                  title: controller.ddList[index].id.toString(),
                                  //code document delivery
                                  status: controller.ddList[index].status.toString(),
                                  // status
                                  subtitle: controller.dateFormat.format(DateTime.parse(controller.ddList[index].createdAt.toString())).toString(),
                                  isEdit: true,
                                  editAction: () => Get.to(
                                    const FormDocumentDeliveryScreen(),
                                    arguments: {
                                      'id': controller.ddList[index].id?.toInt(),
                                    },
                                  )?.then((value) {
                                    controller.fetchList();
                                    controller.update();
                                  }),
                                  isDelete: true,
                                  deleteAction: () {
                                    controller.isLoading == true ? LoadingDialog().show(context) : LoadingDialog().close(context);
                                    controller.deleteDocumentDelivery(int.parse(controller.ddList[index].id.toString()));

                                    controller.update();
                                  },
                                  content: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Receiver", style: listTitleTextStyle),
                                          Text(controller.ddList[index].receiverName.toString() ?? "", style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Sender", style: listTitleTextStyle),
                                          Text(controller.ddList[index].senderName.toString() ?? "", style: listSubTitleTextStyle)
                                        ],
                                      ),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Location", style: listTitleTextStyle),
                                          Text("${controller.ddList[index].siteCode} - ${controller.ddList[index].siteName.toString() ?? " "}", style: listSubTitleTextStyle)
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                if (controller.ddList.length == index + 1) const SizedBox(height: 100)
                              ],
                            ),
                          );
                        },
                        childCount: !controller.dataisnull ? controller.ddList.length : 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_rounded, size: 45),
              backgroundColor: successColor,
              onPressed: () => Get.to(AddDocumentDeliveryScreen())?.then((value) {
                controller.fetchList();
                controller.update();
              }),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
