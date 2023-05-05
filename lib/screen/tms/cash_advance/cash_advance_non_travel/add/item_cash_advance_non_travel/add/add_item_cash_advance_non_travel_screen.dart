import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/add/add_item_cash_advance_non_travel_controller.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';

class AddItemCashAdvanceNonTravelScreen extends StatefulWidget{
  const AddItemCashAdvanceNonTravelScreen({super.key});

  @override
  State<AddItemCashAdvanceNonTravelScreen> createState() => _AddItemCashAdvanceNonTravelScreenState();
}

class _AddItemCashAdvanceNonTravelScreenState extends State<AddItemCashAdvanceNonTravelScreen> {
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddItemCashAdvanceNonTravelController>(
        init: AddItemCashAdvanceNonTravelController(),
        builder: (controller){
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("Add Item".tr, style: appTitle),
              centerTitle: true,
              flexibleSpace: const TopBar(),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                child: Form(
                  key: controller.formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: () {
                    setState(() {
                      _isButtonEnabled =
                          controller.formKey.currentState!.validate();
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                            isRequired: true,
                            controller: controller.itemCenterController,
                            label: "Item".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomFormLabel(
                          label: "Cost Center".tr,
                          showRequired: true,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        DropdownButtonFormField(
                          decoration: const InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 2)),
                          icon: const Icon(Icons.keyboard_arrow_down),
                          hint: const Text("Item"),
                          value: "",
                          isExpanded: true,
                          validator: ValidationBuilder().required().build(),
                          items: [
                            DropdownMenuItem(
                              child: Text("Cost Center".tr),
                              value: "",
                            ),
                            const DropdownMenuItem(
                              child: Text("Bensin"),
                              value: "Bensin",
                            ),
                            const DropdownMenuItem(
                              child: Text("Transport"),
                              value: "Transport",
                            ),
                          ],
                          onChanged: (value) {
                            controller.costCenterController.text = value!;
                          },
                        ),
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
                              onPressed: () {
                                Get.back();
                              },
                              style: OutlinedButton.styleFrom(
                                minimumSize: const Size(100, 40),
                              ),
                              child: Text("Cancel".tr),
                            ),
                            ElevatedButton(
                              onPressed: _isButtonEnabled ? () {
                                Get.back(result: ItemCashAdvanceNonTravelModel(
                                    controller.itemCenterController.text, controller.costCenterController.text, controller.nominalController.text, controller.remarksController.text
                                ));
                              } : null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: infoColor),
                              child: Text("Save".tr),
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
            ),
          );
        }
    );
  }
}