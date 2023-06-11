import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/calendar/custom_calendar_picker.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/add/add_booking_meeting_room_controller.dart';
import 'package:gais/screen/fss/booking_meeting_room/widget/meeting_room_time_picker_dialog.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/validator/custom_validation_builder.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:textfield_tags/textfield_tags.dart';

class AddBookingMeetingRoomScreen extends StatelessWidget {
  const AddBookingMeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddBookingMeetingRoomController controller =
        Get.put(AddBookingMeetingRoomController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
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
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.titleController,
                      label: "Title".tr),
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
                                "${controller.dateFormat.format(start)} ${end!=null ? "-":""} ${end!=null ? controller.dateFormat.format(end) :""}";
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
                      readOnly: true,
                      suffixIcon: const Icon(IconlyLight.time_circle),
                      onTap: () {
                        if(controller.startDate.value == null && controller.endDate.value == null){
                          Get.showSnackbar(CustomGetSnackBar(message: "Please choose date first",backgroundColor: redColor),);
                        }else{
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
                                child: Text("${e.roomName}"),
                              ))
                          .toList(),
                      onChanged: (item) {
                        controller.onChangeSelectedRoom(item.toString());
                      },
                      label: "Meeting Room".tr,
                      value: controller.selectedRoom.value?.id.toString(),
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
                  Autocomplete<String>(
                    optionsViewBuilder: (context, onSelected, options) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 4.0),
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Material(
                            elevation: 4.0,
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxHeight: 200),
                              child: ListView.builder(
                                shrinkWrap: true,
                                itemCount: options.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final dynamic option =
                                      options.elementAt(index);
                                  return TextButton(
                                    onPressed: () {
                                      onSelected(option);
                                    },
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 0.0),
                                        child: Text(
                                          "$option",
                                          textAlign: TextAlign.left,
                                          style: listSubTitleTextStyle.copyWith(
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text == '') {
                        return const Iterable<String>.empty();
                      }
                      return controller.emails.where((String option) {
                        return option
                            .contains(textEditingValue.text.toLowerCase());
                      });
                    },
                    onSelected: (String selectedTag) {
                      controller.textfieldTagsController.addTag = selectedTag;
                    },
                    fieldViewBuilder: (context, ttec, tfn, onFieldSubmitted) {
                      return TextFieldTags(
                        textEditingController: ttec,
                        focusNode: tfn,
                        textfieldTagsController:
                            controller.textfieldTagsController,
                        initialTags: [],
                        textSeparators: const [' ', ','],
                        letterCase: LetterCase.normal,
                        validator: (String email) {
                          controller.updateButton();
                          if (controller.textfieldTagsController.getTags!
                              .contains(email)) {
                            return '$email already selected';
                          }
                          return null;
                        },
                        inputfieldBuilder:
                            (context, tec, fn, error, onChanged, onSubmitted) {
                          return ((context, sc, tags, onTagDelete) {
                            return TextFormField(
                              validator: (item) {
                                if (controller
                                    .textfieldTagsController.getTags!.isEmpty) {
                                  return "The field is required";
                                }

                                return null;
                              },
                              controller: tec,
                              focusNode: fn,
                              decoration: InputDecoration(
                                hintText:
                                    controller.textfieldTagsController.hasTags
                                        ? ''
                                        : "Participant".tr,
                                errorText: error,
                                prefixIconConstraints: BoxConstraints(
                                    maxWidth:
                                        MediaQuery.of(context).size.width *
                                            0.74),
                                prefixIcon: tags.isNotEmpty
                                    ? SingleChildScrollView(
                                        controller: sc,
                                        scrollDirection: Axis.horizontal,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8),
                                          child: Row(
                                              children:
                                                  tags.map((String email) {
                                            return Container(
                                              decoration: const BoxDecoration(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(4.0),
                                                ),
                                                color: Color(0xFFe4e4e4),
                                              ),
                                              margin: const EdgeInsets.only(
                                                  right: 5.0, left: 5),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 4.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  InkWell(
                                                    child: Text(
                                                      email,
                                                      style:
                                                          listSubTitleTextStyle,
                                                    ),
                                                    onTap: () {
                                                      //print("$tag selected");
                                                    },
                                                  ),
                                                  const SizedBox(width: 4.0),
                                                  InkWell(
                                                    child: const Icon(
                                                      Icons.cancel,
                                                      size: 14.0,
                                                      color: greyColor,
                                                    ),
                                                    onTap: () {
                                                      onTagDelete(email);
                                                    },
                                                  )
                                                ],
                                              ),
                                            );
                                          }).toList()),
                                        ),
                                      )
                                    : null,
                              ),
                              onChanged: onChanged,
                            );
                          });
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      validator:
                          ValidationBuilder(optional: true).validLink().build(),
                      controller: controller.linkController,
                      label: "Link".tr),
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
                            child: Text("Save".tr),
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
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
