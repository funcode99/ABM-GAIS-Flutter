import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/actualization_trip/approval_actualization_trip_controller.dart';
import 'package:gais/screen/approval/actualization_trip/history/approval_history_actualization_trip_list_screen.dart';
import 'package:gais/screen/approval/actualization_trip/list/approval_actualization_trip_list_screen.dart';
import 'package:get/get.dart';

class ApprovalActualizationTripScreen extends StatelessWidget {
  const ApprovalActualizationTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ApprovalActualizationTripController controller = Get.put(ApprovalActualizationTripController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            Get.back(result: true);
          },
        ),
        backgroundColor: whiteColor,
        title: Text("Approval Actualization Trips".tr, style: appTitle),
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
                  ApprovalActualizationTripListScreen(),
                  ApprovalHistoryActualizationTripListScreen(),
                ],
              )
          )
        ],
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );

  }
}
