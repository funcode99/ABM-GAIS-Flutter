import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/document_delivery/form_document_delivery/form_document_delivery_controller.dart';
import 'package:gais/util/color/color_util.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

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
                      minHeight: controller.codeStatusDoc.toString() == "4" ? 140 : 180,
                      maxHeight: 32,
                      child: Container(
                        color: whiteColor,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  if(controller.status!=null)
                                    CustomStatusContainer(
                                      backgroundColor: ColorUtil.getStatusColorByText("${controller.status}"),
                                      status: "${controller.status}",
                                    )
                                ],
                              ),
                            ),
                            Text(
                              controller.noDocument.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                if(!controller.isEdit && controller.showButtonCancel)
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.openCancelDialog();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(75, 30),
                                        backgroundColor: redColor),
                                    child: Text("Cancel".tr),
                                  ),
                                if(controller.showButtonEdit)
                                  OutlinedButton(
                                  onPressed: () {
                                    controller.isEdit = !controller.isEdit;
                                    controller.update();
                                  },
                                  style: OutlinedButton.styleFrom(
                                    minimumSize: const Size(75, 30),
                                  ),
                                  child: controller.isEdit
                                      ? Text("Cancel".tr)
                                      : Text("Edit".tr),
                                ),
                                if(controller.isEdit)
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.saveDocument();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(75, 30),
                                        backgroundColor: orangeColor),
                                    child: Text("Save".tr),
                                  ),
                                if(!controller.isEdit && controller.showButtonReceived)
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.receivedDocument();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(75, 30),
                                        backgroundColor: successColor),
                                    child: Text("Received".tr),
                                  ),
                                if(!controller.isEdit && controller.showButtonDelivering)
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.deliveringDocument();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(75, 30),
                                        backgroundColor: successColor),
                                    child: Text("Delivering".tr),
                                  ),
                                if(!controller.isEdit && controller.showButtonDelivered)
                                  ElevatedButton(
                                    onPressed: () {
                                      controller.deliveredDocument();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        minimumSize: const Size(75, 30),
                                        backgroundColor: successColor),
                                    child: Text("Delivered".tr),
                                  )
                              ],
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            const Divider(
                              height: 20,
                              color: greyColor,
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
                              controller.codeStatusDoc == "3"
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
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 7,
                              spreadRadius: 1,
                              offset: const Offset(0, 4),
                            )
                          ],
                          color: infoColor,
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                        ),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(top: 10, left: 5),
                                width: 100,
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.selectedTab ==
                                      TabEnum.detail
                                      ? whiteColor
                                      : neutralColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  gradient: LinearGradient(stops: const [
                                    0.1,
                                    0
                                  ], colors: [
                                    controller.selectedTab == TabEnum.detail
                                        ? blackColor
                                        : whiteColor,
                                    Colors.white
                                  ]),
                                ),
                                child: const Text("Detail"),
                              ),
                              onTap: () {
                                controller.selectedTab = TabEnum.detail;
                                controller.update();
                              },
                            ),
                            GestureDetector(
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16),
                                alignment: Alignment.center,
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: controller.selectedTab ==
                                      TabEnum.approval
                                      ? whiteColor
                                      : neutralColor,
                                  borderRadius: const BorderRadius.only(
                                      topRight: Radius.circular(8),
                                      topLeft: Radius.circular(8)),
                                  gradient: LinearGradient(stops: const [
                                    0.1,
                                    0
                                  ], colors: [
                                    controller.selectedTab ==
                                        TabEnum.approval
                                        ? blackColor
                                        : whiteColor,
                                    Colors.white
                                  ]),
                                ),
                                child: const Text("Log"),
                              ),
                              onTap: () {
                                controller.selectedTab = TabEnum.approval;
                                controller.update();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverList(
                    // SliverToBoxAdapter(
                    delegate: SliverChildListDelegate([
                      if(controller.selectedTab == TabEnum.detail)
                        Form(
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
                                CustomDropDownFormField(
                                  items: controller.receiverList
                                      .map((e) => DropdownMenuItem(
                                    value: e.id.toString(),
                                    onTap: () {
                                      controller.location.text = e.siteName.toString();
                                      controller.company.text = e.companyName.toString();
                                      controller.receiverSiteID = e.idSite.toString();
                                      controller.receiverCompanyID = e.idCompany?.toString();
                                      controller.receiverID = e.id?.toString();
                                      controller.update();
                                    },
                                    child: Text(e.employeeName.toString()),
                                  ))
                                      .toList(),
                                  label: "Receiver",
                                  hintText: "Receiver",
                                  isRequired: true,
                                  readOnly: true,
                                  selectedItem: controller.receiverName,
                                  value: controller.selectedReceiver,
                                  onChanged: (value) {
                                    controller.selectedReceiver = value;
                                    controller.update();
                                  },
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
                                  readOnly: true,
                                  selectedItem: controller.receiverCompany,
                                  value: controller.receiverCompanyID.toString(),
                                  onChanged: (value) {
                                    controller.receiverCompanyID = value!.toString();
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
                                  value: controller.receiverSiteID.toString(),
                                  readOnly: true,
                                  selectedItem: controller.receiverSite,
                                  onChanged: (value) {
                                    controller.receiverSiteID = value;
                                    controller.fetchReceiverList(value!);
                                    controller.update();
                                  },
                                ),
                                const SizedBox(height: 8),
                                CustomTextFormField(
                                  controller: controller.subjectDocument,
                                  label: "Subject Document",
                                  isRequired: true,
                                  readOnly: true,
                                ),
                                const SizedBox(height: 8),
                                if(!controller.isEdit)
                                  CustomTextFormField(
                                  readOnly: true,
                                  backgroundColor: neutralColor,
                                  controller: controller.attachment,
                                  label: "Attachment (Optional)".tr,
                                  onTap: controller.isValidAttachmentPath() ? () async {
                                    String path = controller.attachmentPath ?? "";
                                    if (path.toString()
                                        .isImageFileName) {
                                      Get.dialog(Dialog(
                                        child: Padding(
                                          padding: const EdgeInsets
                                              .symmetric(
                                              horizontal: 16,
                                              vertical: 16),
                                          child: Image.network(
                                              path.toString()),
                                        ),
                                      ));
                                    } else {
                                      if (!await launchUrl(Uri.parse(
                                          path.toString()))) {
                                        throw Exception(
                                            'Could not launch ${path.toString()}');
                                      }
                                    }
                                  } : null,
                                ),
                                if(controller.isEdit)
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
                        ),
                      if(controller.selectedTab == TabEnum.approval)
                        controller.listLogApproval.isEmpty
                            ? const DataEmpty()
                            : ApprovalLogList(list: controller.listLogApproval, waitingApprovalValue: 0,)

                    ]),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
