import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/avatar/custom_avatar_network.dart';
import 'package:gais/screen/profil/myprofile/myprofile_main_screen.dart';
import 'package:gais/screen/profil/profil_controller.dart';
import 'package:get/get.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ProfilController controller = Get.put(
        ProfilController());

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
          Obx(() {
            return Row(
              children: [
                CustomAvatarNetwork(
                  size: 100,
                  name: controller.userName.value,
                  imagePath: controller.image.value,
                  fontSize: 50,
                ),
                const SizedBox(
                  width: 20,
                ),
                Text("${controller.userName ?? "Name"} \n${controller.userSN ??
                    "serial number"}", style: appTitle)
              ],
            );
          }),
          SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.person, color: blackColor,),
                  title: Text(
                    "My Profile",
                    style: listTitleTextStyle,
                  ),
                  onTap: () {
                    Get.to(() => const MyProfileMainScreen());
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
  }
}
