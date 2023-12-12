import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/add/add_airliness_controller.dart';
import 'package:gais/screen/tms/request_trip/add/airliness/airliness_screen.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';

class AddAirlinessScreen extends StatelessWidget {
  const AddAirlinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAirlinessController>(
        init: AddAirlinessController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
              title: Text("Airlines", style: appTitle),
              leading: CustomBackButton(
                onPressed: () => controller.formEdit == true
                    ? Get.off(const FormRequestTripScreen(), arguments: {
                        'id': controller.purposeID,
                        'codeDocument': controller.codeDocument,
                      })
                    : Get.off(const AirlinessScreen(), arguments: {
                        'purposeID': controller.purposeID,
                        'codeDocument': controller.codeDocument,
                      }),
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
                      child: SvgPicture.asset(
                        ImageConstant.airplane,
                        height: 25,
                      ),
                    ),
                    Text("Airlines", style: appTitle),
                    const SizedBox(height: 14),
                    Form(
                      key: controller.formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // CustomTextFormField(
                            //   controller: controller.travellerName,
                            //   label: "Traveller",
                            //   hintText: "name",
                            //   isRequired: true,
                            //   readOnly: true,
                            //   validator: (value) {
                            //     if (value == null || value.isEmpty) {
                            //       return "This field is required";
                            //     }
                            //     return null;
                            //   },
                            // ),
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

                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.departureDate,
                              label: "Departure Date",
                              hintText: "Date",
                              isRequired: true,
                              readOnly: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              suffixIcon: const Icon(Icons.calendar_month),
                              onTap: () => showDatePicker(
                                      context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: controller.lastDate)
                                  .then((date) {
                                controller.selectedDate = date!;
                                controller.departureDate.text = controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.travellerflightClass,
                              label: "Flight Class",
                              isRequired: true,
                              readOnly: true,
                            ),
                            // CustomDropDownFormField(
                            //   label: "Flight Class",
                            //   hintText: "Class",
                            //   isRequired: true,
                            //   // value: controller.flightClassID.toString(),
                            //   items: controller.flightList
                            //       .map((e) => DropdownMenuItem(
                            //             value: e.id.toString(),
                            //             child: Text(e.flightClass.toString()),
                            //           ))
                            //       .toList(),
                            //   onChanged: (value) {
                            //     controller.flightClass = value;
                            //     controller.update();
                            //     print(controller.flightClass);
                            //   },
                            // ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Departure",
                              hintText: controller.isLoading ? "Loading..." : "Airport",
                              isRequired: true,
                              // textStyle: controller.departureModel == null ? hintTextStyle : formTextStyle,
                              validator: (value) {
                                if (value == null || controller.departure!.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              value: controller.departureModel!=null ? controller.departureModel : null,
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text("${e.cityName.toString()} (${e.code})"),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.departure = value?.code.toString();
                                controller.departureModel = value;
                                print(controller.departureModel?.code);
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Arrival",
                              hintText: controller.isLoading ? "Loading..." : "Airport",
                              isRequired: true,
                              value: controller.arrivalModel!=null ? controller.arrivalModel : null,
                              validator: (value) {
                                if (value == null || controller.arrival!.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text("${e.cityName.toString()} (${e.code})"),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.arrival = value?.code.toString();
                                controller.arrivalModel = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            const CustomFormLabel(label: "Passengers", showRequired: true),
                            const SizedBox(height: 8),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomFormLabel(label: "Adult", showRequired: true),
                                      Container(
                                        height: 50,
                                        width: Get.width / 4.5,
                                        padding: EdgeInsets.symmetric(horizontal: 10),
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
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          hint: Text("Adult", style: hintTextStyle),
                                          isExpanded: true,
                                          underline: SizedBox(),
                                          onChanged: (value) {
                                            controller.passengerAdult.text = value.toString();
                                            controller.borderColor = greyColor;
                                            controller.update();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomFormLabel(label: "Infant", showRequired: true),
                                      Container(
                                        height: 50,
                                        width: Get.width / 4.5,
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: controller.borderColor),
                                        ),
                                        child: DropdownButton(
                                          value: controller.passengerInfant.text.isEmpty ? null : controller.passengerInfant.text,
                                          items: List.generate(
                                              10,
                                              (index) => DropdownMenuItem(
                                                    child: Text((index).toString()),
                                                    value: (index).toString(),
                                                  )),
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          hint: Text("Infant", style: hintTextStyle),
                                          isExpanded: true,
                                          underline: SizedBox(),
                                          onChanged: (value) {
                                            controller.passengerInfant.text = value.toString();
                                            controller.borderColor = greyColor;
                                            controller.update();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomFormLabel(label: "Child", showRequired: true),
                                      Container(
                                        height: 50,
                                        width: Get.width / 4.5,
                                        padding: EdgeInsets.symmetric(horizontal: 10),
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
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          hint: Text("Child", style: hintTextStyle),
                                          isExpanded: true,
                                          underline: SizedBox(),
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
                                ? Text("     This field is required", style: TextStyle(color: redColor, fontSize: 12))
                                : Container(),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  color: Colors.transparent,
                                  fontColor: infoColor,
                                  borderColor: infoColor,
                                  title: "Cancel",
                                  width: 100,
                                  onPressed: () => controller.formEdit == true
                                      ? Get.off(const FormRequestTripScreen(), arguments: {
                                          'id': controller.purposeID,
                                          'codeDocument': controller.codeDocument,
                                        })
                                      : Get.off(const AirlinessScreen(), arguments: {
                                          'purposeID': controller.purposeID,
                                          'codeDocument': controller.codeDocument,
                                        }),
                                ),
                                CustomFilledButton(
                                  color: infoColor,
                                  title: controller.isBooking==true ? "Check" : "Save",
                                  width: 100,
                                  onPressed: () {
                                    controller.passengerAdult.text.isEmpty ||
                                            controller.passengerInfant.text.isEmpty ||
                                            controller.passengerChild.text.isEmpty
                                        ? controller.borderColor = errorColor
                                        : greyColor;
                                    controller.update();
                                    if (controller.formKey.currentState?.validate() == true &&
                                        controller.passengerAdult.text.isNotEmpty &&
                                        controller.passengerInfant.text.isNotEmpty &&
                                        controller.passengerChild.text.isNotEmpty) {
                                      controller.save();
                                    }
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
