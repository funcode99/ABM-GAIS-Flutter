import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/cash_advance/cash_advance_non_travel/add/item_cash_advance_non_travel/add/add_item_cash_advance_non_travel_controller.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';

class AddItemCashAdvanceNonTravelScreen extends StatelessWidget {
  const AddItemCashAdvanceNonTravelScreen({super.key, this.item});

  final CashAdvanceDetailModel? item;

  @override
  Widget build(BuildContext context) {
    final AddItemCashAdvanceNonTravelController controller =
    Get.put(AddItemCashAdvanceNonTravelController())..cashAdvanceDetailModel(item);

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
              controller.isButtonEnabled(
                  controller.formKey.currentState!.validate());
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
                      controller: controller.itemNameController,
                      label: "Item".tr),
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
                      Obx(() {
                        return ElevatedButton(
                          onPressed: controller.isButtonEnabled.value ? () {
                            Get.back(result: controller.getAddedItem());
                          } : null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: successColor),
                          child: Text("Save".tr),
                        );
                      }),
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
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}