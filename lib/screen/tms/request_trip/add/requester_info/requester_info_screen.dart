import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/purpose_of_trip/purpose_of_trip_screen.dart';
import 'package:gais/screen/tms/request_trip/add/requester_info/requester_info_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class RequesterInfoScreen extends StatelessWidget {
  const RequesterInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RequesterInfoController>(
        init: RequesterInfoController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              title: Text("Request Trip", style: appTitle),
              centerTitle: true,
              leading: const CustomBackButton(),
              flexibleSpace: const TopBar(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(8)),
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
                      child: const Icon(IconlyBold.info_square, color: whiteColor),
                    ),
                    Text("Requester Info", style: appTitle),
                    const SizedBox(height: 39),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: controller.requester,
                              label: "Requestor",
                              isRequired: true,
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.sn,
                              label: "SN",
                              isRequired: true,
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.location,
                              label: "Location",
                              isRequired: true,
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.phone,
                              label: "Phone",
                              isRequired: true,
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  width: 100,
                                  color: Colors.transparent,
                                  borderColor: infoColor,
                                  title: "Cancel",
                                  fontColor: infoColor,
                                  onPressed: () => Get.back(),
                                ),
                                CustomFilledButton(
                                  width: 100,
                                  color: infoColor,
                                  title: "Next",
                                  onPressed: () => Get.to(
                                    const PurposeOfTripScreen(),
                                    arguments: {
                                      "employeeID": controller.requestorID.toString(),
                                      "siteID": controller.siteID.toString()
                                    },
                                  ),
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
            bottomSheet: const BottomBar(menu: 1),
          );
        });
  }
}
