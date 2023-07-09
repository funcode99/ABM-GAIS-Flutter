import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/menu/poolcar_menu_controller.dart';
import 'package:gais/screen/tms/pool_car/list/pool_car_list_screen.dart';
import 'package:gais/screen/tms/pool_car/management_poolcar/list/management_poolcar_list_screen.dart';
import 'package:get/get.dart';

class PoolcarMenuScreen extends StatelessWidget {
  const PoolcarMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PoolcarMenuController>(
        init: PoolcarMenuController(),
        builder: (controller) {
          return Scaffold(
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
                    padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Travel Management System", style: listTitleTextStyle),
                        Text("Pool Car", style: listSubTitleTextStyle.copyWith(color: greyColor)),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                        ImageConstant.carEdit,
                                        height: 25,
                                      ),
                                    ),
                                    const Text("Management\nPool Car", textAlign: TextAlign.center)
                                  ],
                                ),
                                onTap: () => Get.to(() => ManagementPoolCarListScreen()),
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
                                        ImageConstant.car,
                                        height: 25,
                                      ),
                                    ),
                                    const Text(
                                      "Pool Car\nRequest",
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                onTap: () => Get.to(() => const PoolCarListScreen(), arguments: false),
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
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
