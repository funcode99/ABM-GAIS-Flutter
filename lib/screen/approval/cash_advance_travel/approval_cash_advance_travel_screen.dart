import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/cash_advance_travel/approval_cash_advance_travel_controller.dart';
import 'package:gais/screen/approval/cash_advance_travel/history/approval_history_cash_advance_travel_list_screen.dart';
import 'package:gais/screen/approval/cash_advance_travel/list/approval_cash_advance_travel_list_screen.dart';
import 'package:get/get.dart';

class ApprovalCashAdvanceTravelScreen extends StatelessWidget {
  const ApprovalCashAdvanceTravelScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApprovalCashAdvanceTravelController controller = Get.put(ApprovalCashAdvanceTravelController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            Get.back(result: true);
          },
        ),
        backgroundColor: whiteColor,
        title: Text("approval_cash_advance_travel".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, left: 16,right: 16),
            decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(10)
            ),
            child: TabBar(
              controller: controller.tabController,
              labelColor: infoColor,
              unselectedLabelColor: greyColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(
                  text: "Approval",
                ),
                Tab(
                  text: "Approval History",
                ),
              ],
            ),
          ),
          Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: const [
                  ApprovalCashAdvanceTravelListScreen(),
                  ApprovalHistoryCashAdvanceTravelListScreen(),
                ],
              )
          )
        ],
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );

  }
}
