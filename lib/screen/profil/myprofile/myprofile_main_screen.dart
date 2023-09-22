import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/profil/myprofile/line_approval/line_approval_screen.dart';
import 'package:gais/screen/profil/myprofile/my_profile_screen/my_profile_screen.dart';
import 'package:gais/screen/profil/myprofile/myprofile_main_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class MyProfileMainScreen extends StatelessWidget {
  const MyProfileMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MyProfileMainController controller = Get.put(
        MyProfileMainController());

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
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: Container(
                width: double.infinity,
                height: 200,
                alignment: Alignment.center,
                child: Stack(
                  children: [
                    Obx(() {
                      return Container(
                        width: 180,
                        height: 180,
                        clipBehavior: Clip.antiAlias,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0Xfff6de9d)
                        ),
                        child: Image.network(
                          controller.image.value,
                          fit: BoxFit.contain,
                          errorBuilder: (context, _, __) {
                            return Center(
                                child: Text(
                                  controller.name.value.getInitials() ?? "",
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 80),));
                          },
                        ),
                      );
                    }),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black54,
                        ),
                        child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {},
                            icon: const Icon(
                              Icons.edit, color: Colors.white, size: 20,)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SliverPersistentHeader(
                pinned: true,
                delegate: SliverAppBarDelegate(
                  minHeight: 50,
                  maxHeight: 100,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Obx(() {
                      return TabBar(
                        padding: EdgeInsets.zero,
                        controller: controller.tabController.value,
                        labelColor: infoColor,
                        unselectedLabelColor: greyColor,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorPadding: const EdgeInsets.symmetric(
                            horizontal: 16),
                        tabs: controller.isEmployee.value ? const [
                          Tab(
                            text: "My Profile",
                          ),
                          Tab(
                            text: "Line Approval",
                          ),
                        ] : const [
                          Tab(
                            text: "My Profile",
                          ),
                        ],
                      );
                    }),
                  ),
                )
            ),
          ];
        },
        body: Obx(() {
          return TabBarView(
            controller: controller.tabController.value,
            children: controller.isEmployee.value ? const [
              MyProfileScreen(),
              LineApprovalScreen(),
            ] : const [
              MyProfileScreen(),
            ],
          );
        }),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
