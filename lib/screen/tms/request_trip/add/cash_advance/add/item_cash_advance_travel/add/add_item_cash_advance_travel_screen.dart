import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/cash_advance/add/item_cash_advance_travel/add/add_item_cash_advance_travel_controller.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';

class AddItemCashAdvanceTravelScreen extends StatelessWidget {
  const AddItemCashAdvanceTravelScreen({super.key, this.item});

  final CashAdvanceDetailModel? item;

  @override
  Widget build(BuildContext context) {
    // final AddItemCashAdvanceTravelController controller = Get.put(AddItemCashAdvanceTravelController())..item = item;

    return GetBuilder<AddItemCashAdvanceTravelController>(
        init: AddItemCashAdvanceTravelController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: TopBar(
              leading: const CustomBackButton(),
              title: Text("Add Item".tr, style: appTitle),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Card(
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      margin: const EdgeInsets.only(top: 10),
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(ImageConstant.emptyWalletTime, height: 25),
                    ),
                    Text("Cash Advance Travel", style: appTitle),
                    Form(
                      key: controller.formKey,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 16,
                            ),
                            CustomDropDownFormField(
                              label: "Item",
                              hintText: controller.isLoading ? "Loading... " : "Item",
                              isRequired: true,
                              value: controller.selectedItem,
                              items: controller.itemCA
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.itemName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedItem = value;
                                // print(controller.selectedItem);
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.frequencyController,
                              label: "Frequency",
                              isRequired: true,
                              inputType: TextInputType.number,
                              onChanged: (value) {
                                controller.totalController.text =
                                    (controller.nominalController.text.digitOnly().toInt() * int.parse(value.digitOnly())).toCurrency();
                              },
                            ),
                            const SizedBox(height: 8),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                ThousandsSeparatorInputFormatter(),
                              ],
                              inputType: TextInputType.number,
                              isRequired: true,
                              controller: controller.nominalController,
                              label: "Amount".tr,
                              onChanged: (value) {
                                controller.totalController.text =
                                    (controller.frequencyController.text.digitOnly().toInt() * int.parse(value.digitOnly())).toCurrency();
                                controller.isButtonEnabled(controller.formKey.currentState!.validate());
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.totalController,
                              label: "Total",
                              isRequired: true,
                              readOnly: true,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                ThousandsSeparatorInputFormatter(),
                              ],
                              inputType: TextInputType.number,
                              onChanged: (value) {},
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              multiLine: true,
                              controller: controller.remarksController,
                              label: "Remarks".tr,
                            ),
                            const SizedBox(height: 32),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  color: Colors.transparent,
                                  title: "Cancel",
                                  width: 100,
                                  fontColor: infoColor,
                                  borderColor: infoColor,
                                  onPressed: () {
                                    Get.back();
                                  },
                                ),
                                CustomFilledButton(
                                    color: infoColor,
                                    title: "Save",
                                    width: 100,
                                    onPressed: () {
                                      if (controller.formKey.currentState?.validate() == true) {
                                        Get.back(result: controller.getAddedItem());
                                      }
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
                  ],
                ),
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
