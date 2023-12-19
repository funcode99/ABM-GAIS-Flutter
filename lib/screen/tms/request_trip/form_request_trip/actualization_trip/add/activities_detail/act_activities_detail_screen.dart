import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/actualization_trip/add/activities_detail/act_activites_detail_controller.dart';
import 'package:get/get.dart';

class ActActivitiesDetailScreen extends StatelessWidget {
  const ActActivitiesDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActActivitiesDetailController>(
        init: ActActivitiesDetailController(),
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
                        controller: controller.activityDate,
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
                          controller.activityDate.text = controller.dateFormat.format(date!);
                          controller.update();
                        }),
                      ),
                      const SizedBox(height: 10),
                      CustomTextFormField(
                        controller: controller.activityDetail,
                        label: "Activities",
                        isRequired: true,
                        multiLine: true,
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
                              if (controller.formKey.currentState?.validate() == true) {
                                controller.saveData();
                              }
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
