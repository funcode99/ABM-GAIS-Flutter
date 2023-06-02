import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/add/add_guest_screen.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/traveller_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:get/get.dart';

class TravellerScreen extends StatelessWidget {
  const TravellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AirlinesController>(
        init: AirlinesController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Request Trip", style: appTitle),
              leading: const CustomBackButton(result: true),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: const Icon(Icons.groups, color: whiteColor),
                    ),
                    Text("Traveller", style: appTitle),
                    const SizedBox(height: 14),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text("Traveller", style: formlabelTextStyle, textAlign: TextAlign.start),
                    ),
                    CustomTripCard(
                      listNumber: 1,
                      title: controller.travellerName ?? "",
                      subtitle: controller.travellerSN ?? "",
                      info: "Requestor",
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
                    const SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: Text("Guest", style: formlabelTextStyle, textAlign: TextAlign.start),
                    ),
                    Column(
                      children: controller.guestList.isNotEmpty
                          ? controller.guestList
                              .mapIndexed(
                                (i, e) => CustomTripCard(
                                  listNumber: i + 1,
                                  title: e.nameGuest.toString(),
                                  subtitle: e.nik,
                                  info: "Guest",
                                  isEdit: true,
                                  editAction: () => Get.to(const AddGuestScreen(), arguments: {
                                    'purposeID': controller.purposeID,
                                    'codeDocument': controller.codeDocument,
                                    'guestID': e.id,
                                    'isEdit': true,
                                  })?.then((_) {
                                    controller.getGuestList();
                                    controller.update();
                                  }),
                                  isDelete: true,
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
                                          Text("${int.parse(e.hotelFare.toString()).toCurrency()}", style: listSubTitleTextStyle),
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
                          : [const Text("no data yet")],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFilledButton(
                        color: infoColor,
                        title: "Add Guest",
                        icon: Icons.add,
                        onPressed: () => Get.to(AddGuestScreen(), arguments: {
                          'purposeID': controller.purposeID,
                          'travellerID': controller.travellerID,
                          'formEdit': controller.formEdit,
                        })?.then((_) {
                          controller.getGuestList();
                          controller.update();
                        }),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomFilledButton(
                          width: 100,
                          color: Colors.transparent,
                          borderColor: infoColor,
                          title: "Back",
                          fontColor: infoColor,
                          onPressed: () => Get.back(result: true),
                        ),
                        CustomFilledButton(width: 100, color: infoColor, title: "Next", onPressed: () => controller.next()),
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
