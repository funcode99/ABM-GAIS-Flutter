import 'package:collection/collection.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customapprovalinfocard.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/edit/edit_accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/check_schedule/check_schedule_screen.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/add_cash_advance_travel_screen.dart';
import 'package:gais/screen/tms/request_trip/add/other_transport/edit/edit_other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/edit/edit_taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/add/add_guest_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class FormRequestTripScreen extends StatelessWidget {
  const FormRequestTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormRequestTripController>(
        init: FormRequestTripController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Request Trip", style: appTitle),
              leading: const CustomBackButton(),
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 6, left: 7, right: 7),
              padding: const EdgeInsets.only(top: 5),
              decoration: const BoxDecoration(
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
                      minHeight: 120,
                      maxHeight: 32,
                      child: Container(
                        color: whiteColor,
                        width: Get.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                              margin: EdgeInsets.only(bottom: 4),
                              decoration: BoxDecoration(color: greenColor, borderRadius: BorderRadius.circular(8)),
                              child: Text(controller.rtStatus.toString()),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
                                controller.rtNumber.toString(),
                                style: listTitleTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: controller.isEdit == true || controller.rtStatus == "Draft"
                                  ? MainAxisAlignment.spaceEvenly
                                  : MainAxisAlignment.center,
                              children: [
                                CustomFilledButton(
                                  color: Colors.transparent,
                                  title: controller.isEdit ? "Cancel" : "Edit",
                                  borderColor: infoColor,
                                  fontColor: infoColor,
                                  width: Get.width / 4,
                                  onPressed: () {
                                    controller.isEdit = controller.isEdit == false ? true : false;
                                    controller.update();
                                  },
                                ),
                                controller.isEdit
                                    ? CustomFilledButton(
                                        color: successColor,
                                        title: "Save",
                                        width: Get.width / 4,
                                        onPressed: () {
                                          controller.updateRequestTrip();
                                          controller.update();
                                        },
                                      )
                                    : controller.rtStatus == "Draft"
                                        ? CustomFilledButton(
                                            color: successColor,
                                            title: "Submit",
                                            width: Get.width / 4,
                                            onPressed: () {
                                              controller.submitRequestTrip();
                                              controller.update();
                                            },
                                          )
                                        : SizedBox()
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
                              controller.isEdit
                                  ? CustomDropDownFormField(
                                      label: 'Purpose of Trip',
                                      isRequired: true,
                                      value: controller.selectedPurpose,
                                      hintText: "pick document type",
                                      items: controller.purposeList
                                          .map((e) => DropdownMenuItem(
                                                value: e.id.toString(),
                                                // value: e.codeDocument.toString(),
                                                child: Text(e.documentName.toString()),
                                                onTap: () {
                                                  controller.codeDocument = e.id?.toInt();
                                                  controller.update();
                                                },
                                              ))
                                          .toList(),
                                      onChanged: (value) {
                                        controller.selectedPurpose = value.toString();
                                        value == "1" || value == "2" ? controller.isAttachment = true : controller.isAttachment = false;
                                        controller.update();
                                        controller.checkItems();
                                        controller.update();
                                        // print(controller.selectedPurpose);
                                      },
                                    )
                                  : CustomTextFormField(
                                      controller: controller.purpose,
                                      label: "Purpose Of Trip",
                                      isRequired: true,
                                      readOnly: true,
                                    ),
                              const SizedBox(height: 8),
                              controller.selectedPurpose == "1"
                                  ? Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      child: CustomDropDownFormField(
                                        label: "Site",
                                        isRequired: true,
                                        readOnly: !controller.isEdit,
                                        value: controller.siteID.toString(),
                                        selectedItem: controller.site.text,
                                        items: controller.siteList
                                            .map((e) => DropdownMenuItem(
                                                  child: Text(e.siteName.toString()),
                                                  value: e.id.toString(),
                                                ))
                                            .toList(),
                                        onChanged: (value){
                                          controller.siteID = value!.toInt();
                                          controller.update();
                                        },
                                      ),
                                    )
                                  : Container(),
                              controller.isAttachment
                                  ? controller.isEdit
                                      ? CustomTextFormField(
                                          controller: controller.attachment,
                                          label: 'File Attachment',
                                          isRequired: true,
                                          readOnly: true,
                                          hintText: "Upload Form ${controller.selectedPurpose}",
                                          suffixIcon: const Icon(Icons.upload),
                                          onTap: () => controller.getSingleFile(),
                                        )
                                      : CustomTextFormField(
                                          controller: controller.attachment,
                                          label: "Attachment",
                                          isRequired: true,
                                          readOnly: true,
                                        )
                                  : Container(),
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.notes,
                                label: "Notes to Purpose of Trip",
                                readOnly: !controller.isEdit,
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
                                width: Get.width / 4,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.isDetail ? whiteColor : neutralColor,
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                  gradient:
                                      LinearGradient(stops: const [0.15, 0], colors: [controller.isDetail ? blackColor : whiteColor, Colors.white]),
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
                                width: Get.width / 4,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.isTLK ? whiteColor : neutralColor,
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                  gradient:
                                      LinearGradient(stops: const [0.15, 0], colors: [controller.isTLK ? blackColor : whiteColor, Colors.white]),
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
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10, left: 3),
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                width: Get.width / 2.6,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.isTLK ? whiteColor : neutralColor,
                                  borderRadius: const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                  gradient:
                                      LinearGradient(stops: const [0.1, 0], colors: [controller.isApproval ? blackColor : whiteColor, Colors.white]),
                                ),
                                child: const Text("Approval Info"),
                              ),
                              onTap: () {
                                controller.isApproval = true;
                                controller.isTLK = false;
                                controller.isDetail = false;
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
                          // if(controller.items[index]['isFilled'] == true)
                          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            !controller.items[index]['isFilled']
                                ? Container()
                                : ListTile(
                                    title: Row(
                                      children: [
                                        Text(controller.items[index]['title']),
                                        IconButton(
                                            onPressed: () {
                                              controller.items[index]['showList'] = controller.items[index]['showList'] == false ? true : false;
                                              controller.update();
                                            },
                                            icon: controller.items[index]['showList'] == false
                                                ? const Icon(Icons.keyboard_arrow_down)
                                                : const Icon(Icons.keyboard_arrow_up))
                                      ],
                                    ),
                                    trailing: controller.isEdit
                                        ? CustomFilledButton(
                                            color: successColor,
                                            icon: IconlyBold.plus,
                                            title: " Add",
                                            fontSize: 13,
                                            width: Get.width / 5,
                                            onPressed: () {
                                              index == 1 || index == 4 || index == 5
                                                  ? Get.off(
                                                      controller.items[index]['screen'],
                                                      arguments: {
                                                        'purposeID': controller.purposeID,
                                                        'codeDocument': controller.codeDocument,
                                                        'formEdit': true,
                                                      },
                                                    )
                                                  : Get.to(
                                                      controller.items[index]['screen'],
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
                            const Divider(height: 1, thickness: 1),
                            controller.items[index]['title'] == "Traveller Guest"
                                ? controller.items[index]['showList']
                                    ? Column(
                                        children: [
                                          CustomTripCard(
                                            listNumber: 1,
                                            title: controller.travellerName ?? "",
                                            subtitle: controller.travellerSN ?? "",
                                            info: "Traveller",
                                            content: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Gender", style: listTitleTextStyle),
                                                    Text(controller.travellerGender == "L" ? "Male" : "Female", style: listSubTitleTextStyle),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Hotel Fare", style: listTitleTextStyle),
                                                    Text("${int.parse(controller.travellerHotel ?? "0").toCurrency()}", style: listSubTitleTextStyle),
                                                  ],
                                                ),
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Text("Flight Entitlement", style: listTitleTextStyle),
                                                    Text(controller.travellerFlight ?? "", style: listSubTitleTextStyle),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                              children: controller.guestList.isNotEmpty
                                                  ? controller.guestList
                                                      .mapIndexed(
                                                        (i, e) => CustomTripCard(
                                                          listNumber: i + 2,
                                                          title: e.nameGuest.toString(),
                                                          subtitle: e.nik,
                                                          info: "Guest",
                                                          isEdit: controller.isEdit,
                                                          editAction: () => Get.to(
                                                            const AddGuestScreen(),
                                                            arguments: {
                                                              'purposeID': controller.purposeID,
                                                              'guestID': e.id,
                                                              'formEdit': true,
                                                            },
                                                          )?.then((_) {
                                                            controller.fetchList();
                                                            controller.update();
                                                          }),
                                                          isDelete: controller.isEdit,
                                                          deleteAction: () {
                                                            controller.deleteGuest(int.parse(e.id.toString()));
                                                            controller.update();
                                                            print(e.id);
                                                          },
                                                          content: Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Text("Gender", style: listTitleTextStyle),
                                                                  Text(e.gender == "L" ? "Male" : "Female", style: listSubTitleTextStyle),
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
                                                    ]),
                                        ],
                                      )
                                    : Container()
                                : controller.items[index]['title'] == "Airliness"
                                    ? controller.items[index]['showList']
                                        ? Column(
                                            children: controller.airlinessList.isNotEmpty
                                                ? controller.airlinessList
                                                    .mapIndexed((i, e) => CustomTripCard(
                                                          listNumber: i + 1,
                                                          title: e.employeeName.toString(),
                                                          subtitle: controller.dateFormat.format(DateTime.parse(e.createdAt.toString())).toString(),
                                                          info: e.flightNo,
                                                          isEdit: controller.isEdit,
                                                          editAction: () {
                                                            Get.off(CheckScheduleScreen(), arguments: {
                                                              'id': e.id?.toInt(),
                                                              'purposeID': controller.purposeID,
                                                              'codeDocument': controller.codeDocument,
                                                              'formEdit': true,
                                                            });
                                                          },
                                                          isDelete: controller.isEdit,
                                                          deleteAction: () => controller.deleteAirliness(int.parse(e.id.toString())),
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
                                    : controller.items[index]['title'] == "Taxi Voucher"
                                        ? controller.items[index]['showList']
                                            ? Column(
                                                children: controller.tvList.isNotEmpty
                                                    ? controller.tvList
                                                        .mapIndexed(
                                                          (i, e) => CustomTripCard(
                                                            listNumber: i + 1,
                                                            title: e.employeeName.toString(),
                                                            subtitle: controller.dateFormat.format(DateTime.parse(e.date!)),
                                                            status: e.status.toString(),
                                                            info: int.parse(e.amount.toString()).toCurrency(),
                                                            isEdit: controller.isEdit,
                                                            editAction: () => Get.to(const EditTaxiVoucherScreen(),
                                                                    arguments: {'purposeID': controller.purposeID, 'id': e.id, 'formEdit': true})
                                                                ?.then((_) {
                                                              controller.fetchList();
                                                              controller.update();
                                                            }),
                                                            isDelete: controller.isEdit,
                                                            deleteAction: () => controller.deleteTaxiVoucher(int.parse(e.id.toString())),
                                                            content: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text("Departure", style: listTitleTextStyle),
                                                                    Text(e.nameDepartureCity.toString(), style: listSubTitleTextStyle),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                  children: [
                                                                    Text("Arrival", style: listTitleTextStyle),
                                                                    Text(e.nameArrivalCity.toString(), style: listSubTitleTextStyle),
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
                                        : controller.items[index]['title'] == "Other Transportation"
                                            ? controller.items[index]['showList']
                                                ? Column(
                                                    children: controller.otList.isNotEmpty
                                                        ? controller.otList
                                                            .mapIndexed(
                                                              (i, e) => CustomTripCard(
                                                                listNumber: i + 1,
                                                                title: e.employeeName.toString(),
                                                                subtitle: e.typeTransportation.toString(),
                                                                status: e.status.toString(),
                                                                info: e.cityName.toString(),
                                                                isEdit: controller.isEdit,
                                                                editAction: () => Get.to(EditOtherTransportScreen(), arguments: {
                                                                  'purposeID': controller.purposeID,
                                                                  'codeDocument': controller.codeDocument,
                                                                  'otID': e.id,
                                                                  'formEdit': true,
                                                                })?.then((result) {
                                                                  controller.fetchList();
                                                                  controller.update();
                                                                  print(result);
                                                                }),
                                                                isDelete: controller.isEdit,
                                                                deleteAction: () => controller.deleteOtherTransport(int.parse(e.id.toString())),
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
                                            : controller.items[index]['title'] == "Accommodation"
                                                ? controller.items[index]['showList']
                                                    ? Column(
                                                        children: controller.accommodationsList.isNotEmpty
                                                            ? controller.accommodationsList
                                                                .mapIndexed(
                                                                  (i, e) => CustomTripCard(
                                                                    listNumber: i + 1,
                                                                    title: e.employeeName.toString(),
                                                                    status: e.status.toString(),
                                                                    info: e.hotelName,
                                                                    isEdit: controller.isEdit,
                                                                    editAction: () => Get.off(const EditAccommodationScreen(), arguments: {
                                                                      'purposeID': controller.purposeID,
                                                                      'codeDocument': controller.codeDocument,
                                                                      'id': e.id,
                                                                      'formEdit': true,
                                                                    })?.then((result) {
                                                                      controller.fetchList();
                                                                      controller.update();
                                                                      print(result);
                                                                    }),
                                                                    isDelete: controller.isEdit,
                                                                    deleteAction: () => controller.deleteAccommodation(e.id!.toInt()),
                                                                    content: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("Check In", style: listTitleTextStyle),
                                                                            Text(e.checkInDate.toString(), style: listSubTitleTextStyle),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("Check Out", style: listTitleTextStyle),
                                                                            Text(e.checkOutDate.toString(), style: listSubTitleTextStyle),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("Price", style: listTitleTextStyle),
                                                                            Text(e.price.toString(), style: listSubTitleTextStyle),
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
                                                : controller.items[index]['title'] == "Cash Advance"
                                                    ? controller.items[index]['showList']
                                                        ? Column(
                                                            children: controller.caList.isNotEmpty
                                                                ? controller.caList
                                                                    .mapIndexed((i, e) => CustomTripCard(
                                                                          listNumber: i + 1,
                                                                          title: e.noCa ?? "",
                                                                          subtitle: controller.dateFormat
                                                                              .format(DateTime.parse(e.createdAt.toString()))
                                                                              .toString(),
                                                                          status: e.status.toString(),
                                                                          info:
                                                                              "${e.currencyCode} ${int.parse(e.grandTotal.toString()).toCurrency()}",
                                                                          isEdit: controller.isEdit,
                                                                          editAction: () {
                                                                            Get.to(
                                                                              () => const AddCashAdvanceTravelScreen(),
                                                                              arguments: {
                                                                                "id": e.id,
                                                                                "formEdit": true,
                                                                                'purposeID': controller.purposeID,
                                                                                'codeDocument': controller.codeDocument,
                                                                              },
                                                                            )?.then((value) => controller.fetchList());
                                                                          },
                                                                          isDelete: controller.isEdit,
                                                                          content: Row(
                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                            children: [
                                                                              Column(
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Text("Item", style: listTitleTextStyle),
                                                                                  Text(e.itemCount.toString(), style: listSubTitleTextStyle),
                                                                                ],
                                                                              ),
                                                                              SizedBox(
                                                                                width: Get.width / 3,
                                                                                child: Column(
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Text("Reference", style: listTitleTextStyle),
                                                                                    Text(e.noRequestTrip.toString(),
                                                                                        style: listSubTitleTextStyle.copyWith(
                                                                                            overflow: TextOverflow.ellipsis)),
                                                                                  ],
                                                                                ),
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
                        if (controller.isApproval == true) {
                          return Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: Get.width / 4,
                                child: EasyStepper(
                                  activeStep: controller.activeStep,
                                  lineLength: 75,
                                  direction: Axis.vertical,
                                  stepShape: StepShape.circle,
                                  stepBorderRadius: 10,
                                  borderThickness: 2,
                                  showTitle: false,
                                  finishedStepBackgroundColor: infoColor,
                                  activeStepBorderColor: Colors.blue,
                                  activeStepIconColor: Colors.blue,
                                  unreachedStepBorderColor: Colors.blue,
                                  unreachedStepIconColor: Colors.blue,
                                  showLoadingAnimation: false,
                                  padding: EdgeInsetsDirectional.only(top: 10),
                                  steps: const [
                                    EasyStep(
                                      icon: Icon(Icons.groups),
                                    ),
                                    EasyStep(
                                      icon: Icon(Icons.groups),
                                    ),
                                    EasyStep(
                                      icon: Icon(Icons.groups),
                                    ),
                                  ],
                                  // onStepReached: (index) {
                                  //   controller.activeStep = index;
                                  //   controller.update();
                                  // },
                                ),
                              ),
                              Column(
                                children: [
                                  CustomApprovalInfoCard(
                                    name: "Rayhan ",
                                    position: "Atasan",
                                    message: "was approve your document",
                                    approvalDate: DateTime.now(),
                                  ),
                                  const CustomApprovalInfoCard(
                                    status: "Waiting ",
                                    name: "Arya ",
                                    position: "HR",
                                    message: "approve your document",
                                  ),
                                  const CustomApprovalInfoCard(
                                    status: "Waiting ",
                                    name: "Melisa",
                                    position: "GA",
                                    message: "approve your document",
                                  ),
                                ],
                              )
                            ],
                          );
                        }
                        return null;
                      },
                      childCount: controller.isDetail == true ? controller.items.length : 1, // 1000 list items
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
