import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/screen/profil/profil_controller.dart';
import 'package:get/get.dart';

class ProfilScreen extends StatelessWidget {
  const ProfilScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfilController>(
        init: ProfilController(),
        builder: (controller) {
          return Container(
            margin: EdgeInsets.only(top: 8, left: 6, right: 6),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
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
                      margin: EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                          color: Color(0xffF6DE9D),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    Text("Reza M \n123239201", style: appTitle)
                  ],
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.person, color: blackColor,),
                        title: Text(
                          "My Profile",
                          style: listTitleTextStyle,
                        ),
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
