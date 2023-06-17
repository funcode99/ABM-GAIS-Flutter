import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/screen/approval/request_atk/list/approval_request_atk_list_screen.dart';
import 'package:gais/screen/approval/request_trip/request_trip_list/approval_request_trip_list_screen.dart';
import 'package:gais/screen/fss/booking_meeting_room/list/booking_meeting_room_list_screen.dart';
import 'package:gais/screen/fss/dashboard_meeting_room/dashboard_meeting_room_screen.dart';
import 'package:gais/screen/fss/management_item_atk/list/management_item_atk_list_screen.dart';
import 'package:gais/screen/fss/management_meeting_room/list/management_meeting_room_screen.dart';
import 'package:gais/screen/fss/request_atk/list/request_atk_list_screen.dart';
import 'package:gais/screen/fss/document_delivery/document_delivery_list/document_delivery_list_screen.dart';
import 'package:gais/screen/fss/stock_in/list/stock_in_list_screen.dart';
import 'package:gais/screen/menu/menu_controller.dart';
import 'package:gais/screen/menu/submenu_screen.dart';
import 'package:gais/screen/receptionist/list/list_document_delivery_screen.dart';
import 'package:gais/screen/tms/request_trip/request_trip_list/request_trip_list_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MenuGaisController>(
        init: MenuGaisController(),
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
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Travel Management System", style: listTitleTextStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                    ImageConstant.locationTick,
                                    height: 25,
                                  ),
                                ),
                                Text("Request Trip", style: menuSubTitleTextStyle),
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
                                    ImageConstant.car,
                                    height: 25,
                                  ),
                                ),
                                Text("Pool Car", style: menuSubTitleTextStyle),
                              ],
                            ),
                            onTap: () {},
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
                                    ImageConstant.emptyWalletTime,
                                    height: 25,
                                  ),
                                ),
                                Text("Cash Advance", style: menuSubTitleTextStyle),
                              ],
                            ),
                            onTap: () => Get.to(() => const SubmenuScreen(), arguments: false),
                          ),
                        ],
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
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text("Facility Service System", style: listTitleTextStyle),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const BookingMeetingRoomListScreen());
                            },
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
                                    ImageConstant.calendarTick,
                                    height: 25,
                                  ),
                                ),
                                Text(
                                  "Booking\nMeeting Room",
                                  textAlign: TextAlign.center,
                                  style: menuSubTitleTextStyle,
                                )
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => const DashboardMeetingRoomScreen());
                            },
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
                                    ImageConstant.calendar,
                                    height: 25,
                                  ),
                                ),
                                Text("Dashboard\nMeeting Room", textAlign: TextAlign.center, style: menuSubTitleTextStyle)
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(const RequestATKListScreen());
                            },
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
                                    ImageConstant.rulerNpen,
                                    height: 25,
                                  ),
                                ),
                                Text("${"ATK Request".tr}\n", textAlign: TextAlign.center, style: menuSubTitleTextStyle)
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
                                    ImageConstant.smsTracking,
                                    height: 25,
                                  ),
                                ),
                                Text("Document\nDelivery", textAlign: TextAlign.center, style: menuSubTitleTextStyle)
                              ],
                            ),
                            onTap: () => Get.off(DocumentDeliveryListScreen()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              controller.approvalAuth
                  ? Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Approval", style: listTitleTextStyle),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                          ImageConstant.locationTick,
                                          height: 25,
                                        ),
                                      ),
                                      Text("Request Trip", style: menuSubTitleTextStyle),
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
                                          ImageConstant.emptyWalletTime,
                                          height: 25,
                                        ),
                                      ),
                                      Text("Cash Advance", style: menuSubTitleTextStyle),
                                    ],
                                  ),
                                  onTap: () => Get.to(const SubmenuScreen(), arguments: true),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.to(const ApprovalRequestATKListScreen());
                                  },
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
                                          ImageConstant.rulerNpen,
                                          height: 25,
                                        ),
                                      ),
                                      Text("ATK Request".tr, textAlign: TextAlign.center, style: menuSubTitleTextStyle)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Facility Service System".tr, style: listTitleTextStyle),
                      const SizedBox(
                        height: 4,
                      ),
                      Text("ATK Supplies".tr, style: listSubTitleTextStyle),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.to(const ManagementItemATKListScreen());
                              },
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
                                      ImageConstant.editSquare,
                                      height: 25,
                                    ),
                                  ),
                                  Text("Management Item".tr, textAlign: TextAlign.center, style: menuSubTitleTextStyle)
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.to(const StockInListScreen());
                              },
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
                                      ImageConstant.paperPlus,
                                      height: 25,
                                    ),
                                  ),
                                  Text("Stock In".tr, textAlign: TextAlign.center, style: menuSubTitleTextStyle)
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
              controller.receptionis
                  ? Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Document Delivery", style: listTitleTextStyle),
                            Text("List Document Delivery", style: listSubTitleTextStyle),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 18),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
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
                                            ImageConstant.smsTracking,
                                            height: 25,
                                          ),
                                        ),
                                        Text("Document\nDelivery", textAlign: TextAlign.center, style: menuSubTitleTextStyle),
                                      ],
                                    ),
                                    onTap: () => Get.to(const ListDocumentDeliveryScreen()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Facility Service System", style: listTitleTextStyle),
                      Text("Meeting Room", style: listSubTitleTextStyle),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                      ImageConstant.editSquare,
                                      height: 25,
                                    ),
                                  ),
                                  Text("Management\nMeeting Room", textAlign: TextAlign.center, style: menuSubTitleTextStyle),
                                ],
                              ),
                              onTap: () => Get.to(const ManagementMeetingRoomScreen()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
