import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/request_atk/add/item_request_atk/add/add_item_request_atk_controller.dart';
import 'package:gais/util/validator/custom_validation_builder.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddItemRequestATKScreen extends StatefulWidget {
  const AddItemRequestATKScreen({super.key});

  @override
  State<AddItemRequestATKScreen> createState() =>
      _AddItemRequestATKScreenState();
}

class _AddItemRequestATKScreenState extends State<AddItemRequestATKScreen> {
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddItemRequestATKController>(
        init: AddItemRequestATKController(),
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
                          height: 8,
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(
                                color: infoColor, shape: BoxShape.circle),
                            child: const Icon(
                              IconlyBold.info_square,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Center(
                          child: Text(
                            "ATK Info".tr,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
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
                        CustomDropDownFormField(
                          isRequired: true,
                          items: controller.listItem
                              .map((e) => DropdownMenuItem(
                                    value: e.id.toString(),
                                    child: Text("${e.id} - ${e.itemName}"),
                                  ))
                              .toList(),
                          onChanged: (item) {
                            controller.onChangeSelectedItemId(item!);
                          },
                          label: "Item".tr,
                          value: controller.selectedItem.id.toString(),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            isRequired: true,
                            readOnly: true,
                            controller: controller.brandController,
                            label: "Brand".tr),
                        const SizedBox(
                          height: 8,
                        ),
                        CustomTextFormField(
                            validator: ValidationBuilder()
                                .required()
                                .max(controller.selectedItem.quantity)
                                .build(),
                            isRequired: true,
                            inputType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
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
                            multiLine: true,
                            controller: controller.remarksController,
                            label: "Remarks".tr),
                        const SizedBox(
                          height: 32,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: _isButtonEnabled
                                  ? () {
                                      Get.back(
                                          result: controller.getAddedItem());
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: successColor),
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
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
