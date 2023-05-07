import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/request_atk/add/add_request_atk_controller.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:gais/util/validator/custom_validation_builder.dart';
import 'package:get/get.dart';

class AddRequestATKScreen extends StatefulWidget {
  const AddRequestATKScreen({super.key});

  @override
  State<AddRequestATKScreen> createState() => _AddRequestATKScreenState();
}

class _AddRequestATKScreenState extends State<AddRequestATKScreen> {
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddRequestATKController>(
        init: AddRequestATKController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("ATK Request".tr, style: appTitle),
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
                        CustomDropDownFormField(
                          isRequired: true,
                          items: controller.listItem
                              .map((e) => DropdownMenuItem(
                                    value: e.id.toString(),
                                    child: Text(e.itemName),
                                  ))
                              .toList(),
                          onChanged: (item) {
                            controller.onChangeSelectedItemId(item!);
                          },
                          label: "Item ".tr,
                          value: controller.selectedItem.id.toString(),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            isRequired: true,
                            readOnly: true,
                            controller: controller.brandController,
                            label: "Brand Name".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                          validator: ValidationBuilder().required().min(controller.selectedItem.quantity).build(),
                            isRequired: true,
                            controller: controller.quantityController,
                            label: "Quantity".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            isRequired: true,
                            readOnly: true,
                            controller: controller.uomController,
                            label: "UOM".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            isRequired: true,
                            controller: controller.siteController,
                            label: "Site".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomDropDownFormField(
                          isRequired: true,
                          items: controller.listWarehouse
                              .map((e) => DropdownMenuItem(
                                    value: e.id,
                                    child: Text(e.name),
                                  ))
                              .toList(),
                          onChanged: (item) {
                            controller.onChangeSelectedWarehouse(item!);
                          },
                          label: "Warehouse ".tr,
                          value: controller.selectedWarehouse.id,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            multiLine: true,
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
                              onPressed: _isButtonEnabled
                                  ? () {
                                      // Get.off();
                                    }
                                  : null,
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
        });
  }
}
