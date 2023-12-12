import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/image_constant.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customfilledbutton.dart';
import 'package:gais/reusable/customformlabel.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/accommodation_screen.dart';
import 'package:gais/screen/tms/request_trip/add/accommodation/add/add_accommodation_controller.dart';
import 'package:gais/screen/tms/request_trip/form_request_trip/form_request_trip_screen.dart';
import 'package:get/get.dart';
import 'package:gais/data/model/request_trip/get_guest_bytrip_model.dart' as guest;

class AddAccommodationScreen extends StatelessWidget {
  const AddAccommodationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddAccommodationController>(
        init: AddAccommodationController(),
        builder: (controller) {
          return Scaffold(
            appBar: TopBar(
                title: Text("Accommodation", style: appTitle),
                leading: CustomBackButton(
                  onPressed: () => controller.formEdit == true
                      ? Get.off(const FormRequestTripScreen(), arguments: {
                          'id': controller.purposeID,
                          'codeDocument': controller.codeDocument,
                        })
                      : Get.off(
                          const AccommodationScreen(),
                          arguments: {
                            'purposeID': controller.purposeID,
                            'codeDocument': controller.codeDocument,
                          },
                        ),
                )),
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
                      child: SvgPicture.asset(ImageConstant.building, height: 25),
                    ),
                    Text("Accommodation", style: appTitle),
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

                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.hotelFare,
                              label: "Hotel Fare",
                              hintText: "Maz Fare",
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
                            CustomTextFormField(
                              controller: controller.travellerGender,
                              label: "Gender",
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
                            const SizedBox(height: 35),
                            Text("Requested Accommodation", style: formlabelTextStyle),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "Country",
                              hintText: controller.isLoading ? "Loading..." : "Country",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || controller.selectedCountry == null) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              value: controller.selectedCountry,
                              items: controller.countryList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e.countryName.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                print(value);
                                controller.selectedCountry = value!;
                                controller.fetchCity(value.isoCountryCode.toString());
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomDropDownFormField(
                              label: "City",
                              hintText: controller.isLoading ? "Loading..." : "City",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || controller.selectedCity == null) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              value: controller.selectedCity,
                              items: controller.cityList
                                  .map((e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e.cityName.toString()),
                                        onTap: () {
                                          controller.cityName = e.cityName;
                                          controller.update();
                                        },
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.selectedCity = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),

                            CustomTextFormField(
                              controller: controller.checkinDate,
                              label: "Check In",
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
                                controller.dateCheckin = date!;
                                controller.checkinDate.text = controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.checkoutDate,
                              label: "Checkout",
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
                                controller.dateCheckout = date!;
                                controller.checkoutDate.text = controller.dateFormat.format(date);
                                controller.update();
                              }),
                            ),

                            const SizedBox(height: 8),
                            Container(
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomFormLabel(label: "Room", showRequired: true),
                                      Container(
                                        height: 50,
                                        width: Get.width / 4.5,
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: controller.borderColor),
                                        ),
                                        child: DropdownButton(
                                          value: controller.roomController.text.isEmpty ? null : controller.roomController.text,
                                          items: List.generate(
                                              5,
                                                  (index) => DropdownMenuItem(
                                                child: Text((index + 1).toString()),
                                                value: (index + 1).toString(),
                                              )),
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          hint: Text("Room", style: hintTextStyle),
                                          isExpanded: true,
                                          underline: SizedBox(),
                                          onChanged: (value) {
                                            controller.roomController.text = value.toString();
                                            controller.borderColor = greyColor;
                                            controller.update();
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomFormLabel(label: "Guest", showRequired: true),
                                      Container(
                                        height: 50,
                                        width: Get.width / 4.5,
                                        padding: EdgeInsets.symmetric(horizontal: 10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          border: Border.all(color: controller.borderColor),
                                        ),
                                        child: DropdownButton(
                                          value: controller.guestController.text.isEmpty ? null : controller.guestController.text,
                                          items: List.generate(
                                              10,
                                                  (index) => DropdownMenuItem(
                                                child: Text((index).toString()),
                                                value: (index).toString(),
                                              )),
                                          icon: Icon(Icons.keyboard_arrow_down),
                                          hint: Text("Guest", style: hintTextStyle),
                                          isExpanded: true,
                                          underline: SizedBox(),
                                          onChanged: (value) {
                                            controller.guestController.text = value.toString();
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
                            CustomDropDownFormField(
                              label: "Accommodation Type",
                              hintText: "Type",
                              isRequired: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "This field is required";
                                }
                                return null;
                              },
                              value: controller.accommodationType,
                              items: controller.hotelTypeList
                                  .map((e) => DropdownMenuItem(
                                        value: e.id.toString(),
                                        child: Text(e.typeAccomodation.toString()),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                controller.accommodationType = value;
                                controller.update();
                              },
                            ),
                            const SizedBox(height: 8),
                            CustomTextFormField(
                              controller: controller.remarks,
                              label: "Remarks",
                              hintText: "Remarks",
                              multiLine: true,
                            ),
                            /*controller.hasGuest
                                ? SizedBox(
                                    // height: 50,
                                    child: Row(
                                      children: [
                                        Checkbox(
                                          checkColor: Colors.white,
                                          value: controller.isSharing,
                                          onChanged: (bool? value) {
                                            controller.isSharing = value!;
                                            controller.update();
                                          },
                                        ),
                                        Text("Sharing with", style: listTitleTextStyle)
                                      ],
                                    ),
                                  )
                                : Container(),
                            controller.isSharing && controller.hasGuest
                                ? TextFormField(
                                    controller: controller.sharingName,
                                    // label: "",
                                    // hintText: "Name",
                                  )
                                : Container(),*/
                            const SizedBox(height: 8),
                            // Text("Create GL?", style: listTitleTextStyle),
                            // Row(
                            //   children: [
                            //     Checkbox(
                            //       checkColor: Colors.white,
                            //       value: controller.createGL,
                            //       onChanged: (bool? value) {
                            //         controller.createGL = value!;
                            //         controller.update();
                            //       },
                            //     ),
                            //     Text("Yes", style: listTitleTextStyle)
                            //   ],
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomFilledButton(
                                  width: 100,
                                  color: Colors.transparent,
                                  borderColor: infoColor,
                                  title: "Cancel",
                                  fontColor: infoColor,
                                  onPressed: () => controller.formEdit == true
                                      ? Get.off(const FormRequestTripScreen(), arguments: {
                                          'id': controller.purposeID,
                                          'codeDocument': controller.codeDocument,
                                        })
                                      : Get.off(const AccommodationScreen(), arguments: {
                                          'purposeID': controller.purposeID,
                                          'codeDocument': controller.codeDocument,
                                        }),
                                ),
                                CustomFilledButton(
                                  width: 100,
                                  color: infoColor,
                                  title: controller.isBooking == true ? "Check" : "Save",
                                  onPressed: () {
                                    if (controller.formKey.currentState?.validate() == true) controller.check();
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
