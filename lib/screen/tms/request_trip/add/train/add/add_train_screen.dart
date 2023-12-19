import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/train/add/add_train_controller.dart';
import 'package:get/get.dart';

class AddTrainScreen extends StatelessWidget {
  const AddTrainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddTrainController>(
        init: AddTrainController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Train", style: appTitle),
              leading: CustomBackButton(
                onPressed: () => controller.back(),
              ),
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
                      child: const Icon(Icons.train_rounded, color: whiteColor),
                    ),
                    Text("Train", style: appTitle),
                    const SizedBox(height: 14),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const CustomFormLabel(label: "Traveller", showRequired: true),
                            const SizedBox(
                              height: 8,
                            ),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 8),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: controller.showTravellerError
                                      ? Colors.redAccent
                                      : Colors.black,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Wrap(
                                runSpacing: 8,
                                runAlignment: WrapAlignment.center,
                                children: [
                                  ...controller.selectedTravellerList
                                      .mapIndexed((index, item) => Container(
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(4.0),
                                      ),
                                      color: Color(0xFFe4e4e4),
                                    ),
                                    margin: const EdgeInsets.only(
                                        right: 5.0, left: 5),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0, vertical: 4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        InkWell(
                                          child: Text(
                                            item.nameGuest ?? "",
                                            style: listSubTitleTextStyle,
                                          ),
                                        ),
                                        const SizedBox(width: 4.0),
                                        InkWell(
                                          child: const Icon(
                                            Icons.cancel,
                                            size: 14.0,
                                            color: greyColor,
                                          ),
                                          onTap: () {
                                            controller.deleteTravellerItem(item);
                                          },
                                        )
                                      ],
                                    ),
                                  ))
                                      .toList(),
                                  SizedBox(
                                    width: double.infinity,
                                    child: TypeAheadFormField<guest.Data>(
                                      textFieldConfiguration: TextFieldConfiguration(
                                        controller: controller.autocompleteController,
                                        autofocus: false,
                                        style: Theme.of(context).textTheme.titleMedium,
                                        decoration: InputDecoration(
                                            isDense: true,
                                            hintText: "Participant".tr,
                                            border: InputBorder.none,
                                            contentPadding: const EdgeInsets.symmetric(
                                                horizontal: 4.0, vertical: 4.0),
                                            errorText: null,
                                            errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              gapPadding: 0,
                                            ),
                                            errorStyle: const TextStyle(height: 0)),
                                      ),
                                      suggestionsCallback: (pattern) async {
                                        final list = await controller.getGuestByKeyword(pattern);
                                        return list;
                                      },
                                      itemBuilder: (context, suggestion) {
                                        return ListTile(
                                          title: Text("${suggestion.nameGuest}"),
                                        );
                                      },
                                      onSuggestionSelected: (suggestion) {
                                        controller.selectedTravellerList.add(suggestion);
                                        controller.autocompleteController.text = "";
                                        controller.update();
                                      },
                                      debounceDuration: const Duration(milliseconds: 1500),
                                      hideOnLoading: true,
                                      hideSuggestionsOnKeyboardHide: true,
                                      keepSuggestionsOnLoading: false,
                                      minCharsForSuggestions: 0,
                                      validator: (value) {
                                        controller.showTravellerError = controller.selectedTravellerList.isEmpty;

                                        if (controller.selectedTravellerList.isEmpty) {
                                          return "";
                                        }
                                        return null;
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),
                            if (controller.showTravellerError)
                              const Padding(
                                padding: EdgeInsets.only(left: 10, top: 8),
                                child: Text(
                                  "This field is required",
                                  style:
                                  TextStyle(color: Colors.redAccent, fontSize: 12),
                                ),
                              ),

                            const SizedBox(height: 16),

                            CustomDropDownFormField(
                              label: "Origin Station",
                              hintText: controller.isLoading ? "Loading..." : "Station",
                              value: controller.originStation,
                              items: controller.stationList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text("${e.cityName} - ${e.stationName}"),
                                      ))
                                  .toList(),
                              isRequired: true,
                              validator: (value) {
                                if (value == null || controller.originStation == null) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                controller.originStation = value!;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 16),
                            CustomDropDownFormField(
                              label: "Destination Station",
                              hintText: controller.isLoading ? "Loading..." : "Station",
                              value: controller.destinationStation,
                              items: controller.stationList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text("${e.cityName} - ${e.stationName}"),
                                      ))
                                  .toList(),
                              isRequired: true,
                              validator: (value) {
                                if (value == null || controller.originStation == null) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                controller.destinationStation = value!;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 16),

                            CustomTextFormField(
                              controller: controller.departureDate,
                              label: "Departure Date",
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
                                      context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: controller.lastDate)
                                  .then(
                                (date) {
                                  controller.dateDeparture = date!;
                                  controller.departureDate.text = controller.dateFormat.format(date);
                                  controller.update();
                                },
                              ),
                            ),
                            const SizedBox(height: 16),
                            // const CustomFormLabel(
                            //   label: "Round Trip",
                            //   showRequired: true,
                            // ),
                            // Switch(
                            //   value: controller.roundTrip,
                            //   activeColor: infoColor,
                            //   onChanged: (bool value) {
                            //     controller.roundTrip = value;
                            //     controller.update();
                            //   },
                            // ),
                            // CustomTextFormField(
                            //   controller: controller.returnDate,
                            //   label: "Return Date",
                            //   isRequired: true,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "This field is required";
                            //     }
                            //     return null;
                            //   },
                            //   suffixIcon: const Icon(Icons.calendar_month),
                            //   readOnly: true,
                            //   onTap: () => showDatePicker(
                            //           context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: controller.lastDate)
                            //       .then(
                            //     (date) {
                            //       controller.dateReturn = date!;
                            //       controller.returnDate.text = controller.dateFormat.format(date);
                            //       controller.update();
                            //     },
                            //   ),
                            // ),
                            // const SizedBox(height: 16),

                            const CustomFormLabel(label: "Passengers", showRequired: true),
                            const SizedBox(height: 8),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CustomFormLabel(label: "Adult", showRequired: true),
                                      Container(
                                        height: 50,
                                        width: Get.width / 4.5,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: controller.borderColor),
                                        ),
                                        child: DropdownButton(
                                          value: controller.passengerAdult.text.isEmpty ? null : controller.passengerAdult.text,
                                          items: List.generate(
                                              9,
                                                  (index) => DropdownMenuItem(
                                                child: Text((index + 1).toString()),
                                                value: (index + 1).toString(),
                                              )),
                                          icon: const Icon(Icons.keyboard_arrow_down),
                                          hint: Text("Adult", style: hintTextStyle),
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          onChanged: (value) {
                                            controller.passengerAdult.text = value.toString();
                                            controller.borderColor = greyColor;
                                            controller.update();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const CustomFormLabel(label: "Child", showRequired: true),
                                      Container(
                                        height: 50,
                                        width: Get.width / 4.5,
                                        padding: const EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: controller.borderColor),
                                        ),
                                        child: DropdownButton(
                                          value: controller.passengerChild.text.isEmpty ? null : controller.passengerChild.text,
                                          items: List.generate(
                                              10,
                                                  (index) => DropdownMenuItem(
                                                child: Text((index).toString()),
                                                value: (index).toString(),
                                              )),
                                          icon: const Icon(Icons.keyboard_arrow_down),
                                          hint: Text("Child", style: hintTextStyle),
                                          isExpanded: true,
                                          underline: const SizedBox(),
                                          onChanged: (value) {
                                            controller.passengerChild.text = value.toString();
                                            controller.borderColor = greyColor;
                                            controller.update();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 10),
                            controller.borderColor == errorColor
                                ? const Text("     This field is required", style: TextStyle(color: redColor, fontSize: 12))
                                : Container(),
                            const SizedBox(height: 16),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  width: 100,
                                  color: Colors.transparent,
                                  borderColor: infoColor,
                                  title: "Cancel",
                                  fontColor: infoColor,
                                  onPressed: () => controller.back(),
                                ),
                                CustomFilledButton(
                                  width: 100,
                                  color: infoColor,
                                  title: controller.isBooking == true ? "Check" : "Save",
                                  onPressed: () {
                                    controller.passengerAdult.text.isEmpty &&
                                        controller.passengerChild.text.isEmpty
                                        ? controller.borderColor = errorColor
                                        : greyColor;
                                    controller.update();

                                    if (controller.formKey.currentState?.validate() == true && (controller.passengerAdult.text.isNotEmpty ||
                                        controller.passengerChild.text.isNotEmpty)) controller.save();
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
