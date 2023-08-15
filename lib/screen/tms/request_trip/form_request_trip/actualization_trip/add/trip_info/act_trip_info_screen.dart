import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/add/trip_info/act_trip_info_controller.dart';
import 'package:get/get.dart';

class ActTripInfoScreen extends StatelessWidget {
  const ActTripInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActTripInfoController>(
        init: ActTripInfoController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              title: Text("Trip Info", style: appTitle),
              leading: const CustomBackButton(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(40),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                            .then((date) {
                          controller.departureDate.text = controller.dateFormat.format(date!);
                          controller.update();
                        }),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: controller.arrivalDate,
                        label: "Arrival Date",
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
                            .then((date) {
                          controller.arrivalDate.text = controller.dateFormat.format(date!);
                          controller.update();
                        }),
                      ),
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
                          controller.fromCity.text = value!;
                          controller.update();
                        },
                        // value: controller.fromCity,
                      ),
                      const SizedBox(height: 8),
                      CustomDropDownFormField(
                        label: "To",
                        isRequired: true,
                        hintText: controller.isLoading ? "Loading..." : "City",
                        items: controller.cityList
                            .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text(e.cityName.toString()),
                                ))
                            .toList(),
                        onChanged: (value) {
                          controller.toCity.text = value!;
                          controller.update();
                        },
                        // value: controller.fromCity,
                      ),
                      const SizedBox(height: 8),
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
                            color: successColor,
                            title: "Save",
                            onPressed: () {
                              if (controller.formKey.currentState?.validate() == true) {}
                            },
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
