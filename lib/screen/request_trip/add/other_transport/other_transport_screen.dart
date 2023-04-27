import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtripcard.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/request_trip/add/other_transport/add/add_other_transport_screen.dart';
import 'package:gais/screen/request_trip/add/other_transport/other_transport_controller.dart';
import 'package:get/get.dart';

class OtherTransportScreen extends StatelessWidget {
  const OtherTransportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OtherTransportController>(
        init: OtherTransportController(),
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
                      child:
                          SvgPicture.asset("assets/icons/car.svg", height: 25),
                    ),
                    Text("Other Transportation", style: appTitle),
                    SizedBox(height: 14),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text("Other Transportation",
                          style: listTitleTextStyle,
                          textAlign: TextAlign.start),
                    ),
                    CustomTripCard(
                      listNumber: 1,
                      title: "Jack H",
                      subtitle: "SSB Pool Car",
                      status: "Pending",
                      info: "Surabaya",
                      isEdit: true,
                      isDelete: true,
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("From Date", style: listTitleTextStyle),
                              Text("21/03/23", style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("To Date", style: listTitleTextStyle),
                              Text("23/03/23",
                                  style: listSubTitleTextStyle),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Quantity", style: listTitleTextStyle),
                              Text("1", style: listSubTitleTextStyle),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: CustomFilledButton(
                        color: infoColor,
                        title: "Add Other Transportation",
                        icon: Icons.add,
                        onPressed: ()=> Get.to(AddOtherTransportScreen()),
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
                          onPressed: () => Get.to(AccommodationScreen()),
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
