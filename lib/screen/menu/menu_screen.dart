import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/screen/approval/request_trip/request_trip_list/approval_request_trip_list_screen.dart';
import 'package:gais/screen/menu/menu_controller.dart';
import 'package:gais/screen/menu/submenu_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuController>(
        init: MenuController(),
        builder: (controller) {
          return ListView(
            children: [
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Travel Management System",
                          style: listTitleTextStyle),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/location-tick.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text("Request Trip"),
                                ],
                              ),
                              onTap: () => Get.off(const RequestTripListScreen()),
                            ),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/car.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text("Pool Car"),
                                ],
                              ),
                              onTap: (){},
                            ),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/empty-wallet-time.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text("Cash Advance"),
                                ],
                              ),
                              onTap: ()=> Get.off(const SubmenuScreen()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Facility Service System",
                          style: listTitleTextStyle),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/calendar-tick.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text(
                                    "Booking\nMeeting Room",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/ruler&pen.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text(
                                    "Request ATK\n",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/sms-tracking.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text(
                                    "Document\nDelivery",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Approval",
                          style: listTitleTextStyle),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/location-tick.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text("Request Trip"),
                                ],
                              ),
                              onTap: () => Get.off(const ApprovalRequestTripListScreen()),
                            ),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/empty-wallet-time.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text("Cash Advance"),
                                ],
                              ),
                              onTap: ()=> Get.off(const SubmenuScreen()),
                            ),
                            GestureDetector(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: infoColor,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: const EdgeInsets.all(10),
                                    margin: const EdgeInsets.only(top: 25, bottom: 5),
                                    height: 50,
                                    width: 50,
                                    child: SvgPicture.asset(
                                      "assets/icons/ruler&pen.svg",
                                      height: 25,
                                    ),
                                  ),
                                  const Text(
                                    "Request ATK",
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
