import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/cash_advance_non_travel/approval_cash_advance_non_travel_screen.dart';
import 'package:gais/screen/approval/cash_advance_non_travel/list/approval_cash_advance_non_travel_list_screen.dart';
import 'package:gais/screen/approval/cash_advance_travel/approval_cash_advance_travel_screen.dart';
import 'package:gais/screen/approval/cash_advance_travel/list/approval_cash_advance_travel_list_screen.dart';
import 'package:gais/screen/menu/submenu_controller.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/list/cash_advance_non_travel_list_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/list/cash_advance_travel_list_screen.dart';
import 'package:get/get.dart';

class SubmenuScreen extends StatelessWidget {
  const SubmenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubmenuController>(
        init: SubmenuController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Menu", style: appTitle),
              leading: CustomBackButton(),
            ),
            body: ListView(
              children: [
                Card(
                  elevation: 5,
                  margin: const EdgeInsets.all(10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Travel Management System",
                            style: listTitleTextStyle),
                        Text("Cash Advance",
                            style: listSubTitleTextStyle.copyWith(
                                color: greyColor)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 80),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: infoColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(top: 25),
                                      height: 50,
                                      width: 50,
                                      child: SvgPicture.asset(
                                        ImageConstant.airplane,
                                        height: 25,
                                      ),
                                    ),
                                    const Text("Travel")
                                  ],
                                ),
                                onTap: () => controller.approval
                                    ? Get.to(() =>
                                        const ApprovalCashAdvanceTravelScreen())
                                    : Get.to(
                                        () => CashAdvanceTravelListScreen()),
                              ),
                              GestureDetector(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: infoColor,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      padding: const EdgeInsets.all(10),
                                      margin: const EdgeInsets.only(top: 25),
                                      height: 50,
                                      width: 50,
                                      child: SvgPicture.asset(
                                        ImageConstant.ticketStar,
                                        height: 25,
                                      ),
                                    ),
                                    const Text("Non Travel")
                                  ],
                                ),
                                onTap: () => controller.approval
                                    ? Get.to(() =>
                                        const ApprovalCashAdvanceNonTravelScreen())
                                    : Get.to(() =>
                                        const CashAdvanceNonTravelListScreen()),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
