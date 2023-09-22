import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/profil/myprofile/line_approval/line_approval_screen.dart';
import 'package:gais/screen/profil/myprofile/my_profile_screen/my_profile_screen.dart';
import 'package:gais/screen/profil/myprofile/myprofile_main_controller.dart';
import 'package:get/get.dart';

class MyProfileMainScreen extends StatelessWidget {
  const MyProfileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyProfileMainController controller = Get.put(MyProfileMainController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        leading: CustomBackButton(
          onPressed: () {
            Get.back(result: true);
          },
        ),
        backgroundColor: whiteColor,
        title: Text("Profile".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150,
            child: CircleAvatar(
              child: Image.network(
                "https://images.unsplash.com/photo-1614283233556-f35b0c801ef1?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c2lkZSUyMHByb2ZpbGV8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
                height: 1000,
                width: 1000,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10, left: 16,right: 16),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: TabBar(
              padding: EdgeInsets.zero,
              controller: controller.tabController,
              labelColor: infoColor,
              unselectedLabelColor: greyColor,
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: const [
                Tab(
                  text: "My Profile",
                ),
                Tab(
                  text: "Line Approval",
                ),
              ],
            ),
          ),
          SizedBox(
            height: 32,
          ),
          Expanded(
              child: TabBarView(
                controller: controller.tabController,
                children: const [
                  MyProfileScreen(),
                  LineApprovalScreen(),
                ],
              )
          )
        ],
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );

  }
}
