import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/add/add_accommodation_controller.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/check_accommodation/check_accommodation_screen.dart';
import 'package:get/get.dart';

class AddAccommodationScreen extends StatelessWidget {
  const AddAccommodationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAccommodationController>(
        init: AddAccommodationController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Accommodation", style: appTitle),
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
                      child: SvgPicture.asset("assets/icons/building.svg",
                          height: 25),
                    ),
                    Text("Accommodation", style: appTitle),
                    SizedBox(height: 14),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'Traveller ',
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
                              value: controller.traveller,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.traveller = value;
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
                            TextFormField(
                              decoration: InputDecoration(hintText: "Max fare"),
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
                            SizedBox(height: 35),
                            Text("Requested Accommodation",
                                style: listTitleTextStyle),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Checkin ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: controller.departureDate,
                              decoration: InputDecoration(
                                  hintText: "Date",
                                  suffixIcon: Icon(Icons.keyboard_arrow_down)),
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(DateTime.now().year),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 30)))
                                  .then((date) {
                                controller.selectedDate = date!;
                                controller.departureDate.text =
                                    controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Checkout ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '*',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              readOnly: true,
                              controller: controller.departureDate,
                              decoration: InputDecoration(
                                  hintText: "Date",
                                  suffixIcon: Icon(Icons.keyboard_arrow_down)),
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(DateTime.now().year),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 30)))
                                  .then((date) {
                                controller.selectedDate = date!;
                                controller.departureDate.text =
                                    controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Accommodation Type ',
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
                              value: controller.arrival,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.arrival = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            RichText(
                              text: TextSpan(
                                text: 'Remarks ',
                                style: listTitleTextStyle,
                                children: const <TextSpan>[
                                  TextSpan(
                                      text: '',
                                      style: TextStyle(color: Colors.red)),
                                ],
                              ),
                            ),
                            TextFormField(
                              controller: controller.remarks,
                              decoration: InputDecoration(hintText: "Remarks"),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  value: controller.isSharing,
                                  onChanged: (bool? value) {
                                    controller.isSharing = value!;
                                    controller.update();
                                  },
                                ),
                                Text("Sharing with", style: listTitleTextStyle)
                              ],
                            ),
                            DropdownButtonFormField(
                              icon: Icon(Icons.keyboard_arrow_down),
                              hint: Text("Name"),
                              value: controller.arrival,
                              isExpanded: true,
                              // underline: SizedBox(),
                              items: [
                                DropdownMenuItem(
                                  child: Text("name"),
                                  value: "value",
                                ),
                              ],
                              onChanged: (value) {
                                controller.arrival = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            Text("Create GL?", style: listTitleTextStyle),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.white,
                                  value: controller.createGL,
                                  onChanged: (bool? value) {
                                    controller.createGL = value!;
                                    controller.update();
                                  },
                                ),
                                Text("Yes", style: listTitleTextStyle)
                              ],
                            ),
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
                                  title: "Check",
                                  onPressed: () => Get.to(CheckAccommodationScreen()),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 1),
          );
        });
  }
}
