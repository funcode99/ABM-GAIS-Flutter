import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/screen/profil/myprofile/myprofile_main_screen.dart';
import 'package:gais/screen/profil/profil_controller.dart';
import 'package:get/get.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilController>(
        init: ProfilController(),
        builder: (controller) {
          controller.update();
          return Container(
            margin: const EdgeInsets.only(top: 8, left: 6, right: 6),
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 100,
                      width: 100,
                      margin: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: const Color(0xffF6DE9D),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Text("${controller.userName ?? "Name"} \n${controller.userSN ?? "serial number"}", style: appTitle)
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person, color: blackColor,),
                        title: Text(
                          "My Profile",
                          style: listTitleTextStyle,
                        ),
                        onTap: (){
                          Get.to(()=>const MyProfileMainScreen());
                        },
                      ),
                      ListTile(
                        title: Text(
                          "Logout",
                          style: listTitleTextStyle.copyWith(color: errorColor),
                        ),
                        onTap: () => controller.doLogout(),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
