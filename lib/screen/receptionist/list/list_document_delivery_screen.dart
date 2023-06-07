import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/document_delivery/add/add_document_delivery_screen.dart';
import 'package:gais/screen/fss/document_delivery/form_document_delivery/form_document_delivery_screen.dart';
import 'package:gais/screen/receptionist/detail/detail_document_delivery_screen.dart';
import 'package:gais/screen/receptionist/list/list_document_delivery_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ListDocumentDeliveryScreen extends StatelessWidget {
  const ListDocumentDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListDocumentDeliveryController>(
        init: ListDocumentDeliveryController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("List Document Delivery", style: appTitle),
              leading: CustomBackButton(),
            ),
            body: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 110,
                    maxHeight: 32,
                    child: Column(
                      children: [
                        Container(height: 10, color: baseColor),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            children: [
                              Container(
                                width: Get.width - 112,
                                margin: EdgeInsets.only(right: 10),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: "Search",
                                    prefixIcon: Icon(IconlyLight.search),
                                  ),
                                ),
                              ),
                              CustomFilledButton(
                                color: successColor,
                                icon: IconlyBold.filter_2,
                                width: 50,
                                onPressed: () {
                                  controller.showFilter =
                                      controller.showFilter? false : true;
                                  controller.update();
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        scrollable: true,
                                        titlePadding: EdgeInsets.zero,
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(8))),
                                        title: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: lightBlueColor,
                                              borderRadius: BorderRadius.only(
                                                  topRight: Radius.circular(8),
                                                  topLeft: Radius.circular(8))),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("Filter"),
                                              IconButton(
                                                  onPressed: () => Get.back(),
                                                  icon: Icon(Icons.close))
                                            ],
                                          ),
                                        ),
                                        content: GetBuilder<
                                                ListDocumentDeliveryController>(
                                            init:
                                                ListDocumentDeliveryController(),
                                            builder: (c) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Status Document",
                                                      style:
                                                          listTitleTextStyle),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6),
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 3),
                                                    width: Get.width,
                                                    decoration: BoxDecoration(
                                                        color: whiteColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                            color: blackColor)),
                                                    child: DropdownButton(
                                                      icon: Icon(Icons
                                                          .keyboard_arrow_down),
                                                      hint: Text("Created"),
                                                      value: c.statusDocument,
                                                      isExpanded: true,
                                                      underline: SizedBox(),
                                                      items: [
                                                        DropdownMenuItem(
                                                          child:
                                                              Text("Created"),
                                                          value: "Created",
                                                        ),
                                                        DropdownMenuItem(
                                                          child:
                                                              Text("Received"),
                                                          value: "Received",
                                                        ),
                                                        DropdownMenuItem(
                                                          child: Text(
                                                              "Delivering"),
                                                          value: "Delivering",
                                                        ),
                                                        DropdownMenuItem(
                                                          child:
                                                              Text("Delivered"),
                                                          value: "Taxi Voucher",
                                                        ),
                                                      ],
                                                      onChanged: (value) {
                                                        c.statusDocument =
                                                            value;
                                                        c.update();
                                                      },
                                                    ),
                                                  ),
                                                  Text("Date Range",
                                                      style:
                                                          listTitleTextStyle),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            vertical: 6),
                                                    child: TextField(
                                                      readOnly: true,
                                                      controller: c.dateRange,
                                                      decoration: InputDecoration(
                                                          suffixIcon: Icon(Icons
                                                              .calendar_month)),
                                                      onTap: () {
                                                        showCustomDateRangePicker(
                                                          context,
                                                          dismissible: true,
                                                          minimumDate: DateTime
                                                                  .now()
                                                              .subtract(
                                                                  const Duration(
                                                                      days:
                                                                          365)),
                                                          maximumDate: DateTime
                                                                  .now()
                                                              .add(
                                                                  const Duration(
                                                                      days:
                                                                          365)),
                                                          endDate: c.endDate,
                                                          startDate:
                                                              c.startDate,
                                                          backgroundColor:
                                                              Colors.white,
                                                          primaryColor:
                                                              Colors.green,
                                                          onApplyClick:
                                                              (start, end) {
                                                            c.endDate = end;
                                                            c.startDate = start;
                                                            c.dateRange.text =
                                                                "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                                                            c.update();
                                                          },
                                                          onCancelClick: () {
                                                            c.endDate = null;
                                                            c.startDate = null;
                                                            c.update();
                                                          },
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                  Center(
                                                    child: CustomFilledButton(
                                                        color: successColor,
                                                        title: "Filter",
                                                        width: 120,
                                                        onPressed: () =>
                                                            Get.back(result: [
                                                              c.statusDocument,
                                                              c.dateRange
                                                            ])),
                                                  )
                                                ],
                                              );
                                            }),
                                        actionsAlignment:
                                            MainAxisAlignment.center,
                                        actions: [],
                                      );
                                    },
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                        Container(height: 10, color: baseColor),
                      ],
                    ),
                  ),
                ),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 70,
                    maxHeight: 32,
                    child: Column(
                      children: [
                        CustomPagination(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          onPageChanged: (int pageNumber) {
                            controller.currentPage = pageNumber;
                            controller.update();
                          },
                          pageTotal: 10,
                          pageInit: controller.currentPage,
                        ),
                        Container(height: 10, color: baseColor),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // int _page = 0;
                      // controller.currentPage != 1
                      //     ? _page = controller.currentPage + 9
                      //     : 0;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomTripCard(
                          listNumber: index + 1,
                          title: "DOC-ABM/1859/23.03",
                          subtitle: "23/04/23",
                          status: "created",
                          isEdit: true,
                          editAction: ()=> Get.to(DetailDocumentDeliveryScreen()),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Receiver", style: listTitleTextStyle),
                                  Text("Fahri", style: listSubTitleTextStyle),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Sender", style: listTitleTextStyle),
                                  Text("Mack N", style: listSubTitleTextStyle),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Location", style: listTitleTextStyle),
                                  Text("KYB01-Jakarta, Cilandak",
                                      style: listSubTitleTextStyle),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    // childCount: controller.requestList.length
                    childCount: 10,
                  ),
                ),
              ],
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add_rounded, size: 45),
              backgroundColor: successColor,
              onPressed: () => Get.to(AddDocumentDeliveryScreen()),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
