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
import 'package:gais/screen/tms/request_trip/add/other_transport/edit/edit_other_transport_screen.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/edit/edit_taxi_voucher_screen.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/edit/edit_guest_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
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
              title: Text("Reques Trip", style: appTitle),
              leading: const CustomBackButton(),
            ),
            body: Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 6, left: 7, right: 7),
                  padding: const EdgeInsets.only(top: 18),
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
                          minHeight: 75,
                          maxHeight: 32,
                          child: Container(
                            color: whiteColor,
                            child: Column(
                              children: [
                                Text(controller.rtNumber.toString(), style: appTitle),
                                Row(
                                  mainAxisAlignment:
                                      controller.isEdit == true ? MainAxisAlignment.spaceEvenly : MainAxisAlignment.center,
                                  children: [
                                    CustomFilledButton(
                                      color: Colors.transparent,
                                      title: controller.isEdit ? "Cancel" : "Edit",
                                      borderColor: infoColor,
                                      fontColor: infoColor,
                                      height: 30,
                                      width: 100,
                                      onPressed: () {
                                        controller.isEdit = controller.isEdit == false ? true : false;
                                        controller.update();
                                      },
                                    ),
                                    controller.isEdit == true
                                        ? const CustomFilledButton(
                                            color: successColor,
                                            title: "Save",
                                            height: 30,
                                            width: 100,
                                          )
                                        : const SizedBox(),
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
                                                    // value: e.id.toString(),
                                                    value: e.codeDocument,
                                                    child: Text(e.documentName.toString()),
                                                  ))
                                              .toList(),
                                          onChanged: (value) {
                                            controller.selectedPurpose = value.toString();
                                            value == "SV" || value == "FB"
                                                ? controller.isAttachment = true
                                                : controller.isAttachment = false;
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
                                          stops: const [0.1, 0],
                                          colors: [controller.isTLK ? blackColor : whiteColor, Colors.white]),
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
                                    width: 130,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: controller.isTLK ? whiteColor : neutralColor,
                                      borderRadius:
                                          const BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                      gradient: LinearGradient(
                                          stops: const [0.1, 0],
                                          colors: [controller.isApproval ? blackColor : whiteColor, Colors.white]),
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
                                                        title: e.idEmployee.toString(),
                                                        subtitle: e.nik,
                                                        info: "Guest",
                                                        isEdit: controller.isEdit,
                                                        editAction: () => Get.to(
                                                          const EditGuestScreen(),
                                                          arguments: {
                                                            'purposeID': controller.purposeID,
                                                            'guestID': e.id,
                                                            'isEdit': true,
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
                                                              deleteAction: () =>
                                                                  controller.deleteAirliness(int.parse(e.id.toString())),
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
                                                                      Text(e.ticketPrice.toString(),
                                                                          style: listSubTitleTextStyle),
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
                                                                isEdit: controller.isEdit,
                                                                editAction: () => Get.to(const EditTaxiVoucherScreen(),
                                                                    arguments: {
                                                                      'purposeID': controller.purposeID,
                                                                      'id': e.id,
                                                                      'formEdit': true
                                                                    })?.then((_) {
                                                                  controller.fetchList();
                                                                  controller.update();
                                                                }),
                                                                isDelete: controller.isEdit,
                                                                deleteAction: () =>
                                                                    controller.deleteTaxiVoucher(int.parse(e.id.toString())),
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
                                                                    isEdit: controller.isEdit,
                                                                    editAction: () =>
                                                                        Get.to(EditOtherTransportScreen(), arguments: {
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
                                                                    deleteAction: () => controller
                                                                        .deleteOtherTransport(int.parse(e.id.toString())),
                                                                    content: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                      children: [
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("From Date", style: listTitleTextStyle),
                                                                            Text(e.fromDate.toString(),
                                                                                style: listSubTitleTextStyle),
                                                                          ],
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          children: [
                                                                            Text("To Date", style: listTitleTextStyle),
                                                                            Text(e.toDate.toString(),
                                                                                style: listSubTitleTextStyle),
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
                                                                        isEdit: controller.isEdit,
                                                                        editAction: () =>
                                                                            Get.off(const EditAccommodationScreen(), arguments: {
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
                                                                        deleteAction: () =>
                                                                            controller.deleteAccommodation(e.id!.toInt()),
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
                                                                              title: e.employeeName ?? "",
                                                                              subtitle: e.employeeName,
                                                                              status: e.status,
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
                                                                                      Text("Frequency",
                                                                                          style: listTitleTextStyle),
                                                                                      Text("2", style: listSubTitleTextStyle),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text("Currency", style: listTitleTextStyle),
                                                                                      Text(e.currencyName.toString(),
                                                                                          style: listSubTitleTextStyle),
                                                                                    ],
                                                                                  ),
                                                                                  Column(
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text("Nominal", style: listTitleTextStyle),
                                                                                      Text("60.000",
                                                                                          style: listSubTitleTextStyle),
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
                                      label: "Total Meeals",
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
                                  EasyStepper(
                                    activeStep: controller.activeStep,
                                    lineLength: 75,
                                    direction: Axis.vertical,
                                    stepShape: StepShape.circle,
                                    stepBorderRadius: 10,
                                    borderThickness: 2,
                                    showTitle: false,
                                    finishedStepBackgroundColor: infoColor,
                                    activeLineColor: infoColor,
                                    showLoadingAnimation: false,
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
                          childCount: controller.isDetail == true ? controller.requestTrip.length : 1, // 1000 list items
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    top: 6,
                    right: 6,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(color: greenColor, borderRadius: BorderRadius.circular(8)),
                      child: Text(controller.rtStatus.toString()),
                    ))
              ],
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
