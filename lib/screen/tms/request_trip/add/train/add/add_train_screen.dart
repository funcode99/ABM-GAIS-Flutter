import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/antavaya/get_train_station_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/train/add/add_train_controller.dart';
import 'package:gais/screen/tms/request_trip/add/train/train_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';

class AddTrainScreen extends StatelessWidget {
  const AddTrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTrainController>(
        init: AddTrainController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Train", style: appTitle),
              leading: CustomBackButton(
                onPressed: () => controller.back(),
              ),
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
                      child: const Icon(Icons.train_rounded, color: whiteColor),
                    ),
                    Text("Train", style: appTitle),
                    const SizedBox(height: 14),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropDownFormField(
                              label: "Traveller",
                              hintText: controller.isLoading ? "Loading..." : "Traveller",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || controller.traveller.text.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              value: controller.traveller.text.isNotEmpty ? controller.traveller.text : null,
                              items: controller.travellerList
                                  .map((e) => DropdownMenuItem(
                                        value: e.nameGuest,
                                        child: Text("${e.nameGuest.toString()} "),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.traveller.text = value.toString() ?? '';
                                print(controller.traveller.text);
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomDropDownFormField(
                              label: "Origin Station",
                              hintText: controller.isLoading ? "Loading..." : "Station",
                              value: controller.originStation,
                              items: controller.stationList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text("${e.cityName} - ${e.stationName}"),
                                      ))
                                  .toList(),
                              isRequired: true,
                              validator: (value) {
                                if (value == null || controller.originStation == null) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                controller.originStation = value!;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomDropDownFormField(
                              label: "Destination Station",
                              hintText: controller.isLoading ? "Loading..." : "Station",
                              value: controller.destinationStation,
                              items: controller.stationList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text("${e.cityName} - ${e.stationName}"),
                                      ))
                                  .toList(),
                              isRequired: true,
                              validator: (value) {
                                if (value == null || controller.originStation == null) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                controller.destinationStation = value!;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 16),

                            CustomTextFormField(
                              controller: controller.departureDate,
                              label: "Departure Date",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              suffixIcon: const Icon(Icons.calendar_month),
                              readOnly: true,
                              onTap: () => showDatePicker(
                                      context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: controller.lastDate)
                                  .then(
                                (date) {
                                  controller.dateDeparture = date!;
                                  controller.departureDate.text = controller.dateFormat.format(date);
                                  controller.update();
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            // const CustomFormLabel(
                            //   label: "Round Trip",
                            //   showRequired: true,
                            // ),
                            // Switch(
                            //   value: controller.roundTrip,
                            //   activeColor: infoColor,
                            //   onChanged: (bool value) {
                            //     controller.roundTrip = value;
                            //     controller.update();
                            //   },
                            // ),
                            // CustomTextFormField(
                            //   controller: controller.returnDate,
                            //   label: "Return Date",
                            //   isRequired: true,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "This field is required";
                            //     }
                            //     return null;
                            //   },
                            //   suffixIcon: const Icon(Icons.calendar_month),
                            //   readOnly: true,
                            //   onTap: () => showDatePicker(
                            //           context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: controller.lastDate)
                            //       .then(
                            //     (date) {
                            //       controller.dateReturn = date!;
                            //       controller.returnDate.text = controller.dateFormat.format(date);
                            //       controller.update();
                            //     },
                            //   ),
                            // ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  width: 100,
                                  color: Colors.transparent,
                                  borderColor: infoColor,
                                  title: "Cancel",
                                  fontColor: infoColor,
                                  onPressed: () => controller.back(),
                                ),
                                CustomFilledButton(
                                  width: 100,
                                  color: infoColor,
                                  title: controller.isBooking == true ? "Check" : "Save",
                                  onPressed: () {
                                    if (controller.formKey.currentState?.validate() == true) controller.save();
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
