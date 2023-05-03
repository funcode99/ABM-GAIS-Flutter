import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_trip/form_request_trip/approval_form_request_trip_controller.dart';
import 'package:get/get.dart';

class ApprovalFormRequestTripScreen extends StatelessWidget {
  const ApprovalFormRequestTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalFormRequestTripController>(
        init: ApprovalFormRequestTripController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              title: Text(
                "Reques Trip",
                style: appTitle,
              ),
              centerTitle: true,
              leading: CustomBackButton(),
              flexibleSpace: TopBar(),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 6, left: 7, right: 7),
              padding: EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 90,
                      maxHeight: 32,
                      child: Container(
                        color: whiteColor,
                        child: Column(
                          children: [
                            Text("TRV-ABM/1232/23.04", style: appTitle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomFilledButton(
                                  color: successColor,
                                  title: "Approve",
                                  icon: Icons.check,
                                  height: 40,
                                  width: 100,
                                  onPressed: () {
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
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Approval\nConnfirmation",
                                                    style: appTitle),
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: errorColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: whiteColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          content: GetBuilder<
                                                  ApprovalFormRequestTripController>(
                                              init:
                                                  ApprovalFormRequestTripController(),
                                              builder: (c) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                        "Are you sure want to approve this document?"),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: c.approve[0],
                                                          groupValue:
                                                              c.approval,
                                                          onChanged: (value) {
                                                            c.approval =
                                                                value ?? "";
                                                            c.update();
                                                          },
                                                        ),
                                                        Text('Behalf of  '),
                                                        Container(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      8),
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                              border: Border.all(
                                                                  color:
                                                                      greyColor)),
                                                          child: DropdownButton(
                                                            underline:
                                                                SizedBox(),
                                                            hint: Text("Name"),
                                                            icon: Icon(Icons
                                                                .keyboard_arrow_down),
                                                            items: [],
                                                            onChanged:
                                                                (value) {},
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: c.approve[1],
                                                          groupValue:
                                                              c.approval,
                                                          onChanged: (value) {
                                                            c.approval =
                                                                value ?? "";
                                                            c.update();
                                                          },
                                                        ),
                                                        Text('Fully Approve')
                                                      ],
                                                    ),
                                                    Text("Notes"),
                                                    TextField()
                                                  ],
                                                );
                                              }),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          actions: [
                                            CustomFilledButton(
                                              color: Colors.transparent,
                                              fontColor: infoColor,
                                              borderColor: infoColor,
                                              title: "Cancel",
                                              width: 120,
                                              onPressed: () => Get.back(),
                                            ),
                                            CustomFilledButton(
                                              color: infoColor,
                                              title: "Appprove",
                                              width: 120,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                CustomFilledButton(
                                  color: errorColor,
                                  title: "reject",
                                  icon: Icons.close,
                                  height: 40,
                                  width: 100,
                                  onPressed: () {
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
                                                horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    topLeft:
                                                        Radius.circular(8))),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text("Reject Reason",
                                                    style: appTitle),
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        color: errorColor,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: whiteColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          content: GetBuilder<
                                                  ApprovalFormRequestTripController>(
                                              init:
                                                  ApprovalFormRequestTripController(),
                                              builder: (c) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: c.reject[0],
                                                          groupValue:
                                                              c.rejection,
                                                          onChanged: (value) {
                                                            c.rejection =
                                                                value ?? "";
                                                            c.update();
                                                          },
                                                        ),
                                                        Text(
                                                            'Rejected with Notes:  '),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: c.reject[1],
                                                          groupValue:
                                                              c.rejection,
                                                          onChanged: (value) {
                                                            c.rejection =
                                                                value ?? "";
                                                            c.update();
                                                          },
                                                        ),
                                                        Text('Fully Rejected')
                                                      ],
                                                    ),
                                                    Text("Notes"),
                                                    TextField()
                                                  ],
                                                );
                                              }),
                                          actionsAlignment:
                                              MainAxisAlignment.center,
                                          actions: [
                                            CustomFilledButton(
                                              color: Colors.transparent,
                                              fontColor: infoColor,
                                              borderColor: infoColor,
                                              title: "Cancel",
                                              width: 120,
                                              onPressed: () => Get.back(),
                                            ),
                                            CustomFilledButton(
                                              color: infoColor,
                                              title: "Confirm",
                                              width: 120,
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'Created Date ',
                                  style: listTitleTextStyle,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                              TextField(
                                controller: controller.createdDate,
                              ),
                              SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  text: 'Requestor ',
                                  style: listTitleTextStyle,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                              TextField(
                                controller: controller.requestor,
                              ),
                              SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  text: 'Purpose of Trip ',
                                  style: listTitleTextStyle,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                              TextField(
                                controller: controller.purpose,
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        );
                      },
                      childCount: 1, // 1000 list items
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 50,
                      maxHeight: 32,
                      child: Container(
                        decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10, left: 5),
                                width: 132,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.isDetail!
                                      ? whiteColor
                                      : neutralColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  gradient: LinearGradient(stops: [
                                    0.1,
                                    0
                                  ], colors: [
                                    controller.isDetail!
                                        ? blackColor
                                        : whiteColor,
                                    Colors.white
                                  ]),
                                ),
                                child: Text("Detail"),
                              ),
                              onTap: () {
                                controller.isTLK = false;
                                controller.isDetail = true;
                                controller.update();
                                print(controller.isTLK);
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 10, left: 3),
                                width: 132,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.isTLK!
                                      ? whiteColor
                                      : neutralColor,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  gradient: LinearGradient(stops: [
                                    0.1,
                                    0
                                  ], colors: [
                                    controller.isTLK! ? blackColor : whiteColor,
                                    Colors.white
                                  ]),
                                ),
                                child: Text("TLK Info"),
                              ),
                              onTap: () {
                                controller.isTLK = true;
                                controller.isDetail = false;
                                controller.update();
                                print(controller.isTLK);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    // SliverToBoxAdapter(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                title: Row(
                                  children: [
                                    Text(controller.requestTrip[index]),
                                    Icon(Icons.keyboard_arrow_down)
                                  ],
                                ),
                              ),
                              Divider(height: 1, thickness: 3),
                              controller.requestTrip[index] == "Traveller"
                                  ? Column(
                                      children: [
                                        CustomTripCard(
                                          listNumber: 1,
                                          title: "Jack H",
                                          subtitle: "2132132",
                                          info: "Requestor",
                                          isEdit: false,
                                          content: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Gender",
                                                      style:
                                                          listTitleTextStyle),
                                                  Text("Male",
                                                      style:
                                                          listSubTitleTextStyle),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Hotel Fare",
                                                      style:
                                                          listTitleTextStyle),
                                                  Text("700.000",
                                                      style:
                                                          listSubTitleTextStyle),
                                                ],
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text("Flight Entitlement",
                                                      style:
                                                          listTitleTextStyle),
                                                  Text("Economy",
                                                      style:
                                                          listSubTitleTextStyle),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  : controller.requestTrip[index] == "Airliness"
                                      ? Column(
                                          children: [
                                            CustomTripCard(
                                              listNumber: 1,
                                              title: "Jack H",
                                              subtitle: "23/04/23",
                                              status: "Pending",
                                              info: "Citilink\nQG828",
                                              isEdit: false,
                                              content: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Departure",
                                                          style:
                                                              listTitleTextStyle),
                                                      Text("CGK (06.00)",
                                                          style:
                                                              listSubTitleTextStyle),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Arrival",
                                                          style:
                                                              listTitleTextStyle),
                                                      Text("SUB (09.00)",
                                                          style:
                                                              listSubTitleTextStyle),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text("Price",
                                                          style:
                                                              listTitleTextStyle),
                                                      Text("899.000",
                                                          style:
                                                              listSubTitleTextStyle),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      : controller.requestTrip[index] ==
                                              "Taxi Voucher"
                                          ? Column(
                                              children: [
                                                CustomTripCard(
                                                  listNumber: 1,
                                                  title: "Jack H",
                                                  subtitle: "23/04/23",
                                                  status: "Pending",
                                                  info: "200.000",
                                                  isEdit: false,
                                                  isDelete: true,
                                                  content: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("Departure",
                                                              style:
                                                                  listTitleTextStyle),
                                                          Text("Surabaya",
                                                              style:
                                                                  listSubTitleTextStyle),
                                                        ],
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text("Arrival",
                                                              style:
                                                                  listTitleTextStyle),
                                                          Text("Surabaya Barat",
                                                              style:
                                                                  listSubTitleTextStyle),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            )
                                          : controller.requestTrip[index] ==
                                                  "Other Transportation"
                                              ? Column(
                                                  children: [
                                                    CustomTripCard(
                                                      listNumber: 1,
                                                      title: "Jack H",
                                                      subtitle: "SSB Pool Car",
                                                      status: "Pending",
                                                      info: "Surabaya",
                                                      isEdit: false,
                                                      isDelete: true,
                                                      content: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text("From Date",
                                                                  style:
                                                                      listTitleTextStyle),
                                                              Text("21/03/23",
                                                                  style:
                                                                      listSubTitleTextStyle),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text("To Date",
                                                                  style:
                                                                      listTitleTextStyle),
                                                              Text("23/03/23",
                                                                  style:
                                                                      listSubTitleTextStyle),
                                                            ],
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text("Quantity",
                                                                  style:
                                                                      listTitleTextStyle),
                                                              Text("1",
                                                                  style:
                                                                      listSubTitleTextStyle),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              : controller.requestTrip[index] ==
                                                      "Accommodation"
                                                  ? Column(
                                                      children: [
                                                        CustomTripCard(
                                                          listNumber: 1,
                                                          title: "Jack H",
                                                          status: "Pending",
                                                          info: "Aston Gubeng",
                                                          isEdit: false,
                                                          isDelete: true,
                                                          content: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "Check In",
                                                                      style:
                                                                          listTitleTextStyle),
                                                                  Text(
                                                                      "21/03/23",
                                                                      style:
                                                                          listSubTitleTextStyle),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                      "Check Out",
                                                                      style:
                                                                          listTitleTextStyle),
                                                                  Text(
                                                                      "23/03/23",
                                                                      style:
                                                                          listSubTitleTextStyle),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text("Price",
                                                                      style:
                                                                          listTitleTextStyle),
                                                                  Text(
                                                                      "899.990",
                                                                      style:
                                                                          listSubTitleTextStyle),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : controller.requestTrip[
                                                              index] ==
                                                          "Cash Advance"
                                                      ? Column(
                                                          children: [
                                                            CustomTripCard(
                                                              listNumber: 1,
                                                              title: "Jack H",
                                                              status: "Pending",
                                                              info: "120.000",
                                                              isEdit: false,
                                                              isDelete: true,
                                                              content: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "Item",
                                                                          style:
                                                                              listTitleTextStyle),
                                                                      Text(
                                                                          "Meals",
                                                                          style:
                                                                              listSubTitleTextStyle),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Text(
                                                                          "Frequency",
                                                                          style:
                                                                              listTitleTextStyle),
                                                                      Text("2",
                                                                          style:
                                                                              listSubTitleTextStyle),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "Currency",
                                                                          style:
                                                                              listTitleTextStyle),
                                                                      Text(
                                                                          "Rupiah",
                                                                          style:
                                                                              listSubTitleTextStyle),
                                                                    ],
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                          "Nominal",
                                                                          style:
                                                                              listTitleTextStyle),
                                                                      Text(
                                                                          "60.000",
                                                                          style:
                                                                              listSubTitleTextStyle),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        )
                                                      : Container(),
                            ]);
                      },
                      childCount:
                          controller.requestTrip.length, // 1000 list items
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}

