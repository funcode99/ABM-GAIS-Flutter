import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/transportation/add/add_transportation_controller.dart';
import 'package:get/get.dart';

class AddTransportationScreen extends StatelessWidget {
  const AddTransportationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTransportationController>(
        init: AddTransportationController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Other Transportation", style: appTitle),
              leading: const CustomBackButton(),
            ),
            body: Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(7),
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
                      decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(50)),
                      child: SvgPicture.asset(ImageConstant.car, height: 25),
                    ),
                    Text("Transportation", style: appTitle),
                    const SizedBox(height: 14),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextFormField(
                              controller: controller.travellerName,
                              label: "Traveller",
                              hintText: "Name",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              readOnly: true,
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Type of Transportation",
                              hintText: "Type",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              items: controller.typeList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.typeTransportation.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.transportType = value;
                                print(controller.transportType);
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.fromDate,
                              label: controller.transportType == '4' ? "Date" : "From Date",
                              hintText: "Date",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              readOnly: true,
                              suffixIcon: const Icon(Icons.calendar_month),
                              onTap: () => showDatePicker(
                                      context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: controller.lastDate)
                                  .then((date) {
                                controller.dateFrom = date!;
                                controller.fromDate.text = controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            const SizedBox(height: 8),
                            controller.transportType == '4'
                                ? CustomDropDownFormField(
                                    label: "Departure City",
                                    hintText: controller.isLoading ? "Loading..." : "City",
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
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
                                  )
                                : CustomTextFormField(
                                    controller: controller.toDate,
                                    label: "To Date",
                                    hintText: "Date",
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                    readOnly: true,
                                    suffixIcon: const Icon(Icons.calendar_month),
                                    onTap: () => showDatePicker(
                                            context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: controller.lastDate)
                                        .then((date) {
                                      controller.dateTo = date!;
                                      controller.toDate.text = controller.dateFormat.format(date);
                                      controller.update();
                                    }),
                                  ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              // ignore: unrelated_type_equality_checks
                              label: controller.transportType == '4' ? "Arrival" : "City",
                              hintText: controller.isLoading ? "Loading..." : "City",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.cityName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedCity = value;
                                controller.arrival = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            controller.transportType == '4'
                                ? CustomTextFormField(
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
                                  )
                                : CustomTextFormField(
                                    controller: controller.quantity,
                                    label: "Quantity",
                                    hintText: "Quantity",
                                    isRequired: true,
                                    inputType: TextInputType.number,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                  ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.remarks,
                              label: "Remarks",
                              hintText: "Remarks",
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
                                  color: infoColor,
                                  title: "Save",
                                  onPressed: () {
                                    if (controller.formKey.currentState?.validate() == true) controller.save();
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
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
