import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_trip/form_request_trip/approval_form_request_trip_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ApprovalFormRequestTripScreen extends StatelessWidget {
  const ApprovalFormRequestTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalFormRequestTripController>(
        init: ApprovalFormRequestTripController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Reques Trip", style: appTitle),
              leading: CustomBackButton(),
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
                            Text(controller.rtNumber.toString(), style: appTitle),
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
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                          title: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8))),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Approval\nConnfirmation", style: appTitle),
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Container(
                                                    decoration:
                                                        BoxDecoration(color: errorColor, borderRadius: BorderRadius.circular(5)),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: whiteColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          content: GetBuilder<ApprovalFormRequestTripController>(
                                              init: ApprovalFormRequestTripController(),
                                              builder: (c) {
                                                return Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Are you sure want to approve this document?"),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: c.approve[0],
                                                          groupValue: c.approval,
                                                          onChanged: (value) {
                                                            c.approval = value ?? "";
                                                            c.update();
                                                          },
                                                        ),
                                                        Text('Behalf of  '),
                                                        Container(
                                                          padding: EdgeInsets.symmetric(horizontal: 8),
                                                          height: 30,
                                                          decoration: BoxDecoration(
                                                              borderRadius: BorderRadius.circular(8),
                                                              border: Border.all(color: greyColor)),
                                                          child: DropdownButton(
                                                            underline: SizedBox(),
                                                            hint: Text("Name"),
                                                            icon: Icon(Icons.keyboard_arrow_down),
                                                            items: [],
                                                            onChanged: (value) {},
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: c.approve[1],
                                                          groupValue: c.approval,
                                                          onChanged: (value) {
                                                            c.approval = value ?? "";
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
                                          actionsAlignment: MainAxisAlignment.center,
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
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                                          title: Container(
                                            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8))),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Text("Reject Reason", style: appTitle),
                                                GestureDetector(
                                                  onTap: () => Get.back(),
                                                  child: Container(
                                                    decoration:
                                                        BoxDecoration(color: errorColor, borderRadius: BorderRadius.circular(5)),
                                                    child: Icon(
                                                      Icons.close,
                                                      color: whiteColor,
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          content: GetBuilder<ApprovalFormRequestTripController>(
                                              init: ApprovalFormRequestTripController(),
                                              builder: (c) {
                                                return Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: c.reject[0],
                                                          groupValue: c.rejection,
                                                          onChanged: (value) {
                                                            c.rejection = value ?? "";
                                                            c.update();
                                                          },
                                                        ),
                                                        Text('Rejected with Notes:  '),
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Radio(
                                                          value: c.reject[1],
                                                          groupValue: c.rejection,
                                                          onChanged: (value) {
                                                            c.rejection = value ?? "";
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
                                          actionsAlignment: MainAxisAlignment.center,
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
                              CustomTextFormField(
                                controller: controller.createdDate,
                                label: "Created Date",
                                isRequired: true,
                                readOnly: true,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.requestor,
                                label: "Requestor",
                                isRequired: true,
                                readOnly: true,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.purpose,
                                label: "Purpose Of Trip",
                                isRequired: true,
                                readOnly: true,
                              ),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.site,
                                label: "Site",
                                isRequired: true,
                                readOnly: true,
                              ),
                              const SizedBox(height: 8),
                              controller.isAttachment
                                  ? CustomTextFormField(
                                      controller: controller.attachment,
                                      label: "attachment",
                                      isRequired: true,
                                      readOnly: true,
                                    )
                                  : Container(),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.notes,
                                label: "Notes to Purpose of Trip",
                                readOnly: true,
                              ),
                              const SizedBox(height: 8),
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
                        decoration: const BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10, left: 5),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.isDetail ? whiteColor : neutralColor,
                                  borderRadius:
                                      const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                  gradient: LinearGradient(
                                      stops: const [0.1, 0],
                                      colors: [controller.isDetail ? blackColor : whiteColor, Colors.white]),
                                ),
                                child: const Text("Detail"),
                              ),
                              onTap: () {
                                controller.isDetail = true;
                                controller.isTLK = false;
                                controller.isApproval = false;
                                controller.update();
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10, left: 3),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.isTLK ? whiteColor : neutralColor,
                                  borderRadius:
                                      const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                  gradient: LinearGradient(
                                      stops: const [0.1, 0], colors: [controller.isTLK ? blackColor : whiteColor, Colors.white]),
                                ),
                                child: const Text("TLK Info"),
                              ),
                              onTap: () {
                                controller.isTLK = true;
                                controller.isDetail = false;
                                controller.isApproval = false;
                                controller.update();
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
                        if (controller.isDetail == true) {
                          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            ListTile(
                              title: Row(
                                children: [
                                  Text(controller.requestTrip[index]),
                                  IconButton(
                                      onPressed: () {
                                        controller.showList[index] = controller.showList[index] == false ? true : false;
                                        controller.update();
                                      },
                                      icon: controller.showList[index] == false
                                          ? const Icon(Icons.keyboard_arrow_down)
                                          : const Icon(Icons.keyboard_arrow_up))
                                ],
                              ),
                              trailing: controller.isEdit
                                  ? CustomFilledButton(
                                      color: successColor,
                                      icon: IconlyBold.plus,
                                      title: "Add",
                                      width: 100,
                                      height: 30,
                                      onPressed: () {
                                        index == 1 || index == 4 || index == 5
                                            ? Get.off(
                                                controller.addScreen[index],
                                                arguments: {
                                                  'purposeID': controller.purposeID,
                                                  'codeDocument': controller.codeDocument,
                                                  'formEdit': true,
                                                },
                                              )
                                            : Get.to(
                                                controller.addScreen[index],
                                                arguments: {
                                                  'purposeID': controller.purposeID,
                                                  'codeDocument': controller.codeDocument,
                                                  'formEdit': true,
                                                },
                                              )?.then((value) {
                                                controller.fetchList();
                                                controller.update();
                                              });
                                      },
                                    )
                                  : const SizedBox(),
                            ),
                            const Divider(height: 1, thickness: 3),
                            controller.requestTrip[index] == "Traveller Guest"
                                ? controller.showList[index]
                                    ? Column(
                                        children: controller.guestList.isNotEmpty
                                            ? controller.guestList
                                                .mapIndexed(
                                                  (i, e) => CustomTripCard(
                                                    listNumber: i + 1,
                                                    title: e.nameGuest.toString(),
                                                    subtitle: e.nik,
                                                    info: "Guest",
                                                    content: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("Gender", style: listTitleTextStyle),
                                                            Text(e.gender == "L" ? "Male" : "Female",
                                                                style: listSubTitleTextStyle),
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("Hotel Fare", style: listTitleTextStyle),
                                                            Text(e.hotelFare.toString(), style: listSubTitleTextStyle),
                                                          ],
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                            Text("Flight Entitlement", style: listTitleTextStyle),
                                                            Text(e.flightClass.toString(), style: listSubTitleTextStyle),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                                .toList()
                                            : [
                                                const Center(
                                                  child: Padding(
                                                    padding: EdgeInsets.all(10),
                                                    child: Text("no data yet"),
                                                  ),
                                                )
                                              ])
                                    : Container()
                                : controller.requestTrip[index] == "Airliness"
                                    ? controller.showList[index]
                                        ? Column(
                                            children: controller.airlinessList.isNotEmpty
                                                ? controller.airlinessList
                                                    .mapIndexed((i, e) => CustomTripCard(
                                                          listNumber: i + 1,
                                                          title: e.employeeName.toString(),
                                                          subtitle: e.createdAt.toString().substring(0, 10),
                                                          info: e.flightNo,
                                                          content: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Departure", style: listTitleTextStyle),
                                                                  Text("CGK (06.00)", style: listSubTitleTextStyle),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Arrival", style: listTitleTextStyle),
                                                                  Text("SUB (09.00)", style: listSubTitleTextStyle),
                                                                ],
                                                              ),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Price", style: listTitleTextStyle),
                                                                  Text(e.ticketPrice.toString(), style: listSubTitleTextStyle),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ))
                                                    .toList()
                                                : [
                                                    const Center(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(10),
                                                        child: Text("no data yet"),
                                                      ),
                                                    )
                                                  ],
                                          )
                                        : Container()
                                    : controller.requestTrip[index] == "Taxi Voucher"
                                        ? controller.showList[index]
                                            ? Column(
                                                children: controller.tvList.isNotEmpty
                                                    ? controller.tvList
                                                        .mapIndexed(
                                                          (i, e) => CustomTripCard(
                                                            listNumber: i + 1,
                                                            title: e.employeeName.toString(),
                                                            subtitle: e.date,
                                                            status: e.status.toString(),
                                                            info: int.parse(e.amount.toString()).toCurrency(),
                                                            content: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text("Departure", style: listTitleTextStyle),
                                                                    Text(e.nameDepartureCity.toString(),
                                                                        style: listSubTitleTextStyle),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text("Arrival", style: listTitleTextStyle),
                                                                    Text(e.nameArrivalCity.toString(),
                                                                        style: listSubTitleTextStyle),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        )
                                                        .toList()
                                                    : [
                                                        const Center(
                                                          child: Padding(
                                                            padding: EdgeInsets.all(10),
                                                            child: Text("no data yet"),
                                                          ),
                                                        )
                                                      ],
                                              )
                                            : Container()
                                        : controller.requestTrip[index] == "Other Transportation"
                                            ? controller.showList[index]
                                                ? Column(
                                                    children: controller.otList.isNotEmpty
                                                        ? controller.otList
                                                            .mapIndexed(
                                                              (i, e) => CustomTripCard(
                                                                listNumber: i + 1,
                                                                title: e.noRequestTrip.toString(),
                                                                subtitle: e.typeTransportation.toString(),
                                                                status: e.status.toString(),
                                                                info: e.cityName.toString(),
                                                                content: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("From Date", style: listTitleTextStyle),
                                                                        Text(e.fromDate.toString(), style: listSubTitleTextStyle),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("To Date", style: listTitleTextStyle),
                                                                        Text(e.toDate.toString(), style: listSubTitleTextStyle),
                                                                      ],
                                                                    ),
                                                                    Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                      children: [
                                                                        Text("Quantity", style: listTitleTextStyle),
                                                                        Text(e.qty.toString(), style: listSubTitleTextStyle),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            )
                                                            .toList()
                                                        : [
                                                            const Center(
                                                              child: Padding(
                                                                padding: EdgeInsets.all(10),
                                                                child: Text("no data yet"),
                                                              ),
                                                            )
                                                          ],
                                                  )
                                                : Container()
                                            : controller.requestTrip[index] == "Accommodation"
                                                ? controller.showList[index]
                                                    ? Column(
                                                        children: controller.accommodationsList.isNotEmpty
                                                            ? controller.accommodationsList
                                                                .mapIndexed(
                                                                  (i, e) => CustomTripCard(
                                                                    listNumber: i + 1,
                                                                    title: e.employeeName.toString(),
                                                                    status: e.status.toString(),
                                                                    info: e.hotelName,
                                                                    content: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("Check In", style: listTitleTextStyle),
                                                                            Text(e.checkInDate.toString(),
                                                                                style: listSubTitleTextStyle),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("Check Out", style: listTitleTextStyle),
                                                                            Text(e.checkOutDate.toString(),
                                                                                style: listSubTitleTextStyle),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("Price", style: listTitleTextStyle),
                                                                            Text(e.price.toString(),
                                                                                style: listSubTitleTextStyle),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                                .toList()
                                                            : [
                                                                const Center(
                                                                  child: Padding(
                                                                    padding: EdgeInsets.all(10),
                                                                    child: Text("no data yet"),
                                                                  ),
                                                                )
                                                              ],
                                                      )
                                                    : Container()
                                                : controller.requestTrip[index] == "Cash Advance"
                                                    ? controller.showList[index]
                                                        ? Column(
                                                            children: controller.caList.isNotEmpty
                                                                ? controller.caList
                                                                    .mapIndexed((i, e) => CustomTripCard(
                                                                          listNumber: i + 1,
                                                                          // title: e.employeeName ?? "",
                                                                          title: "",
                                                                          // subtitle: e.employeeName,
                                                                          // status: e.status,
                                                                          info: e.grandTotal,
                                                                          isEdit: controller.isEdit,
                                                                          isDelete: controller.isEdit,
                                                                          content: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text("Item", style: listTitleTextStyle),
                                                                                  Text("Meals", style: listSubTitleTextStyle),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text("Frequency", style: listTitleTextStyle),
                                                                                  Text("2", style: listSubTitleTextStyle),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text("Currency", style: listTitleTextStyle),
                                                                                  // Text(e.currencyName.toString(), style: listSubTitleTextStyle),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text("Nominal", style: listTitleTextStyle),
                                                                                  Text("60.000", style: listSubTitleTextStyle),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ))
                                                                    .toList()
                                                                : [
                                                                    const Center(
                                                                      child: Padding(
                                                                        padding: EdgeInsets.all(10),
                                                                        child: Text("no data yet"),
                                                                      ),
                                                                    )
                                                                  ],
                                                          )
                                                        : Container()
                                                    : Container(),
                          ]);
                        }
                        if (controller.isTLK == true) {
                          return Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              children: [
                                CustomTextFormField(
                                  controller: controller.tlkRequestor,
                                  label: "Requestor",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.tlkJobBand,
                                  label: "Job Band",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.tlkZona,
                                  label: "Zona",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.tlkTotal,
                                  label: "Total TLK",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.tlkTotalMeals,
                                  label: "Total Meals",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 50),
                              ],
                            ),
                          );
                        }
                        return null;
                      },
                      childCount: controller.isDetail == true ? controller.requestTrip.length : 1, // 1000 list items
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
