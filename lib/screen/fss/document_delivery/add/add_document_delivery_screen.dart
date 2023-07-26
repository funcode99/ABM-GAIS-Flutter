import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/document_delivery/add/add_document_delivery_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddDocumentDeliveryScreen extends StatelessWidget {
  const AddDocumentDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddDocumentDeliveryController>(
        init: AddDocumentDeliveryController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Document Delivery Info", style: appTitle),
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
                    Text("Document Delivery", style: appTitle),
                    const SizedBox(height: 39),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: controller.sender,
                              label: "Sender",
                              isRequired: true,
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Receiver Company",
                              hintText: controller.loadCompany ? "Loading..." : "Receiver Company",
                              isRequired: true,
                              items: controller.companyList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.companyName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.receiverCompanyID = value!.toInt();
                                controller.fetchLocationList(value);
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Location",
                              hintText: controller.loadLocation ? "Loading..." : "Location",
                              isRequired: true,
                              items: controller.locationList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.siteName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.receiverSiteID = value!.toInt();
                                controller.fetchReceiverList(value);
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Receiver",
                              hintText: controller.loadReceiver ? "Loading..." : "Receiver",
                              isRequired: true,
                              items: controller.receiverList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.employeeName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedReceiver = value;
                                controller.receiverID = value!.toInt();
                                print(controller.receiverID);
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.subjectDocument,
                              label: "Subject Document",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.attachment,
                              label: "Attachment (Optional)",
                              suffixIcon: const Icon(Icons.upload),
                              readOnly: true,
                              onTap: (){
                                controller.getSingleFile();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.remarks,
                              label: "Remarks",
                              multiLine: true,
                            ),
                            Center(
                              child: CustomFilledButton(
                                width: Get.width / 2,
                                color: successColor,
                                title: "Save",
                                onPressed: () {
                                  if (controller.formKey.currentState?.validate() == true) {
                                    controller.saveDocument();
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
