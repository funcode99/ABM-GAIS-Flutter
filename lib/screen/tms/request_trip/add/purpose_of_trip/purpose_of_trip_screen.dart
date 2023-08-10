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
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
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
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
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
                              hintText: controller.isLoading ? "Loading..." : "Purpose of Trip",
                              // value: controller.selectedPurpose,
                              items: controller.purposeList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.documentName.toString()),
                                        onTap: () {
                                          controller.selectedPurposeName = e.documentName.toString();
                                          controller.update();
                                        },
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedPurpose = value;
                                print('selected purpose : $value');
                                value == "1" || value == "2" || value == "3" || value == "5"
                                    ? controller.isAttachment = true
                                    : controller.isAttachment = false;
                                value == "3" ? controller.isDANumber = true : controller.isDANumber = false;
                                controller.update();
                                // print(controller.selectedPurpose);
                              },
                            ),
                            const SizedBox(height: 8),
                            controller.selectedPurpose == "1"
                                ? Container(
                                    margin: const EdgeInsets.only(bottom: 8),
                                    child: CustomDropDownFormField(
                                      items: controller.siteList
                                          .map((e) => DropdownMenuItem(
                                                value: e.id.toString(),
                                                child: Text(e.siteName.toString()),
                                              ))
                                          .toList(),
                                      label: "Site",
                                      isRequired: true,
                                      onChanged: (value) {
                                        controller.siteID = value!.toInt();
                                        controller.update();
                                      },
                                    ),
                                  )
                                : Container(),
                            controller.isAttachment
                                ? CustomTextFormField(
                                    controller: controller.fileName,
                                    label: 'File Attachment',
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      // if (controller.fileExtension != "pdf") {
                                      //   return "Files must be pdf";
                                      // }
                                      return null;
                                    },
                                    readOnly: true,
                                    hintText: "Upload Form ${controller.selectedPurposeName}",
                                    suffixIcon: const Icon(Icons.upload),
                                    onTap: () => controller.getSingleFile(),
                                  )
                                : Container(),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.notesPurpose,
                              label: "Notes to Purpose of Trip",
                              hintText: "Notes",
                              isRequired: true,
                            ),
                            const SizedBox(height: 10),
                            Text("Itinerary", style: formlabelTextStyle),
                            const SizedBox(height: 10),
                            CustomDropDownFormField(
                              label: "From",
                              isRequired: true,
                              hintText: controller.isLoading ? "Loading..." : "City",
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
                              // value: controller.fromCity,
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              // validator: ValidationBuilder().required().maxLength(9).minLength(9).build(),
                              label: "To",
                              isRequired: true,
                              hintText: controller.isLoading ? "Loading..." : "City",
                              // value: controller.toCity,
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.cityName.toString()),
                                        onTap: () {
                                          controller.getZonaCity();
                                        },
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.toCity = value;
                                controller.getZonaCity();
                                controller.update();
                              },
                              // value: controller.toCity != null ? controller.toCity : "",
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
                                      lastDate: DateTime.now().add(const Duration(days: 30)))
                                  .then(
                                (date) {
                                  controller.departure = date!;
                                  controller.rangeDate = controller.arrival.difference(controller.departure).inDays.toInt() + 1;
                                  controller.totalTLK.text =
                                      (controller.rangeDate.toInt() * (controller.tlkDay.text.digitOnly()).toInt()).toCurrency().toString();
                                  controller.departureDate.text = controller.dateFormat.format(date);
                                  controller.selectedDepartureDate = controller.saveDateFormat.format(date);
                                  controller.update();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.arrivalDate,
                              label: "Return Date",
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
                                  .then(
                                (date) {
                                  controller.arrival = date!;
                                  controller.rangeDate = controller.arrival.difference(controller.departure).inDays.toInt() + 1;
                                  controller.totalTLK.text =
                                      (controller.rangeDate.toInt() * (controller.tlkDay.text.digitOnly()).toInt()).toCurrency().toString();
                                  controller.arrivalDate.text = controller.dateFormat.format(date);
                                  controller.selectedArrivalDate = controller.saveDateFormat.format(date);
                                  controller.update();
                                },
                              ),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.nomorDA,
                              label: "DA Number",
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              items: controller.costCenterList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.costCenterName.toString()),
                                      ))
                                  .toList(),
                              label: "Cost Center",
                              hintText: controller.isLoading ? "Loading..." : "Cost Center",
                              isRequired: true,
                              value: controller.costCenterID,
                              onChanged: (value) {
                                controller.selectedCostCenter = value.toString();
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            // CustomTextFormField(
                            //   controller: controller.zona,
                            //   label: "Zona",
                            //   isRequired: true,
                            //   readOnly: true,
                            //   hintText: "Zona",
                            // ),
                            // const SizedBox(height: 8),
                            // CustomTextFormField(
                            //   controller: controller.tlkDay,
                            //   label: "TLK / Day",
                            //   isRequired: true,
                            //   readOnly: true,
                            //   inputType: TextInputType.number,
                            //   hintText: "TLK / Day",
                            // ),
                            // const SizedBox(height: 8),
                            // CustomTextFormField(
                            //   controller: controller.totalTLK,
                            //   label: "Total TLK",
                            //   isRequired: true,
                            //   readOnly: true,
                            //   hintText: "Total TLK",
                            // ),
                            // const SizedBox(height: 8),
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
                                    if (controller.formKey.currentState?.validate() == true) {
                                      controller.postPurposeOfTrip();
                                    }
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
            bottomSheet: const BottomBar(menu: 0),
          );
        });
  }
}
