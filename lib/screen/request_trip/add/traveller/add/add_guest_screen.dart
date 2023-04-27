import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/request_trip/add/traveller/add/add_guest_controller.dart';
import 'package:get/get.dart';

class AddGuestScreen extends StatelessWidget {
  const AddGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddGuestController>(
        init: AddGuestController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Guest as Traveller", style: appTitle),
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
                      child: Icon(Icons.groups, color: whiteColor),
                    ),
                    Text("Guest", style: appTitle),
                    SizedBox(height: 20),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Type of Traveller ',
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
                              hint: Text("Type"),
                              value: controller.type,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.type = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Name ',
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
                              hint: Text("Name"),
                              value: controller.name,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.name = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Gender ',
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
                              hint: Text("Gender"),
                              value: controller.gender,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("Male"),
                                  value: "Male",
                                ),
                                DropdownMenuItem(
                                  child: Text("Female"),
                                  value: "Female",
                                ),
                              ],
                              onChanged: (value) {
                                controller.gender = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'SN ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.sn,
                              decoration: InputDecoration(
                                hintText: "SN",
                                hintStyle: hintTextStyle,
                              ),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Contact No ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.contact,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "Contact No",
                                hintStyle: hintTextStyle,
                              ),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Department ',
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
                              hint: Text("Department"),
                              value: controller.department,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.department = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Company ',
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
                              hint: Text("Company"),
                              value: controller.company,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.company = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Hotel Fare ',
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
                              hint: Text("Max Fare"),
                              value: controller.hotelFare,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.hotelFare = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Flight Entitlement ',
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
                              hint: Text("Flight Entitlement"),
                              value: controller.flight,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.flight = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Notes ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.notes,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              decoration: InputDecoration(
                                hintText: "Notes",
                                hintStyle: hintTextStyle,
                              ),
                            ),
                            SizedBox(height: 8),
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
                                  title: "Save",
                                  onPressed: () {},
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
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
