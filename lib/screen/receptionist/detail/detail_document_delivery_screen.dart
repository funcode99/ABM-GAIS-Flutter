import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/receptionist/detail/detail_document_delivery_controller.dart';
import 'package:get/get.dart';

class DetailDocumentDeliveryScreen extends StatelessWidget {
  const DetailDocumentDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailDocumentDeliveryController>(
        init: DetailDocumentDeliveryController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("List Document Delivery", style: appTitle),
              leading: CustomBackButton(),
            ),
            body: Container(
              margin: EdgeInsets.only(top: 6, left: 7, right: 7),
              padding: EdgeInsets.only(top: 18),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: CustomScrollView(
                slivers: [
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 140,
                      maxHeight: 32,
                      child: Container(
                        color: whiteColor,
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: successColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(24),
                                            bottomRight: Radius.circular(8),
                                          )),
                                      child: Row(
                                        children: [
                                          Text("Created", style: TextStyle(color: whiteColor)),
                                          Icon(
                                            Icons.check_circle_outline_sharp,
                                            color: whiteColor,
                                          )
                                        ],
                                      ),
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: controller.isReceived ? successColor : whiteColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(24),
                                              bottomRight: Radius.circular(8),
                                            ),
                                            border: Border.all(color: controller.isReceived ? Colors.transparent : blackColor)),
                                        child: Row(
                                          children: [
                                            Text("Received", style: TextStyle(color: controller.isReceived ? whiteColor : blackColor)),
                                            controller.isReceived
                                                ? Icon(
                                              Icons.check_circle_outline_sharp,
                                              color: whiteColor,
                                            )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.isEdit == true) {
                                          controller.codeStatusDoc = 1;
                                          controller.isReceived = true;
                                        }
                                        controller.update();
                                      },
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: controller.isDelivering ? successColor : whiteColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(24),
                                              bottomRight: Radius.circular(8),
                                            ),
                                            border: Border.all(color: controller.isDelivering ? Colors.transparent : blackColor)),
                                        child: Row(
                                          children: [
                                            Text("Delivering", style: TextStyle(color: controller.isDelivering ? whiteColor : blackColor)),
                                            controller.isDelivering
                                                ? Icon(
                                              Icons.check_circle_outline_sharp,
                                              color: whiteColor,
                                            )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.isEdit == true) {
                                          controller.codeStatusDoc = 2;
                                          controller.isDelivering = true;
                                        }
                                        controller.update();
                                      },
                                    ),
                                    GestureDetector(
                                      child: Container(
                                        padding: EdgeInsets.all(8),
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: controller.isDelivered ? successColor : whiteColor,
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(8),
                                              topRight: Radius.circular(8),
                                              bottomLeft: Radius.circular(24),
                                              bottomRight: Radius.circular(8),
                                            ),
                                            border: Border.all(color: controller.isDelivered ? Colors.transparent : blackColor)),
                                        child: Row(
                                          children: [
                                            Text("Delivered", style: TextStyle(color: controller.isDelivered ? whiteColor : blackColor)),
                                            controller.isDelivered
                                                ? Icon(
                                              Icons.check_circle_outline_sharp,
                                              color: whiteColor,
                                            )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.isEdit == true) {
                                          controller.codeStatusDoc = 3;
                                          controller.isDelivered = true;
                                        }
                                        controller.update();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text("Document No. 123231/ ${controller.ddID}", style: appTitle),
                            Row(
                              mainAxisAlignment: !controller.isEdit ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly,
                              children: [
                                CustomFilledButton(
                                  color: whiteColor,
                                  width: Get.width / 4,
                                  borderColor: infoColor,
                                  fontColor: infoColor,
                                  title: controller.isEdit ? "Cancel" : "Edit",
                                  onPressed: () {
                                    controller.isEdit = controller.isEdit == false ? true : false;
                                    controller.update();
                                  },
                                ),
                                controller.isEdit
                                    ? CustomFilledButton(
                                        color: successColor,
                                        width: Get.width / 4,
                                        title: "Save",
                                        onPressed: () {
                                          if (controller.formKey.currentState?.validate() == true) {
                                            controller.saveDocument();
                                          }
                                        },
                                      )
                                    : Container(),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 55),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomTextFormField(
                                controller: controller.createdDate,
                                label: "Created Date",
                                isRequired: true,
                                readOnly: true,
                              ),
                              SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.createdBy,
                                label: "Created By",
                                isRequired: true,
                                readOnly: true,
                              ),
                              SizedBox(height: 8),
                            ],
                          ),
                        );
                      },
                      childCount: 1, // 1000 list items
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: SliverAppBarDelegate(
                      minHeight: 50,
                      maxHeight: 32,
                      child: Container(
                        decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(top: 10, left: 5),
                              width: 100,
                              height: 50,
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                gradient: LinearGradient(stops: [0.1, 0], colors: [blackColor, whiteColor]),
                              ),
                              child: Text("Detail"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    // SliverToBoxAdapter(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Form(
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
                                SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.receiverName,
                                  label: "Receiver",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.location,
                                  label: "Location",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.company,
                                  label: "Receiver Company",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.subjectDocument,
                                  label: "Subject Document",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.attachment,
                                  label: "Attachment (Optional)",
                                  readOnly: true,
                                ),
                                SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.remarks,
                                  label: "Remarks",
                                  multiLine: true,
                                  readOnly: true,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: 1, // 1000 list items
                    ),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
