import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/actualization_trip/trip_info_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/approval/actualization_trip/edit/form_approval_actualization_trip_controller.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';

class FormApprovalActualizationTripScreen extends StatelessWidget {
  const FormApprovalActualizationTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TripInfoModel? tripInfoModel;
    if (Get.arguments != null) {
      tripInfoModel = Get.arguments["trip_info"];
    }

    final FormApprovalActualizationTripController controller = Get.put(FormApprovalActualizationTripController())..tripInfoModel(tripInfoModel);

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
                  controller: controller.tlkRateController,
                  label: "TLK Rate",
                  isRequired: true,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    ThousandsSeparatorInputFormatter()
                  ],
                  inputType: TextInputType.number,
                ),
                const SizedBox(height: 64),
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
