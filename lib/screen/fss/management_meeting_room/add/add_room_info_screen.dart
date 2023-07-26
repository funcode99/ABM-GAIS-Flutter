import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/management_meeting_room/add/add_room_info_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddRoomInfoScreen extends StatelessWidget {
  const AddRoomInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddRoomInfoController>(
        init: AddRoomInfoController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Management\nMeeting Room", style: appTitle, textAlign: TextAlign.center),
              leading: const CustomBackButton(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(color: whiteColor, borderRadius: BorderRadius.circular(8)),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: const Icon(IconlyBold.info_square, color: whiteColor),
                    ),
                    Text(controller.isEdit ? "Edit Room Info" : "Room Info", style: appTitle),
                    const SizedBox(height: 39),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropDownFormField(
                              // controller: controller.companyID,
                              label: "Company",
                              hintText: controller.loadCompany ? "Loading..." : "Company",
                              isRequired: true,
                              items: controller.companyList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.companyName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.companyID.text = value!;
                                controller.fetchSiteList(value);
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              // controller: controller.siteID,
                              label: "Site",
                              hintText: controller.loadSite ? "Loading..." : "Site",
                              isRequired: true,
                              items: controller.siteList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.siteName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value){
                                controller.siteID.text = value!;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.mrName,
                              label: "Name Meeting Room",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.mrCode,
                              label: "Code Meeting Room",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.capacity,
                              label: "Capacity",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.floor,
                              label: "Floor",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              items: const [
                                DropdownMenuItem(
                                  value: "Available",
                                  child: Text("Available"),
                                ),
                                DropdownMenuItem(
                                  value: "Booked",
                                  child: Text("Booked"),
                                ),
                              ],
                              label: "Available Status",
                              isRequired: true,
                              onChanged: (value) {
                                controller.availableStatus.text = value!;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            // CustomTextFormField(
                            //   controller: controller.remarks,
                            //   label: "Remarks",
                            //   multiLine: true,
                            // ),
                            Center(
                              child: CustomFilledButton(
                                width: Get.width / 2,
                                color: successColor,
                                title: "Save",
                                onPressed: () {
                                  if (controller.formKey.currentState?.validate() == true) {
                                    controller.saveMeetingRoom();
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
