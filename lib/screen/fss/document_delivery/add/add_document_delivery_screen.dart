import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/document_delivery/add/add_document_delivery_controller.dart';
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
              leading: CustomBackButton(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(7),
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
                      child: Icon(IconlyBold.info_square, color: whiteColor),
                    ),
                    Text("Document Delivery", style: appTitle),
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
                                text: 'Sender ',
                                style: formlabelTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.sender,
                              decoration: InputDecoration(
                                  hintText: "Name", hintStyle: hintTextStyle),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Receiver ',
                                style: formlabelTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            DropdownButtonFormField(
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text(
                                "Receiver",
                                style: hintTextStyle,
                              ),
                              value: controller.receiver,
                              isExpanded: true,
                              style: TextStyle(fontSize: 14, color: blackColor),
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Receiver"),
                                  value: "name",
                                )
                              ],
                              onChanged: (value) {
                                controller.receiver = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Location ',
                                style: formlabelTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            DropdownButtonFormField(
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text(
                                "Location",
                                style: hintTextStyle,
                              ),
                              value: controller.receiver,
                              isExpanded: true,
                              style: TextStyle(fontSize: 14, color: blackColor),
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Location"),
                                  value: "location",
                                )
                              ],
                              onChanged: (value) {
                                controller.receiver = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Receiver Company ',
                                style: formlabelTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.company,
                              decoration: InputDecoration(
                                hintText: "Company",
                                hintStyle: hintTextStyle,
                              ),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Subject Document ',
                                style: formlabelTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.subjectDocument,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: "Subject Document",
                                hintStyle: hintTextStyle,
                                suffixIcon: Icon(Icons.upload),
                              ),
                              onTap: () => controller.getSubjectDocument(),
                            ),
                            SizedBox(height: 8),
                            Text("Attachment (Optional)",
                                style: formlabelTextStyle),
                            TextFormField(
                              controller: controller.attachment,
                              readOnly: true,
                              decoration: InputDecoration(
                                hintText: "Subject Document",
                                hintStyle: hintTextStyle,
                                suffixIcon: Icon(Icons.upload),
                              ),
                              onTap: () => controller.getAttachment(),
                            ),
                            SizedBox(height: 8),
                            Text("Remarks", style: formlabelTextStyle),
                            TextFormField(
                              controller: controller.remarks,
                              maxLines: 3,
                              decoration: InputDecoration(
                                  hintText: "Remarks",
                                  hintStyle: hintTextStyle),
                            ),
                            Center(
                              child: CustomFilledButton(
                                width: 150,
                                color: successColor,
                                title: "Save",
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
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
