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
              leading: CustomBackButton(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(7),
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
                      child: Icon(IconlyBold.info_square, color: whiteColor),
                    ),
                    Text(controller.isEdit ? "Edit Room Info" : "Room Info", style: appTitle),
                    SizedBox(height: 39),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: controller.company,
                              label: "Company",
                              isRequired: true,
                            ),
                            SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.site,
                              label: "Site",
                              isRequired: true,
                            ),
                            SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.company,
                              label: "ID Meeting Room",
                              isRequired: true,
                            ),
                            SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.capacity,
                              label: "Capacity",
                              isRequired: true,
                            ),
                            SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.floor,
                              label: "Floor",
                              isRequired: true,
                            ),
                            SizedBox(height: 8),
                            CustomDropDownFormField(
                              items: [
                                DropdownMenuItem(child: Text(""), value: "",)
                              ],
                              label: "Available Status",
                              isRequired: true,
                              onChanged: (value) {

                              },
                            ),
                            SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.remarks,
                              label: "Remarks",
                              multiLine: true,
                            ),
                            Center(
                              child: CustomFilledButton(
                                width: Get.width/2,
                                color: successColor,
                                title: "Save",
                                onPressed: (){
                                  if(controller.formKey.currentState?.validate() == true){
                                    // controller.saveDocument();
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
            bottomNavigationBar: BottomBar(menu: 0),
          );
        });
  }
}
