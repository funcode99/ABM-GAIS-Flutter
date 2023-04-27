import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/purpose_of_trip/purpose_of_trip_controller.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/traveller_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class PurposeOfTripScreen extends StatelessWidget {
  const PurposeOfTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurposeOfTripController>(
        init: PurposeOfTripController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              title: Text("Request Trip", style: appTitle),
              centerTitle: true,
              leading: CustomBackButton(),
              flexibleSpace: TopBar(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(IconlyBold.work, color: whiteColor),
                    ),
                    Text("Purpose Of Trip", style: appTitle),
                    SizedBox(height: 39),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Purpose of Trip ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            DropdownButtonFormField(
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text("Company Business"),
                              value: controller.purposeValue,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Company Business"),
                                  value: "Company Business",
                                ),
                                DropdownMenuItem(
                                  child: Text("Field Break"),
                                  value: "Field Break",
                                ),
                                DropdownMenuItem(
                                  child: Text("Site Visit"),
                                  value: "Site Visit",
                                ),
                                DropdownMenuItem(
                                  child: Text("Taxi Voucher Only"),
                                  value: "Taxi Voucher",
                                ),
                              ],
                              onChanged: (value) {
                                controller.purposeValue = value;
                                value == "Field Break" || value == "Site Visit"
                                    ? controller.isAttachment = true
                                    : controller.isAttachment = false;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            controller.isAttachment!
                                ? RichText(
                                    text: TextSpan(
                                      text: 'File Attachment ',
                                      style: listTitleTextStyle,
                                      children: const <TextSpan>[
                                        TextSpan(
                                            text: '*',
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ],
                                    ),
                                  )
                                : Container(),
                            controller.isAttachment!
                                ? TextFormField(
                                    controller: controller.fileName,
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      hintText:
                                          "Upload Form ${controller.purposeValue}",
                                      hintStyle: hintTextStyle,
                                      suffixIcon: Icon(Icons.upload),
                                    ),
                                    onTap: () => controller.getSingleFile(),
                                  )
                                : Container(),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Notes to Purpose of Trip ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.notesPurpose,
                              decoration: InputDecoration(
                                  hintText: "Notes", hintStyle: hintTextStyle),
                            ),
                            SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  width: 100,
                                  color: Colors.transparent,
                                  borderColor: infoColor,
                                  title: "Back",
                                  fontColor: infoColor,
                                  onPressed: () => Get.back(),
                                ),
                                CustomFilledButton(
                                  width: 100,
                                  color: infoColor,
                                  title: "Next",
                                  onPressed: () => Get.to(TravellerScreen()),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomSheet: BottomBar(menu: 1),
          );
        });
  }
}
