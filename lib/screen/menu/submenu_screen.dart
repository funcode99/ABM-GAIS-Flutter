import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/menu/submenu_controller.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/approval/list/approval_cash_advance_non_travel_list_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/cash_advance_non_travel_list/cash_advance_non_travel_list_screen.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_travel/cash_advance_travel_list/cash_advance_travel_list_screen.dart';
import 'package:get/get.dart';

class SubmenuScreen extends StatelessWidget {
  const SubmenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubmenuController>(
      init: SubmenuController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Menu", style: appTitle),
            centerTitle: true,
            leading: CustomBackButton(),
            flexibleSpace: const TopBar(),
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
                  padding:
                  const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Travel Management System",
                          style: listTitleTextStyle),
                      Text("Cash Advance", style: listSubTitleTextStyle.copyWith(color: greyColor)),
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
                                    height: 50, width: 50,
                                    child: SvgPicture.asset("assets/icons/airplane.svg", height: 25,),
                                  ),
                                  const Text("Travel")
                                ],
                              ),
                              onTap: () => Get.off(const CashAdvanceTravelListScreen()),
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
                                    height: 50, width: 50,
                                    child: SvgPicture.asset("assets/icons/Ticket Star.svg", height: 25,),
                                  ),
                                  const Text("Non Travel")
                                ],
                              ),
                              onTap: () => Get.off(const CashAdvanceNonTravelListScreen()),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Text("Cash Advance (For Approval, temporary)", style: listSubTitleTextStyle.copyWith(color: greyColor)),
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
                                    height: 50, width: 50,
                                    child: SvgPicture.asset("assets/icons/airplane.svg", height: 25,),
                                  ),
                                  const Text("Travel")
                                ],
                              ),
                              onTap: () => Get.off(const CashAdvanceTravelListScreen()),
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
                                    height: 50, width: 50,
                                    child: SvgPicture.asset("assets/icons/Ticket Star.svg", height: 25,),
                                  ),
                                  const Text("Non Travel")
                                ],
                              ),
                              onTap: () => Get.off(const ApprovalCashAdvanceNonTravelListScreen()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: const BottomBar(menu: 1),
        );
      }
    );
  }
}
