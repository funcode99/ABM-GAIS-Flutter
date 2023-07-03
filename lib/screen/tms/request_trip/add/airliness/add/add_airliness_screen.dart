import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/add/add_airliness_controller.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/check_schedule/check_schedule_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';

class AddAirlinessScreen extends StatelessWidget {
  const AddAirlinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAirlinessController>(
        init: AddAirlinessController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Airliness", style: appTitle),
              leading: CustomBackButton(
                onPressed: () => controller.formEdit == true
                    ? Get.off(FormRequestTripScreen(), arguments: {
                        'id': controller.purposeID,
                        'codeDocument': controller.codeDocument,
                      })
                    : Get.off(AirlinessScreen(), arguments: {
                        'purposeID': controller.purposeID,
                        'codeDocument': controller.codeDocument,
                      }),
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
                      child: SvgPicture.asset(
                        ImageConstant.airplane,
                        height: 25,
                      ),
                    ),
                    Text("Airliness", style: appTitle),
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
                              hintText: "name",
                              isRequired: true,
                              readOnly: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.departureDate,
                              label: "Departure Date",
                              hintText: "Date",
                              isRequired: true,
                              readOnly: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              suffixIcon: const Icon(Icons.calendar_month),
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.now().add(const Duration(days: 30)))
                                  .then((date) {
                                controller.selectedDate = date!;
                                controller.departureDate.text = controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.travellerflightClass,
                              label: "Flight Class",
                              isRequired: true,
                              readOnly: true,
                            ),
                            // CustomDropDownFormField(
                            //   label: "Flight Class",
                            //   hintText: "Class",
                            //   isRequired: true,
                            //   // value: controller.flightClassID.toString(),
                            //   items: controller.flightList
                            //       .map((e) => DropdownMenuItem(
                            //             value: e.id.toString(),
                            //             child: Text(e.flightClass.toString()),
                            //           ))
                            //       .toList(),
                            //   onChanged: (value) {
                            //     controller.flightClass = value;
                            //     controller.update();
                            //     print(controller.flightClass);
                            //   },
                            // ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Departure",
                              hintText: "City",
                              isRequired: true,
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
                                controller.departure = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Arrival",
                              hintText: "City",
                              isRequired: true,
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
                                controller.arrival = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  color: Colors.transparent,
                                  fontColor: infoColor,
                                  borderColor: infoColor,
                                  title: "Cancel",
                                  width: 100,
                                  onPressed: () => controller.formEdit == true
                                      ? Get.off(FormRequestTripScreen(), arguments: {
                                          'id': controller.purposeID,
                                          'codeDocument': controller.codeDocument,
                                        })
                                      : Get.off(AirlinessScreen(), arguments: {
                                          'purposeID': controller.purposeID,
                                          'codeDocument': controller.codeDocument,
                                        }),
                                ),
                                CustomFilledButton(
                                  color: infoColor,
                                  title: "Check",
                                  width: 100,
                                  onPressed: () {
                                    if (controller.formKey.currentState?.validate() == true)
                                      Get.off(const CheckScheduleScreen(), arguments: {
                                        'purposeID': controller.purposeID,
                                        'codeDocument': controller.codeDocument,
                                        'departure': int.parse(controller.departure.toString()),
                                        'arrival': int.parse(controller.arrival.toString()),
                                        // 'flightClass': int.parse(controller.flightClass.toString()),
                                        'flightClass': controller.flightClassID,
                                        'formEdit': controller.formEdit,
                                      });
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
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
