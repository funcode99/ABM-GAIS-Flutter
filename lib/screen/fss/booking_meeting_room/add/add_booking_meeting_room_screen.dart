import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/booking_meeting_room/recurrence_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/data/model/master/facility/facility_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/calendar/custom_calendar_picker.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/dialog/recurrence_dialog.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/custom_form_file_picker.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/add/add_booking_meeting_room_controller.dart';
import 'package:gais/screen/fss/booking_meeting_room/widget/meeting_room_time_picker_dialog.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/input_formatter/min_value_text_input_formatter.dart';
import 'package:gais/util/validator/custom_validation_builder.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddBookingMeetingRoomScreen extends StatelessWidget {
  const AddBookingMeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddBookingMeetingRoomController controller =
        Get.put(AddBookingMeetingRoomController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(
          result: false,
        ),
        backgroundColor: whiteColor,
        title: Text("Booking Meeting Room".tr, style: appTitle),
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
              controller.updateButton();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
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
                      "Booking Info".tr,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Obx(() {
                    if (controller.enableSelectCompany.value) {
                      return CustomDropDownFormField(
                        items: controller.listCompany
                            .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text("${e.companyName}"),
                                ))
                            .toList(),
                        onChanged: (item) {
                          controller.onChangeSelectedCompany(item.toString());
                        },
                        label: "Company".tr,
                        value: controller.selectedCompany.value != null
                            ? controller.selectedCompany.value?.id.toString()
                            : "",
                      );
                    } else {
                      return CustomTextFormField(
                          isRequired: true,
                          readOnly: true,
                          controller: controller.companyController,
                          label: "Company".tr);
                    }

                    return const SizedBox();
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    if(controller.listSite.length == 1){
                      return CustomTextFormField(
                          isRequired: false,
                          controller: controller.companyController,
                          suffixIcon: Icon(Icons.keyboard_arrow_down),
                          label: "Company".tr);
                    }
                    if (controller.enableSelectSite.value) {
                      return CustomDropDownFormField(
                        items: controller.listSite
                            .map((e) => DropdownMenuItem(
                                  value: e.id.toString(),
                                  child: Text("${e.siteName}"),
                                ))
                            .toList(),
                        onChanged: (item) {
                          controller.onChangeSelectedSite(item.toString());
                        },
                        label: "Site".tr,
                        value: controller.selectedSite.value != null
                            ? controller.selectedSite.value?.id.toString()
                            : "",
                      );
                    } else {
                      return CustomTextFormField(
                          isRequired: true,
                          readOnly: true,
                          controller: controller.siteController,
                          label: "Site".tr);
                    }

                    return const SizedBox();
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.titleController,
                      label: "Subject".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      suffixIcon: const Icon(IconlyLight.calendar),
                      onTap: () {
                        showCustomCalendarPicker(
                          context,
                          dismissible: true,
                          isRange: false,
                          minimumDate: DateTime.now(),
                          maximumDate:
                              DateTime.now().add(const Duration(days: 365)),
                          endDate: controller.endDate.value,
                          startDate: controller.startDate.value,
                          backgroundColor: Colors.white,
                          primaryColor: Colors.green,
                          onApplyClick: (start, end) {
                            controller.startDate.value = start;
                            controller.endDate.value = end;
                            controller.dateController.text =
                                "${controller.dateFormat.format(start)} ${end != null ? "-" : ""} ${end != null ? controller.dateFormat.format(end) : ""}";
                            controller.update();
                          },
                          onCancelClick: () {},
                        );
                      },
                      controller: controller.dateController,
                      label: "Date".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      suffixIcon: const Icon(IconlyLight.time_circle),
                      onTap: () {
                        if (controller.startDate.value == null &&
                            controller.endDate.value == null) {
                          Get.showSnackbar(
                            CustomGetSnackBar(
                                message: "Please choose date first",
                                backgroundColor: redColor),
                          );
                        } else {
                          FocusScope.of(context).requestFocus(FocusNode());
                          Get.dialog(MeetingRoomTimePickerDialog(
                            startDate: controller.startDate.value,
                            endDate: controller.endDate.value,
                            startTime: controller.startTime.value,
                            endTime: controller.endTime.value,
                            onConfirmClick: (startTime, endTime) {
                              controller.startTime.value = startTime;
                              controller.endTime.value = endTime;
                              controller.timeController.text =
                                  "${startTime?.toStringWithFormat()} ${endTime != null ? "-" : ""} ${endTime?.toStringWithFormat() ?? ""}";
                            },
                          ));
                        }
                      },
                      controller: controller.timeController,
                      label: "Time Detail".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  /*CustomTextFormField(
                      isRequired: true,
                      suffixIcon: const Icon(IconlyLight.lock),
                      controller: controller.meetingRoomController,
                      label: "Meeting Room".tr),*/
                  Obx(() {
                    return CustomDropDownFormField(
                      isRequired: true,
                      items: controller.listRoom
                          .map((e) => DropdownMenuItem(
                                value: e.id.toString(),
                                child: Text("${e.nameMeetingRoom}"),
                              ))
                          .toList(),
                      onChanged: (item) {
                        controller.onChangeSelectedRoom(item.toString());
                      },
                      hintText: "Choose A Meeting Room",
                      label: "Meeting Room".tr,
                      value: controller.selectedRoom.value != null
                          ? controller.selectedRoom.value?.id.toString()
                          : "",
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                        MinValueTextInputFormatter(0)
                      ],
                      inputType: TextInputType.number,
                      controller: controller.floorController,
                      label: "Floor".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      suffixIcon: const Icon(IconlyLight.user),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3),
                        MinValueTextInputFormatter(0)
                      ],
                      inputType: TextInputType.number,
                      controller: controller.capacityController,
                      label: "Capacity".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Participant".tr,
                      style: formlabelTextStyle,
                      children: const <TextSpan>[
                        TextSpan(
                            text: "*", style: TextStyle(color: Colors.red)),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.showParticipantError.value
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
                          ...controller.listSelectedEmployee
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
                                            item.employeeName ?? "",
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
                                            controller
                                                .deleteParticipantItem(item);
                                            controller.updateButton();
                                          },
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                          SizedBox(
                            width: double.infinity,
                            child: TypeAheadFormField<EmployeeModel>(
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
                                final list = await controller
                                    .getEmployeeByKeyword(pattern);
                                return list;
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text("${suggestion.employeeName}"),
                                  subtitle: Text("${suggestion.email}"),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                controller.listSelectedEmployee.add(suggestion);
                                controller.autocompleteController.text = "";
                              },
                              debounceDuration:
                                  const Duration(milliseconds: 1500),
                              hideOnLoading: true,
                              hideSuggestionsOnKeyboardHide: true,
                              keepSuggestionsOnLoading: false,
                              minCharsForSuggestions: 1,
                              validator: (value) {
                                controller.showParticipantError(
                                    controller.listSelectedEmployee.isEmpty);

                                if (controller.listSelectedEmployee.isEmpty) {
                                  return "";
                                }
                                return null;
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  Obx(() {
                    if (controller.showParticipantError.value) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 10, top: 8),
                        child: Text(
                          "This field is required",
                          style:
                              TextStyle(color: Colors.redAccent, fontSize: 12),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "External Participant".tr,
                      style: formlabelTextStyle,
                      children: const <TextSpan>[],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.showExternalParticipantError.value
                              ? Colors.redAccent
                              : Colors.black,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      child: Wrap(
                        runSpacing: 8,
                        runAlignment: WrapAlignment.center,
                        children: [
                          ...controller.listExternalParticipant
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
                                            item,
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
                                            controller
                                                .deleteExternalParticipant(
                                                    index);
                                          },
                                        )
                                      ],
                                    ),
                                  ))
                              .toList(),
                          SizedBox(
                            width: double.infinity,
                            child: TextFormField(
                              decoration: InputDecoration(
                                  isDense: true,
                                  hintText: "External Participant".tr,
                                  border: InputBorder.none,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 4.0, vertical: 4.0),
                                  errorText: null,
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    gapPadding: 0,
                                  ),
                                  errorStyle: const TextStyle(height: 0)),
                              controller : controller.externalParticipantController,
                              onFieldSubmitted: (value){
                                controller.addExternalParticipant(value);
                              },
                              onTapOutside: (_){
                                if(controller.externalParticipantController.text.isNotEmpty){
                                  controller.addExternalParticipant(controller.externalParticipantController.text);
                                }
                              },
                              onChanged: (value){
                                if(value.isNotEmpty){
                                  controller.showExternalParticipantError(!value.isEmail);
                                }else{
                                  controller.showExternalParticipantError(false);
                                }
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }),
                  Obx(() {
                    if (controller.showExternalParticipantError.value) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 10, top: 8),
                        child: Text(
                          "This field is not a valid email address",
                          style:
                          TextStyle(color: Colors.redAccent, fontSize: 12),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Online Meeting?".tr,
                      style: formlabelTextStyle,
                      children: const <TextSpan>[],
                    ),
                  ),
                  Obx(() {
                    return Switch(
                      value: controller.isOnlineMeeting.value,
                      onChanged: (value) {
                        controller.isOnlineMeeting(value);
                      },
                      activeColor: infoColor,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    if (controller.isOnlineMeeting.value) {
                      return CustomTextFormField(
                          readOnly: true,
                          controller: controller.linkController,
                          label: "Link".tr);
                    }
                    return const SizedBox();
                  }),
                  Obx(() {
                    return SizedBox(
                      height: controller.isOnlineMeeting.value ? 8 : 0,
                    );
                  }),
                  RichText(
                    text: TextSpan(
                      text: "Recurrence?".tr,
                      style: formlabelTextStyle,
                      children: const <TextSpan>[],
                    ),
                  ),
                  Obx(() {
                    return Switch(
                      value: controller.isRecurrence.value,
                      onChanged: (value) {
                        controller.isRecurrence(value);
                      },
                      activeColor: infoColor,
                    );
                  }),
                  const SizedBox(
                    height: 8,
                  ),

                  Obx(() {
                    if (controller.isRecurrence.value) {
                      return CustomTextFormField(
                          readOnly: true,
                          onTap: () async{

                            RecurrenceModel? result = await Get.dialog(
                                RecurrenceDialog(
                                  recurrenceModel: controller.selectedRecurrence.value,
                                )
                            );
                            if(result!=null){
                              controller.recurrenceController.text = result.text ?? "";
                              controller.selectedRecurrence.value = result;
                            }
                          },
                          controller: controller.recurrenceController,
                          label: "Recurrence".tr);
                    }
                    return const SizedBox();
                  }),
                  Obx(() {
                    return SizedBox(
                      height: controller.isRecurrence.value ? 8 : 0,
                    );
                  }),


                  RichText(
                    text: TextSpan(
                      text: "Facility".tr,
                      style: formlabelTextStyle,
                      children: const <TextSpan>[
                        /*TextSpan(
                            text: "*", style: TextStyle(color: Colors.red)),*/
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: controller.showFacilityError.value
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
                          ...controller.listSelectedFacility
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
                                    "${item.facilityName}",
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
                                    controller.deleteFacility(item.id);
                                    controller.updateButton();
                                  },
                                )
                              ],
                            ),
                          ))
                              .toList(),
                          SizedBox(
                            width: double.infinity,
                            child: TypeAheadFormField<FacilityModel>(
                              textFieldConfiguration: TextFieldConfiguration(
                                controller: controller.facilityAutocompleteController,
                                autofocus: false,
                                style: Theme.of(context).textTheme.titleMedium,
                                decoration: InputDecoration(
                                    isDense: true,
                                    hintText: "Facility".tr,
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
                                final list = await controller.getFacilityByKeyword(pattern);
                                return list;
                              },
                              itemBuilder: (context, suggestion) {
                                return ListTile(
                                  title: Text("${suggestion.facilityName}"),
                                );
                              },
                              onSuggestionSelected: (suggestion) {
                                controller.addFacility(suggestion);
                                controller.facilityAutocompleteController.text = "";
                                controller.updateButton();
                              },
                              debounceDuration:
                              const Duration(milliseconds: 1500),
                              hideOnLoading: false,
                              hideSuggestionsOnKeyboardHide: true,
                              keepSuggestionsOnLoading: false,
                              minCharsForSuggestions: 0,
                              validator: (value) {/*
                                controller.showFacilityError(controller.listSelectedFacility.isEmpty);

                                if (controller.listSelectedFacility.isEmpty) {
                                  return "";
                                }
                                return null;*/
                              },
                            ),
                          )
                        ],
                      ),
                    );
                  }),

                  const SizedBox(
                    height: 8,
                  ),
                  Obx(() {
                    if (controller.showFacilityError.value) {
                      return const Padding(
                        padding: EdgeInsets.only(left: 10, top: 8),
                        child: Text(
                          "This field is required",
                          style:
                          TextStyle(color: Colors.redAccent, fontSize: 12),
                        ),
                      );
                    }
                    return const SizedBox();
                  }),

                  const SizedBox(
                    height: 8,
                  ),
                  CustomFormFilePicker(
                    label: "Attachment".tr,
                    onFileSelected: (File value) {
                      controller.selectedFile = value;
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      multiLine: true,
                      controller: controller.remarksController,
                      label: "Description".tr),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Obx(() => ElevatedButton(
                            onPressed: controller.enableButton.value
                                ? () {
                                    controller.saveData();
                                  }
                                : null,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: successColor),
                            child: Text("Book".tr),
                          )),
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
