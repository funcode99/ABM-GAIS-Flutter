import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/actualization_trip/activity_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/actualization_trip/add/form_activity_actualization_trip_controller.dart';
import 'package:get/get.dart';

class FormActivityActualizationTripScreen extends StatelessWidget {
  const FormActivityActualizationTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ActivityModel? activityModel;
    if (Get.arguments != null) {
      activityModel = Get.arguments["activity"];
    }

    final FormActivityActualizationTripController controller = Get.put(
        FormActivityActualizationTripController())
      ..activityModel(activityModel);

    return Scaffold(
      backgroundColor: baseColor,
      appBar: TopBar(
        title: Text("Activities Detail", style: appTitle),
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
                  controller: controller.dateController,
                  label: "Date",
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
                          initialDate: controller.activityDate.value ?? DateTime.now(),
                          firstDate: DateTime.now().subtract(
                              const Duration(days: 365)),
                          lastDate: DateTime.now().add(
                              const Duration(days: 365)))
                          .then((date) {
                            controller.activityDate.value = date;
                          controller.dateController.text = controller.dateFormat.format(date!);
                      }),
                ),
                const SizedBox(height: 10),
                CustomTextFormField(
                  multiLine: true,
                  controller: controller.activitiesController,
                  label: "Activities".tr,
                  isRequired: true,
                ),
                const SizedBox(
                  height: 64,
                ),
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
                           ActivityModel? result = controller.saveButton();
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
