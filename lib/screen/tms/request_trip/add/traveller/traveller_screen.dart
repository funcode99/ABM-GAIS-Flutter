import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/add/add_guest_screen.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/traveller_controller.dart';
import 'package:get/get.dart';

class TravellerScreen extends StatelessWidget {
  const TravellerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AirlinesController>(
        init: AirlinesController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Request Trip", style: appTitle),
              centerTitle: true,
              leading: CustomBackButton(),
              flexibleSpace: TopBar(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(7),
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
                      decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(Icons.groups, color: whiteColor),
                    ),
                    Text("Traveller", style: appTitle),
                    SizedBox(height: 14),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("Traveller",
                          style: listTitleTextStyle,
                          textAlign: TextAlign.start),
                    ),
                    CustomTripCard(
                      listNumber: 1,
                      title: controller.travellerName ?? "",
                      subtitle: controller.travellerSN ?? "",
                      info: "Requestor",
                      isEdit: true,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gender", style: listTitleTextStyle),
                              Text(
                                  controller.travellerGender == "L"
                                      ? "Male"
                                      : "Female",
                                  style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hotel Fare", style: listTitleTextStyle),
                              Text("700.000", style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Flight Entitlement",
                                  style: listTitleTextStyle),
                              Text("Economy", style: listSubTitleTextStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("Guest",
                          style: listTitleTextStyle,
                          textAlign: TextAlign.start),
                    ),
                    CustomTripCard(
                      listNumber: 1,
                      title: "Jack H",
                      subtitle: "2132132",
                      info: "Guest",
                      isEdit: true,
                      isDelete: true,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Gender", style: listTitleTextStyle),
                              Text("Male", style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Hotel Fare", style: listTitleTextStyle),
                              Text("700.000", style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Flight Entitlement",
                                  style: listTitleTextStyle),
                              Text("Economy", style: listSubTitleTextStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFilledButton(
                        color: infoColor,
                        title: "Add Guest",
                        icon: Icons.add,
                        onPressed: () => Get.to(AddGuestScreen()),
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
                          onPressed: () => Get.back(),
                        ),
                        CustomFilledButton(
                          width: 100,
                          color: infoColor,
                          title: "Next",
                          onPressed: () => Get.to(AirlinessScreen()),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
