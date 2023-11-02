import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/request_trip/approval_request_trip_controller.dart';
import 'package:gais/screen/approval/request_trip/history/approval_history_request_trip_list_screen.dart';
import 'package:gais/screen/approval/request_trip/list/approval_request_trip_list_screen.dart';
import 'package:get/get.dart';

class ApprovalRequestTripScreen extends StatelessWidget {
  const ApprovalRequestTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApprovalRequestTripController controller = Get.put(ApprovalRequestTripController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            print("TEEE");
            Get.back(result: true);
          },
        ),
        backgroundColor: whiteColor,
        title: Text("Approval Request Trip", style: appTitle),
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
                  ApprovalRequestTripListScreen(),
                  ApprovalHistoryRequestTripListScreen(),
                ],
              )
          )
        ],
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );

  }
}
