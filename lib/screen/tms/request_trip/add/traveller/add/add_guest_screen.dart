import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/calendar/custom_calendar_picker.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/traveller/add/add_guest_controller.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/input_formatter/thousand_separator_input_formatter.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddGuestScreen extends StatelessWidget {
  const AddGuestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddGuestController>(
        init: AddGuestController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Guest as Traveller", style: appTitle),
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
                      child: const Icon(Icons.groups, color: whiteColor),
                    ),
                    Text("Guest", style: appTitle),
                    const SizedBox(height: 20),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomDropDownFormField(
                              items: controller.typeList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.typeTraveller.toString()),
                                      ))
                                  .toList(),
                              label: "Type of Traveller",
                              hintText: controller.isLoading ? "loading..." : "Type",
                              isRequired: true,
                              value: controller.selectedType == null || controller.selectedType == "0" ? null : controller.selectedType,
                              onChanged: (value) {
                                controller.selectedType = value;
                                controller.update();
                                print(value);
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.guestName,
                              label: "Name",
                              isRequired: true,
                              hintText: "Name",
                              // readOnly: true,
                              // suffixIcon: Icon(Icons.keyboard_arrow_down,
                              //     color: greyColor),
                              // onTap: () {
                              //   CustomSearchList(
                              //     ShowList(
                              //       bottomSheetTitle: const Text(
                              //         "Guest",
                              //         style: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: 20.0,
                              //         ),
                              //       ),
                              //       data: controller.guestList,
                              //       selectedItems: (selectedList) {
                              //         controller.guestName.text =
                              //             selectedList.first.name.toString();
                              //         controller.selectedGuest =
                              //             selectedList.first.value.toString();
                              //         controller.setGuestInfo();
                              //         controller.update();
                              //       },
                              //       enableMultipleSelection: false,
                              //     ),
                              //   ).showModal(context);
                              // },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              items: const [
                                DropdownMenuItem(
                                  value: "MR",
                                  child: Text("MR"),
                                ),
                                DropdownMenuItem(
                                  value: "MRS",
                                  child: Text("MRS"),
                                ),
                                DropdownMenuItem(
                                  value: "MS",
                                  child: Text("MS"),
                                ),
                                DropdownMenuItem(
                                  value: "MSTR",
                                  child: Text("MSTR"),
                                ),
                              ],
                              label: "Title",
                              hintText: "Title",
                              value: controller.title,
                              isRequired: true,
                              onChanged: (value) {
                                controller.title = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.dateController,
                              label: "Birthdate",
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
                                  initialDate: controller.birthdate,
                                  lastDate: DateTime.now(),
                                  firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)))
                                  .then(
                                    (date) {
                                      controller.birthdate = date!;
                                      controller.dateController.text = controller.dateFormat.format(date);
                                      controller.update();
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            CustomTextFormField(
                              controller: controller.guestContact,
                              label: "Contact No",
                              isRequired: true,
                              inputType: TextInputType.number,
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.guestCompany,
                              label: "Company",
                              hintText: "Company",
                              isRequired: true,
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
                              hintText: "Gender",
                              value: controller.gender,
                              isRequired: true,
                              onChanged: (value) {
                                controller.gender = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.hotelFare,
                              label: "Hotel Fare",
                              isRequired: true,
                              readOnly: false,
                              inputType: TextInputType.number,
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                ThousandsSeparatorInputFormatter(),
                              ],
                            ),
                            const SizedBox(height: 8),

                            CustomTextFormField(
                              controller: controller.emailController,
                              label: "Email",
                              hintText: "Email",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                if (!value.isEmail) {
                                  return "This field is not a valid email";
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 8),

                            CustomTextFormField(
                              controller: controller.guestNIK,
                              label: "NIK",
                              isRequired: true,
                              inputType: TextInputType.number,
                            ),
                            const SizedBox(height: 8),

                           /* CustomTextFormField(
                              controller: controller.guestDepartment,
                              label: "Department",
                              isRequired: true,
                            ),
                            const SizedBox(height: 8),*/

                            CustomDropDownFormField(
                              items: controller.flightList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.flightClass.toString()),
                                      ))
                                  .toList(),
                              label: "Flight Class",
                              hintText: controller.isLoading ? "Loading..." : "Flight Class",
                              value: controller.idFlight?.toString(),
                              isRequired: true,
                              onChanged: (val) {
                                controller.idFlight = val?.toInt();
                                controller.update();
                              },
                            ),
                            // CustomTextFormField(
                            //   controller: controller.flightEntitlement,
                            //   label: "Flight Entitlement",
                            //   isRequired: true,
                            //   readOnly: true,
                            // ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.notes,
                              label: "Notes",
                              hintText: "Notes",
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
                                    if (controller.formKey.currentState?.validate() == true) {
                                      controller.guestID == null ? controller.saveGuest() : controller.updateGuest();
                                    }
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
              ),
            ),
            bottomNavigationBar: const BottomBar(menu: 0),
          );
        });
  }
}
