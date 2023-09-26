import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/avatar/custom_avatar_network.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/profil/myprofile/line_approval/line_approval_screen.dart';
import 'package:gais/screen/profil/myprofile/my_profile_screen/my_profile_screen.dart';
import 'package:gais/screen/profil/myprofile/myprofile_main_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/image/image_util.dart';
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
                      return CustomAvatarNetwork(
                        size: 180,
                        name: controller.name.value,
                        imagePath: controller.image.value,
                        fontSize: 80,
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
                            onPressed: () async {
                              showDialog(
                                  context: context,
                                  builder: (context) => Dialog(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        ListTile(
                                          title: const Text(
                                            'Choose from gallery',
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                          leading: const Icon(Icons.image),
                                          onTap: () async {
                                            Get.back();
                                            final imageFile = await ImageUtil().selectImageFromGallery();
                                            controller.changePhoto(imageFile?.path);
                                          },
                                        ),
                                        ListTile(
                                          title: const Text(
                                            'Choose from camera',
                                            style: TextStyle(fontSize: 16, color: Colors.black),
                                          ),
                                          leading: const Icon(Icons.camera_alt),
                                          onTap: () async {
                                            Get.back();
                                            final imageFile = await ImageUtil().selectImageFromCamera();
                                            controller.changePhoto(imageFile?.path);
                                          },
                                        )
                                      ],
                                    ),
                                  ));
                            },
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
