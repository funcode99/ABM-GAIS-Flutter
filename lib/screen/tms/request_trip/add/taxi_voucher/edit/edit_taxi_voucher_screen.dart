import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/taxi_voucher/edit/edit_taxi_voucher_controller.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';

class EditTaxiVoucherScreen extends StatelessWidget {
  const EditTaxiVoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditTaxiVoucherController>(
        init: EditTaxiVoucherController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Taxi Voucher", style: appTitle),
              leading: CustomBackButton(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 42,
                      width: 42,
                      // padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.circular(50)),
                      child: Icon(Icons.account_balance_wallet_rounded,
                          color: whiteColor),
                    ),
                    Text("Taxi Voucher", style: appTitle),
                    SizedBox(height: 14),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: controller.traveller,
                              label: "Traveller",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              hintText: "Name",
                              readOnly: true,
                            ),
                            SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.date,
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
                              onTap: () => showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: controller.lastDate)
                                  .then(
                                (date) {
                                  controller.selectedDate = date!;
                                  controller.date.text =
                                      controller.dateFormat.format(date);
                                  controller.update();
                                },
                              ),
                            ),
                            SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Departure",
                              isRequired: true,
                              value: controller.departure,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              hintText: "City",
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.cityName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.departure = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Arrival",
                              isRequired: true,
                              value: controller.arrival,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              hintText: "City",
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.cityName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.arrival = value;
                                controller.update();
                              },
                            ),
                            SizedBox(height: 8),
                            // CustomTextFormField(
                            //   controller: controller.amount,
                            //   label: "amount",
                            //   hintText: "Amount",
                            //   isRequired: true,
                            //   inputFormatters: [
                            //     FilteringTextInputFormatter.digitsOnly,
                            //     ThousandsSeparatorInputFormatter()
                            //   ],
                            //   inputType: TextInputType.number,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "This field is required";
                            //     }
                            //     return null;
                            //   },
                            // ),
                            // SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.accountName,
                              label: "Account Name",
                              hintText: "Blue bird account",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                            ),
                            SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.remarks,
                              label: "Remarks",
                              hintText: "Remarks",
                              multiLine: true,
                            ),
                            SizedBox(height: 8),
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
                                  color: infoColor,
                                  title: "Save",
                                  onPressed: () {
                                    if (controller.formKey.currentState
                                            ?.validate() ==
                                        true) controller.save();
                                  },
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomBar(menu: 0),
          );
        });
  }
}
