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
import 'package:gais/screen/fss/document_delivery/form_document_delivery/form_document_delivery_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';

class FormDocumentDeliveryScreen extends StatelessWidget {
  const FormDocumentDeliveryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FormDocumentDeliveryController>(
        init: FormDocumentDeliveryController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Document Delivery", style: appTitle),
              leading: const CustomBackButton(),
            ),
            body: Container(
              margin: const EdgeInsets.only(top: 6, left: 7, right: 7),
              padding: const EdgeInsets.only(top: 18),
              decoration: const BoxDecoration(
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
                              margin: const EdgeInsets.only(bottom: 10),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      decoration: const BoxDecoration(
                                          color: successColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(24),
                                            bottomRight: Radius.circular(8),
                                          )),
                                      child: const Row(
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
                                        padding: const EdgeInsets.all(8),
                                        margin: const EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: controller.isReceived ? successColor : whiteColor,
                                            borderRadius: const BorderRadius.only(
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
                                                ? const Icon(
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
                                        padding: const EdgeInsets.all(8),
                                        margin: const EdgeInsets.symmetric(horizontal: 5),
                                        decoration: BoxDecoration(
                                            color: controller.isDelivering ? successColor : whiteColor,
                                            borderRadius: const BorderRadius.only(
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
                                                ? const Icon(
                                                    Icons.check_circle_outline_sharp,
                                                    color: whiteColor,
                                                  )
                                                : Container()
                                          ],
                                        ),
                                      ),
                                      onTap: () {
                                        if (controller.isEdit == true && controller.codeStatusDoc == 1) {
                                          controller.codeStatusDoc = 2;
                                          controller.isDelivering = true;
                                        }
                                        controller.update();
                                      },
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: controller.isDelivered ? successColor : whiteColor,
                                          borderRadius: const BorderRadius.only(
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
                                              ? const Icon(
                                                  Icons.check_circle_outline_sharp,
                                                  color: whiteColor,
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Text(
                              controller.noDocument.toString(),
                              style: appTitle,
                              textAlign: TextAlign.center,
                            ),
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
                                    if (controller.codeStatusDoc != 2) {
                                      controller.isEdit = controller.isEdit == false ? true : false;
                                      !controller.isEdit ? controller.fetchEdit() : null;
                                      controller.update();
                                    } else {
                                      Get.showSnackbar(const GetSnackBar(
                                        icon: Icon(
                                          Icons.error,
                                          color: Colors.white,
                                        ),
                                        message: "Unable to edit document",
                                        isDismissible: true,
                                        duration: Duration(seconds: 3),
                                        backgroundColor: Colors.red,
                                      ));
                                    }
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
                              const SizedBox(height: 8),
                              CustomTextFormField(
                                controller: controller.createdBy,
                                label: "Created By",
                                isRequired: true,
                                readOnly: true,
                              ),
                              const SizedBox(height: 8),
                              controller.codeStatusDoc == 3
                                  ? CustomTextFormField(
                                      controller: controller.receivedBy,
                                      label: "Received By",
                                      isRequired: true,
                                      readOnly: true,
                                    )
                                  : Container(),
                              const SizedBox(height: 8),
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
                        decoration: const BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.only(top: 10, left: 5),
                              width: 100,
                              height: 50,
                              decoration: const BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.only(topRight: Radius.circular(8), topLeft: Radius.circular(8)),
                                gradient: LinearGradient(stops: [0.1, 0], colors: [blackColor, whiteColor]),
                              ),
                              child: const Text("Detail"),
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
                            padding: const EdgeInsets.symmetric(horizontal: 34, vertical: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.sender,
                                  label: "Sender",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 8),
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
                                  readOnly: !controller.isEdit,
                                  selectedItem: controller.receiverCompany,
                                  value: controller.receiverCompanyID.toString(),
                                  onChanged: (value) {
                                    controller.receiverCompanyID = value!.toInt();
                                    controller.fetchLocationList(value.toInt());
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
                                  value: controller.receiverSiteID.toString(),
                                  readOnly: !controller.isEdit,
                                  selectedItem: controller.receiverSite,
                                  onChanged: (value) {
                                    controller.receiverSiteID = value;
                                    controller.fetchReceiverList(value!);
                                    controller.update();
                                  },
                                ),
                                const SizedBox(height: 8),
                                CustomDropDownFormField(
                                  items: controller.receiverList
                                      .map((e) => DropdownMenuItem(
                                            value: e.id.toString(),
                                            onTap: () {
                                              controller.location.text = e.siteName.toString();
                                              controller.company.text = e.companyName.toString();
                                              controller.receiverSiteID = e.idSite.toString();
                                              controller.receiverCompanyID = e.idCompany?.toInt();
                                              controller.receiverID = e.id?.toInt();
                                              controller.update();
                                            },
                                            child: Text(e.employeeName.toString()),
                                          ))
                                      .toList(),
                                  label: "Receiver",
                                  hintText: "Receiver",
                                  isRequired: true,
                                  readOnly: !controller.isEdit,
                                  selectedItem: controller.receiverName,
                                  value: controller.selectedReceiver,
                                  onChanged: (value) {
                                    controller.selectedReceiver = value;
                                    controller.update();
                                  },
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.subjectDocument,
                                  label: "Subject Document",
                                  isRequired: true,
                                  readOnly: !controller.isEdit,
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.attachment,
                                  label: "Attachment (Optional)",
                                  suffixIcon: !controller.isEdit ? null : const Icon(Icons.upload),
                                  readOnly: true,
                                  onTap: () {
                                    if (controller.isEdit == true) controller.getSingleFile();
                                  },
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.remarks,
                                  label: "Remarks",
                                  multiLine: true,
                                  readOnly: !controller.isEdit,
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
