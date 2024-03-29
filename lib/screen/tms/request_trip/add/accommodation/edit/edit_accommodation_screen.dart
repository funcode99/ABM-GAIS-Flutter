import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/edit/edit_accommodation_controller.dart';
import 'package:get/get.dart';

class EditAccommodationScreen extends StatelessWidget {
  const EditAccommodationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditAccommodationController>(
        init: EditAccommodationController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Accommodation", style: appTitle),
              leading: IconButton(
                  onPressed: () => Get.off(AccommodationScreen(), arguments: {
                        'purposeID': controller.purposeID,
                        'codeDocument': controller.codeDocument,
                        'formEdit': controller.formEdit,
                      }),
                  icon: Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7),
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
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(ImageConstant.building, height: 25),
                    ),
                    Text("Accommodation", style: appTitle),
                    const SizedBox(height: 14),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: controller.travellerName,
                              label: "Traveller",
                              hintText: "Name",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.hotelFare,
                              label: "Hotel Fare",
                              hintText: "Maz Fare",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.travellerGender,
                              label: "Gender",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            const SizedBox(height: 35),
                            Text("Requested Accommodation", style: formlabelTextStyle),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "City",
                              hintText: "City",
                              isRequired: true,
                              value: controller.selectedCity,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.cityName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedCity = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.checkinDate,
                              label: "Check In",
                              hintText: "Date",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              readOnly: true,
                              suffixIcon: const Icon(Icons.calendar_month),
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now().add(const Duration(days: 30)))
                                  .then((date) {
                                controller.selectedDate = date!;
                                controller.checkinDate.text = controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.checkoutDate,
                              label: "Checkout",
                              hintText: "Date",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              readOnly: true,
                              suffixIcon: const Icon(Icons.calendar_month),
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now().add(const Duration(days: 30)))
                                  .then((date) {
                                controller.selectedDate = date!;
                                controller.checkoutDate.text = controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Accommodation Type",
                              hintText: "Type",
                              isRequired: true,
                              value: controller.accommodationType,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              items: controller.hotelTypeList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.typeAccomodation.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.accommodationType = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.remarks,
                              label: "Remarks",
                              hintText: "Remarks",
                              multiLine: true,
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
                            controller.isSharing == true
                                ? CustomTextFormField(
                                    controller: controller.sharingName,
                                    label: "",
                                    hintText: "Name",
                                  )
                                : Container(),
                            const SizedBox(height: 8),
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
                                  onPressed: () => Get.off(AccommodationScreen(), arguments: {
                                    'purposeID': controller.purposeID,
                                    'codeDocument': controller.codeDocument,
                                    'formKey': controller.formEdit,
                                  }),
                                ),
                                CustomFilledButton(
                                  width: 100,
                                  color: infoColor,
                                  title: "Check",
                                  onPressed: () {
                                    if (controller.formKey.currentState?.validate() == true) controller.check();
                                  },
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
