import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/document_delivery/form_document_delivery/form_document_delivery_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

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
                      minHeight: 100,
                      maxHeight: 32,
                      child: Container(
                        color: whiteColor,
                        child: Column(
                          children: [
                            Text("Document No. 123231", style: appTitle),
                            SizedBox(height: 10),
                            SingleChildScrollView(
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
                                        Text("Created",
                                            style:
                                                TextStyle(color: whiteColor)),
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
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: controller.isReceived
                                              ? successColor
                                              : whiteColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(24),
                                            bottomRight: Radius.circular(8),
                                          ),
                                          border: Border.all(
                                              color: controller.isReceived
                                                  ? Colors.transparent
                                                  : blackColor)),
                                      child: Row(
                                        children: [
                                          Text("Received",
                                              style: TextStyle(
                                                  color: controller.isReceived
                                                      ? whiteColor
                                                      : blackColor)),
                                          controller.isReceived
                                              ? Icon(
                                                  Icons
                                                      .check_circle_outline_sharp,
                                                  color: whiteColor,
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      controller.isReceived = true;
                                      controller.update();
                                    },
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: controller.isDelivering
                                              ? successColor
                                              : whiteColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(24),
                                            bottomRight: Radius.circular(8),
                                          ),
                                          border: Border.all(
                                              color: controller.isDelivering
                                                  ? Colors.transparent
                                                  : blackColor)),
                                      child: Row(
                                        children: [
                                          Text("Delivering",
                                              style: TextStyle(
                                                  color: controller.isDelivering
                                                      ? whiteColor
                                                      : blackColor)),
                                          controller.isDelivering
                                              ? Icon(
                                                  Icons
                                                      .check_circle_outline_sharp,
                                                  color: whiteColor,
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      controller.isDelivering = true;
                                      controller.update();
                                    },
                                  ),
                                  GestureDetector(
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 5),
                                      decoration: BoxDecoration(
                                          color: controller.isDelivered
                                              ? successColor
                                              : whiteColor,
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8),
                                            bottomLeft: Radius.circular(24),
                                            bottomRight: Radius.circular(8),
                                          ),
                                          border: Border.all(
                                              color: controller.isDelivered
                                                  ? Colors.transparent
                                                  : blackColor)),
                                      child: Row(
                                        children: [
                                          Text("Delivered",
                                              style: TextStyle(
                                                  color: controller.isDelivered
                                                      ? whiteColor
                                                      : blackColor)),
                                          controller.isDelivered
                                              ? Icon(
                                                  Icons
                                                      .check_circle_outline_sharp,
                                                  color: whiteColor,
                                                )
                                              : Container()
                                        ],
                                      ),
                                    ),
                                    onTap: (){
                                      controller.isDelivered = true;
                                      controller.update();
                                    },
                                  ),

                                ],
                              ),
                            )
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
                              RichText(
                                text: TextSpan(
                                  text: 'Created Date ',
                                  style: listTitleTextStyle,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                              TextField(
                                controller: controller.createdDate,
                              ),
                              SizedBox(height: 8),
                              RichText(
                                text: TextSpan(
                                  text: 'Created By ',
                                  style: listTitleTextStyle,
                                  children: const <TextSpan>[
                                    TextSpan(
                                        text: '*',
                                        style: TextStyle(color: Colors.red)),
                                  ],
                                ),
                              ),
                              TextField(
                                controller: controller.createdBy,
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
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8)),
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
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(8),
                                    topLeft: Radius.circular(8)),
                                gradient: LinearGradient(
                                    stops: [0.1, 0],
                                    colors: [blackColor, whiteColor]),
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
                        return Padding(
                          padding: const EdgeInsets.all(38),
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
                            ],
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
