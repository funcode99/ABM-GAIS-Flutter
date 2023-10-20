import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_trip_info_actualization_trip_controller.dart';
import 'package:get/get.dart';

class FormTripInfoActualizationTripScreen extends StatelessWidget {
  const FormTripInfoActualizationTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TripInfoModel? tripInfoModel;
    if (Get.arguments != null) {
      tripInfoModel = Get.arguments["trip_info"];
    }

    final FormTripInfoActualizationTripController controller =
    Get.put(FormTripInfoActualizationTripController())..tripInfoModel(tripInfoModel);

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
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () {
              controller.updateButton();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  controller: controller.departureDateController,
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
                  onTap: () =>
                      showDatePicker(
                          context: context,
                          initialDate: controller.departureDate.value ?? DateTime.now(),
                          firstDate: DateTime.now().subtract(const Duration(days: 365)),
                          lastDate: DateTime.now().add(const Duration(days: 365)))
                          .then((date) {
                            if(date!=null){
                              controller.onChangeDepartureDate(date);
                            }
                      }),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  controller: controller.arrivalDateController,
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
                  onTap: () =>
                      showDatePicker(
                          context: context,
                          initialDate: controller.arrivalDate.value ?? controller.departureDate.value ?? DateTime.now(),
                          firstDate: controller.departureDate.value ?? DateTime.now().subtract(const Duration(days: 365)),
                          lastDate: DateTime.now().add(const Duration(days: 365)))
                          .then((date) {
                            if(date!=null){
                              controller.arrivalDate(date);
                              controller.arrivalDateController.text =
                                  controller.dateFormat.format(date!);
                            }
                      }),
                ),
                const SizedBox(height: 10),
                Obx(() {
                  return CustomDropDownFormField(
                    label: "From",
                    isRequired: true,
                    hintText: "City",
                    value: controller.selectedFrom.value?.id.toString(),
                    items: controller.listCity
                        .map((e) =>
                        DropdownMenuItem(
                          value: e.id.toString(),
                          child: Text(e.cityName.toString()),
                        ))
                        .toList(),
                    onChanged: (value) {
                      controller.onChangeSelectedFrom(value);
                    },
                    // value: controller.fromCity,
                  );
                }),
                const SizedBox(height: 8),
                Obx(() {
                  return CustomDropDownFormField(
                    label: "To",
                    isRequired: true,
                    hintText: "City",
                    value: controller.selectedTo.value?.id.toString(),
                    items: controller.listCity
                        .map((e) =>
                        DropdownMenuItem(
                          value: e.id.toString(),
                          child: Text(e.cityName.toString()),
                        ))
                        .toList(),
                    onChanged: (value) {
                      controller.onChangeSelectedTo(value);
                    },
                    // value: controller.fromCity,
                  );
                }),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(100, 40),
                      ),
                      child: Text("Cancel".tr),
                    ),
                    Obx(() {
                      return ElevatedButton(
                        onPressed: controller.enableButton.value
                            ? () {
                          TripInfoModel? result = controller.saveButton();
                          Get.back(result: result);
                        }
                            : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: successColor),
                        child: Text("Save".tr),
                      );
                    }),
                  ],
                ),
                const SizedBox(
                  height: 16,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
