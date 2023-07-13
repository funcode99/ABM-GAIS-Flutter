import 'package:collection/collection.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/calendar/custom_calendar_picker.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_controller.dart';
import 'package:gais/screen/fss/booking_meeting_room/widget/meeting_room_time_picker_dialog.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/validator/custom_validation_builder.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DetailBookingMeetingRoomScreen extends StatelessWidget {
  const DetailBookingMeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookingMeetingRoomModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final DetailBookingMeetingRoomController controller =
    Get.put(DetailBookingMeetingRoomController()
      ..selectedItem(selectedItem));

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
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Obx(() {
                          if (controller.selectedItem.value.status == null) {
                            return const SizedBox();
                          }
                          return CustomStatusContainer(
                            backgroundColor: greenColor,
                            status: "${controller.selectedItem.value.status}",
                          );
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Obx(() {
                      return Text(
                        controller.selectedItem.value.noBookingMeeting ?? "-",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      );
                    }),
                  ),
                  Obx(() {
                    if (controller.selectedItem.value.codeStatusDoc
                        .toString() ==
                        "0") {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              controller.updateOnEdit();
                            },
                            style: OutlinedButton.styleFrom(
                              minimumSize: const Size(75, 30),
                            ),
                            child: controller.onEdit.value
                                ? Text("Cancel".tr)
                                : Text("Edit".tr),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          controller.onEdit.value
                              ? ElevatedButton(
                            onPressed: controller.enableButton.value
                                ? () {
                              controller.updateData();
                            }
                                : null,
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(75, 30),
                                backgroundColor: successColor),
                            child: Text("Save".tr),
                          )
                              : ElevatedButton(
                            onPressed: () {
                              controller.submitHeader();
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(75, 30),
                                backgroundColor: successColor),
                            child: Text("Book".tr),
                          ),
                        ],
                      );
                    } else if (controller.selectedItem.value.codeStatusDoc == BookingMeetingRoomEnum.booked.value) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              controller.cancelHeader();
                            },
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size(75, 30),
                                backgroundColor: redColor),
                            child: Text("Cancel".tr),
                          )
                        ],
                      );
                    }
                    return const SizedBox();
                  }),
                  const SizedBox(
                    height: 16,
                  ),
                  const Divider(
                    height: 20,
                    color: greyColor,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: CustomTextFormField(
                        isRequired: true,
                        readOnly: true,
                        controller: controller.createdAtController,
                        label: "Created Date".tr),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: CustomTextFormField(
                        isRequired: true,
                        readOnly: true,
                        controller: controller.createdByController,
                        label: "Created By".tr),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextFormField(
                              isRequired: true,
                              readOnly: true,
                              controller: controller.companyController,
                              label: "Company".tr),
                          const SizedBox(
                            height: 8,
                          ),
                          CustomTextFormField(
                              isRequired: true,
                              readOnly: true,
                              controller: controller.siteController,
                              label: "Site".tr),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(() {
                            return CustomTextFormField(
                                isRequired: true,
                                readOnly: !controller.onEdit.value,
                                controller: controller.titleController,
                                label: "Title".tr);
                          }),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(() {
                            return CustomTextFormField(
                                isRequired: true,
                                readOnly: !controller.onEdit.value,
                                suffixIcon: const Icon(IconlyLight.calendar),
                                onTap: controller.onEdit.value ? () {
                                  showCustomCalendarPicker(
                                    context,
                                    dismissible: true,
                                    minimumDate: DateTime.now(),
                                    maximumDate:
                                    DateTime.now().add(
                                        const Duration(days: 365)),
                                    endDate: controller.endDate.value,
                                    startDate: controller.startDate.value,
                                    backgroundColor: Colors.white,
                                    primaryColor: Colors.green,
                                    onApplyClick: (start, end) {
                                      controller.startDate.value = start;
                                      controller.endDate.value = end;
                                      controller.dateController.text =
                                      "${controller.dateFormat.format(start)} ${end !=
                                          null ? "-" : ""} ${end != null ? controller
                                          .dateFormat.format(end) : ""}";
                                      controller.update();
                                    },
                                    onCancelClick: () {},
                                  );
                                } : null,
                                controller: controller.dateController,
                                label: "Date".tr);
                          }),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(() {
                            return CustomTextFormField(
                                isRequired: true,
                                readOnly: !controller.onEdit.value,
                                suffixIcon: const Icon(IconlyLight.time_circle),
                                onTap: controller.onEdit.value ? () {
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
                                      "${startTime
                                          ?.toStringWithFormat()} ${endTime !=
                                          null ? "-" : ""} ${endTime
                                          ?.toStringWithFormat() ?? ""}";
                                    },
                                  ));
                                } : null,
                                controller: controller.timeController,
                                label: "Time Detail".tr);
                          }),
                          const SizedBox(
                            height: 8,
                          ),
                          /*CustomTextFormField(
                        isRequired: true,
                        suffixIcon: const Icon(IconlyLight.lock),
                        controller: controller.meetingRoomController,
                        label: "Meeting Room".tr),*/
                          Obx(() {
                            if (controller.onEdit.value) {
                              return CustomDropDownFormField(
                                isRequired: true,
                                items: controller.listRoom
                                    .map((e) =>
                                    DropdownMenuItem(
                                      value: e.id.toString(),
                                      child: Text("${e.nameMeetingRoom}"),
                                    ))
                                    .toList(),
                                onChanged: (item) {
                                  controller.onChangeSelectedRoom(
                                      item.toString());
                                },
                                label: "Meeting Room".tr,
                                value: controller.selectedRoom.value?.id
                                    .toString(),
                              );
                            }

                            return CustomTextFormField(
                                isRequired: true,
                                readOnly: true,
                                suffixIcon: const Icon(IconlyLight.lock),
                                controller: controller.meetingRoomController,
                                label: "Meeting Room".tr);

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
                                    text: "*",
                                    style: TextStyle(color: Colors.red)),
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
                                color: !controller.onEdit.value ? neutralColor : Colors.white,
                                border: Border.all(
                                  color: controller.showParticipantError.value
                                      ? Colors.redAccent
                                      : Colors.black,
                                  width: 1,),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Obx(() {
                                if (controller.onEdit.value) {
                                  return Autocomplete<EmployeeModel>(
                                    optionsViewBuilder: (context, onSelected,
                                        options) {
                                      return Container(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 4.0),
                                        child: Align(
                                          alignment: Alignment.topCenter,
                                          child: Material(
                                            elevation: 4.0,
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  maxHeight: 200),
                                              child: ListView.builder(
                                                shrinkWrap: true,
                                                itemCount: options.length,
                                                itemBuilder: (
                                                    BuildContext context,
                                                    int index) {
                                                  final EmployeeModel option = options.elementAt(index);
                                                  return TextButton(
                                                    onPressed: () {
                                                      onSelected(option);
                                                    },
                                                    child: Align(
                                                      alignment: Alignment
                                                          .centerLeft,
                                                      child: Padding(
                                                        padding: const EdgeInsets
                                                            .symmetric(
                                                            vertical: 0.0),
                                                        child: Text(
                                                          "${option.employeeName}",
                                                          textAlign: TextAlign
                                                              .left,
                                                          style: listSubTitleTextStyle
                                                              .copyWith(
                                                              color: Colors
                                                                  .black),
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
                                    optionsBuilder: (
                                        TextEditingValue textEditingValue) {
                                      if (textEditingValue.text == '') {
                                        return const Iterable<EmployeeModel>.empty();
                                      }
                                      return controller.listEmployee.where((EmployeeModel option) {
                                        return option.employeeName!.contains(textEditingValue.text.toLowerCase()) || option.email!.contains(textEditingValue.text.toLowerCase());
                                      });
                                    },
                                    onSelected: (EmployeeModel selected) {
                                      controller.listSelectedEmployee.add(selected);
                                      controller.autocompleteController.text = "";
                                    },
                                    fieldViewBuilder: (context, ttec, tfn,
                                        onFieldSubmitted) {
                                      controller.autocompleteController = ttec;
                                      return Obx(() {
                                        return Wrap(
                                          runSpacing: 8,
                                          runAlignment: WrapAlignment.center,
                                          children: [
                                            ...controller.listSelectedEmployee
                                                .mapIndexed((index, item) =>
                                                Container(
                                                  decoration: const BoxDecoration(
                                                    borderRadius: BorderRadius
                                                        .all(
                                                      Radius.circular(4.0),
                                                    ),
                                                    color: Color(0xFFe4e4e4),
                                                  ),
                                                  margin: const EdgeInsets.only(
                                                      right: 5.0, left: 5),
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 4.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize
                                                        .min,
                                                    children: [
                                                      InkWell(
                                                        child: Text(
                                                          item.employeeName ?? "",
                                                          style: listSubTitleTextStyle,
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
                                                          controller.deleteParticipantItem(item);
                                                          controller.updateButton();
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ))
                                                .toList(),
                                            SizedBox(
                                              width: 100,
                                              child: TextFormField(
                                                controller: ttec,
                                                focusNode: tfn,
                                                validator: (value) {
                                                  controller.showParticipantError(
                                                      controller.listSelectedEmployee
                                                          .isEmpty);

                                                  if(controller.listSelectedEmployee
                                                      .isEmpty){
                                                    return "";
                                                  }
                                                  return null;
                                                },
                                                decoration: InputDecoration(
                                                    isDense: true,
                                                    hintText: "Participant".tr,
                                                    border: InputBorder.none,
                                                    contentPadding: const EdgeInsets
                                                        .symmetric(
                                                        horizontal: 4.0,
                                                        vertical: 4.0),
                                                    errorText: null,
                                                    errorBorder: const OutlineInputBorder(
                                                      borderSide: BorderSide.none,
                                                      gapPadding: 0,
                                                    ),
                                                    errorStyle: const TextStyle(
                                                        height: 0
                                                    )
                                                ),

                                              ),
                                            )
                                          ],
                                        );
                                      });
                                    },
                                  );
                                }
                                return Wrap(
                                    runSpacing: 8,
                                    runAlignment: WrapAlignment.center,
                                    children: controller.listSelectedEmployee
                                        .map((EmployeeModel item) {
                                      return Container(
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius
                                              .all(
                                            Radius.circular(4.0),
                                          ),
                                          color:
                                          Colors.white,
                                        ),
                                        margin:
                                        const EdgeInsets.only(
                                            right: 5.0, left: 5),
                                        padding: const EdgeInsets
                                            .symmetric(
                                            horizontal: 10.0,
                                            vertical: 4.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceBetween,
                                          children: [
                                            InkWell(
                                              child: Text(
                                                item.employeeName ?? "",
                                                style: listSubTitleTextStyle,
                                              ),
                                              onTap: () {
                                                //print("$tag selected");
                                              },
                                            ),
                                            const SizedBox(
                                                width: 4.0),
                                          ],
                                        ),
                                      );
                                    }).toList());
                              }),
                            );
                          }),
                          Obx(() {
                            if (controller.showParticipantError.value) {
                              return const Padding(
                                padding: EdgeInsets.only(left: 10, top: 8),
                                child: Text(
                                  "This field is required", style: TextStyle(
                                    color: Colors.redAccent,
                                    fontSize: 12
                                ),),
                              );
                            }
                            return const SizedBox();
                          }),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(() {
                            return CustomTextFormField(
                                readOnly: !controller.onEdit.value,
                                validator: ValidationBuilder(optional: true)
                                    .validLink()
                                    .build(),
                                controller: controller.linkController,
                                label: "Link".tr);
                          }),
                          const SizedBox(
                            height: 8,
                          ),
                          Obx(() {
                            return CustomTextFormField(
                                readOnly: !controller.onEdit.value,
                                multiLine: true,
                                controller: controller.remarksController,
                                label: "Remarks".tr);
                          }),
                          const SizedBox(
                            height: 32,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  )
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
