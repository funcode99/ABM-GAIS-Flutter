import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/purpose_of_trip/purpose_of_trip_controller.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/traveller_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class PurposeOfTripScreen extends StatelessWidget {
  const PurposeOfTripScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PurposeOfTripController>(
        init: PurposeOfTripController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Request Trip", style: appTitle),
              leading: const CustomBackButton(),
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
                      decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: const Icon(IconlyBold.work, color: whiteColor),
                    ),
                    Text("Purpose Of Trip", style: appTitle),
                    const SizedBox(height: 39),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 34),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropDownFormField(
                              label: 'Purpose of Trip',
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              hintText: "pick document type",
                              items: controller.purposeList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.documentName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedPurpose = value;
                                value == "1" || value == "2"
                                    ? controller.isAttachment = true
                                    : controller.isAttachment = false;
                                controller.update();
                                // print(controller.selectedPurpose);
                              },
                            ),
                            const SizedBox(height: 8),
                            controller.isAttachment!
                                ? CustomTextFormField(
                                    controller: controller.fileName,
                                    label: 'File Attachment',
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                    readOnly: true,
                                    hintText:
                                        "Upload Form ${controller.selectedPurpose}",
                                    suffixIcon: const Icon(Icons.upload),
                                    onTap: () => controller.getSingleFile(),
                                  )
                                : Container(),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.notesPurpose,
                              label: "Notes to Purpose of Trip",
                              hintText: "Notes",
                            ),
                            const SizedBox(height: 10),
                            Text("Itinerary", style: formlabelTextStyle),
                            const SizedBox(height: 10),
                            CustomDropDownFormField(
                              label: "From",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              hintText: "City",
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.cityName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.fromCity = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "To",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              hintText: "City",
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.cityName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.toCity = value;
                                controller.getZonaCity();
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
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
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 30)))
                                  .then(
                                (date) {
                                  controller.selectedDate = date!;
                                  controller.departureDate.text =
                                      controller.dateFormat.format(date);
                                  controller.selectedDepartureDate =
                                      controller.saveDateFormat.format(date);
                                  controller.update();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.arrivalDate,
                              label: "Date Arrival",
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
                                      lastDate: DateTime.now()
                                          .add(const Duration(days: 30)))
                                  .then(
                                (date) {
                                  controller.selectedDate = date!;
                                  controller.arrivalDate.text =
                                      controller.dateFormat.format(date);
                                  controller.selectedArrivalDate =
                                      controller.saveDateFormat.format(date);
                                  controller.update();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.zona,
                              label: "Zona",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              readOnly: true,
                              hintText: "Zona",
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.tlkDay,
                              label: "TLK / Day",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              hintText: "TLK / Day",
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.totalTLK,
                              label: "Total TLK",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              hintText: "Total TLK",
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  width: 100,
                                  color: Colors.transparent,
                                  borderColor: infoColor,
                                  title: "Back",
                                  fontColor: infoColor,
                                  onPressed: () => Get.back(),
                                ),
                                CustomFilledButton(
                                  width: 100,
                                  color: infoColor,
                                  title: "Next",
                                  onPressed: () {
                                    controller.postPurposeOfTrip();
                                  },
                                )
                              ],
                            ),
                            const SizedBox(height: 50)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            bottomSheet: const BottomBar(menu: 1),
          );
        });
  }
}
