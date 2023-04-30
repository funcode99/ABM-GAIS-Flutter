import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/add_cash_advance_non_travel_controller.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';

class AddCashAdvanceNonTravelScreen extends StatefulWidget {
  const AddCashAdvanceNonTravelScreen({Key? key}) : super(key: key);

  @override
  State<AddCashAdvanceNonTravelScreen> createState() =>
      _AddCashAdvanceNonTravelScreenState();
}

class _AddCashAdvanceNonTravelScreenState
    extends State<AddCashAdvanceNonTravelScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddCashAdvanceNonTravelController>(
        init: AddCashAdvanceNonTravelController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("cash_advance_non_travel".tr, style: appTitle),
              centerTitle: true,
              flexibleSpace: const TopBar(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                child: Container(
                  width: double.infinity,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextFormField(
                          isRequired: true,
                          validator: ValidationBuilder().required().build(),
                          controller: controller.eventController,
                          label: "Event".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          isRequired: true,
                          controller: controller.dateController,
                          label: "Date".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          isRequired: true,
                          controller: controller.costCenterController,
                          label: "Cost Center".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ThousandsSeparatorInputFormatter()
                          ],
                          inputType: TextInputType.number,
                          isRequired: true,
                          controller: controller.nominalController,
                          label: "Nominal".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          controller: controller.remarksController,
                          label: "Remarks".tr),
                      const SizedBox(
                        height: 32,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            child: Text("Cancel".tr),
                          ),
                          OutlinedButton(
                            onPressed: () {},
                            child: Text("Save".tr),
                            style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: infoColor),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
