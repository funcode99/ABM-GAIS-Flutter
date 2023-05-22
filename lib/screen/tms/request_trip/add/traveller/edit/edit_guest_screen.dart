import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/edit/edit_guest_controller.dart';
import 'package:get/get.dart';

class EditGuestScreen extends StatelessWidget {
  const EditGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EditGuestController>(
        init: EditGuestController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Edit Guest", style: appTitle),
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
              child: controller.isLoading==false
                  ? SingleChildScrollView(
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
                            child: const Icon(Icons.groups, color: whiteColor),
                          ),
                          Text("Guest", style: appTitle),
                          const SizedBox(height: 20),
                          Form(
                            key: controller.formKey,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomDropDownFormField(
                                    items: controller.typeList
                                        .map((e) => DropdownMenuItem(
                                              value: e.id.toString(),
                                              child: Text(
                                                  e.typeTraveller.toString()),
                                            ))
                                        .toList(),
                                    label: "Type of Traveller",
                                    hintText: "Type",
                                    isRequired: true,
                                    value: controller.selectedType,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.selectedType = value;
                                      controller.update();
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  CustomTextFormField(
                                    controller: controller.guestName,
                                    label: "Name",
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                    hintText: "Name",
                                  ),
                                  const SizedBox(height: 8),
                                  CustomDropDownFormField(
                                    items: const [
                                      DropdownMenuItem(
                                        value: "L",
                                        child: Text("Male"),
                                      ),
                                      DropdownMenuItem(
                                        value: "P",
                                        child: Text("Female"),
                                      ),
                                    ],
                                    label: "Gender",
                                    hintText: controller.gender,
                                    value: controller.gender,
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.gender = value;
                                      controller.update();
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  CustomTextFormField(
                                    controller: controller.guestNIK,
                                    label: "NIK",
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  CustomTextFormField(
                                    controller: controller.guestContact,
                                    label: "Contact No",
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  CustomDropDownFormField(
                                    items: controller.departmentList
                                        .map((e) => DropdownMenuItem(
                                              value: e.id.toString(),
                                              child: Text(
                                                  e.departementName.toString()),
                                            ))
                                        .toList(),
                                    label: "Department",
                                    hintText: "Department",
                                    value: controller.selectedDepartment,
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.selectedDepartment = value;
                                      controller.update();
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  CustomDropDownFormField(
                                    items: controller.companyList
                                        .map((e) => DropdownMenuItem(
                                              value: e.id.toString(),
                                              child: Text(
                                                  e.companyName.toString()),
                                            ))
                                        .toList(),
                                    label: "Company",
                                    hintText: "Company",
                                    value: controller.selectedCompany,
                                    isRequired: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "This field is required";
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      controller.selectedCompany = value;
                                      controller.update();
                                    },
                                  ),
                                  const SizedBox(height: 8),
                                  CustomTextFormField(
                                    controller: controller.hotelFare,
                                    label: "Hotel Fare",
                                    isRequired: true,
                                    readOnly: true,
                                  ),
                                  const SizedBox(height: 8),
                                  CustomTextFormField(
                                    controller: controller.flightEntitlement,
                                    label: "Flight Entitlement",
                                    isRequired: true,
                                    readOnly: true,
                                  ),
                                  const SizedBox(height: 8),
                                  CustomTextFormField(
                                    controller: controller.guestNotes,
                                    label: "Notes",
                                    hintText: "Notes",
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
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
                                              true) controller.updateGuest();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
            ),
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
