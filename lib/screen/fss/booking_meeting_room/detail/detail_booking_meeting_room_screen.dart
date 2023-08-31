import 'dart:io';

import 'package:collection/collection.dart';
import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/booking_meeting_room/booking_meeting_room_model.dart';
import 'package:gais/data/model/booking_meeting_room/recurrence_model.dart';
import 'package:gais/data/model/master/employee/employee_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/calendar/custom_calendar_picker.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/dialog/recurrence_dialog.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/custom_form_file_picker.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list/approval_log_list.dart';
import 'package:gais/reusable/sliverappbardelegate.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/detail/detail_booking_meeting_room_controller.dart';
import 'package:gais/screen/fss/booking_meeting_room/widget/meeting_room_time_picker_dialog.dart';
import 'package:gais/util/color/color_util.dart';
import 'package:gais/util/enum/status_enum.dart';
import 'package:gais/util/enum/tab_enum.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/validator/custom_validation_builder.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailBookingMeetingRoomScreen extends StatelessWidget {
  const DetailBookingMeetingRoomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BookingMeetingRoomModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final DetailBookingMeetingRoomController controller = Get.put(
        DetailBookingMeetingRoomController()..selectedItem(selectedItem));

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Booking Meeting Room".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () {
              controller.updateButton();
            },
            child: CustomScrollView(
              slivers: [
                SliverList(
                    delegate: SliverChildListDelegate([
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
                            backgroundColor: ColorUtil.getStatusColorByText(
                                "${controller.selectedItem.value.status}"),
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
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
                    } else if (controller.selectedItem.value.codeStatusDoc ==
                        BookingMeetingRoomEnum.booked.value) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (controller.showCancelButton.value)
                            ElevatedButton(
                              onPressed: () {
                                controller.cancelHeader();
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(75, 30),
                                  backgroundColor: redColor),
                              child: Text("Cancel".tr),
                            ),
                          SizedBox(
                            width:
                                controller.showStartMeetingButton.value ? 8 : 0,
                          ),
                          if (controller.showStartMeetingButton.value)
                            ElevatedButton(
                              onPressed: () {
                                controller.startMeeting();
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(75, 30),
                                  backgroundColor: successColor),
                              child: Text("Start Meeting".tr),
                            ),
                          SizedBox(
                            width:
                                controller.showEndMeetingButton.value ? 8 : 0,
                          ),
                          if (controller.showEndMeetingButton.value)
                            ElevatedButton(
                              onPressed: () {
                                controller.endMeeting();
                              },
                              style: ElevatedButton.styleFrom(
                                  minimumSize: const Size(75, 30),
                                  backgroundColor: successColor),
                              child: Text("End Meeting".tr),
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
                    height: 32,
                  ),
                ])),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: SliverAppBarDelegate(
                    minHeight: 60,
                    maxHeight: 60,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 7,
                            spreadRadius: 1,
                            offset: const Offset(0, 4),
                          )
                        ],
                        color: infoColor,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(8),
                            topLeft: Radius.circular(8)),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Obx(() {
                                return Container(
                                  alignment: Alignment.center,
                                  margin: const EdgeInsets.only(top: 10, left: 5),
                                  width: 100,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: controller.selectedTab.value ==
                                            TabEnum.detail
                                        ? whiteColor
                                        : neutralColor,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        topLeft: Radius.circular(8)),
                                    gradient: LinearGradient(stops: const [
                                      0.1,
                                      0
                                    ], colors: [
                                      controller.selectedTab.value ==
                                              TabEnum.detail
                                          ? blackColor
                                          : whiteColor,
                                      Colors.white
                                    ]),
                                  ),
                                  child: const Text("Detail"),
                                );
                              }),
                              onTap: () {
                                controller.selectedTab(TabEnum.detail);
                              },
                            ),

                            Obx(() {
                              if(controller.selectedItem.value.recurrenceStart != null && controller.selectedItem.value.recurrenceEnd != null){
                                return GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    alignment: Alignment.center,
                                    margin:
                                        const EdgeInsets.only(top: 10, left: 5),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: controller.selectedTab.value ==
                                              TabEnum.recurrence
                                          ? whiteColor
                                          : neutralColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8)),
                                      gradient: LinearGradient(stops: const [
                                        0.1,
                                        0
                                      ], colors: [
                                        controller.selectedTab.value ==
                                                TabEnum.recurrence
                                            ? blackColor
                                            : whiteColor,
                                        Colors.white
                                      ]),
                                    ),
                                    child: const Text("Recurrence"),
                                  ),
                                  onTap: () {
                                    controller.selectedTab(TabEnum.recurrence);
                                  },
                                );
                              }
                              return const SizedBox();
                            }),

                            //approval
                            Obx(() {
                              if(controller.selectedItem.value.isApproval && ((controller.selectedItem.value.nameApproved != null && controller.selectedItem.value.approvedAt != null) || (controller.selectedItem.value.nameRejected != null && controller.selectedItem.value.rejectedAt != null))){
                                return GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    alignment: Alignment.center,
                                    margin:
                                        const EdgeInsets.only(top: 10, left: 5),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: controller.selectedTab.value ==
                                              TabEnum.approval
                                          ? whiteColor
                                          : neutralColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8)),
                                      gradient: LinearGradient(stops: const [
                                        0.1,
                                        0
                                      ], colors: [
                                        controller.selectedTab.value ==
                                                TabEnum.approval
                                            ? blackColor
                                            : whiteColor,
                                        Colors.white
                                      ]),
                                    ),
                                    child: const Text("Approval Info"),
                                  ),
                                  onTap: () {
                                    controller.selectedTab(TabEnum.approval);
                                  },
                                );
                              }
                              return const SizedBox();
                            }),

                            //duration
                            //xxx
                            Obx(() {
                              if(controller.selectedItem.value.durationStart != null && controller.selectedItem.value.durationEnd != null){
                                return GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16),
                                    alignment: Alignment.center,
                                    margin:
                                    const EdgeInsets.only(top: 10, left: 5),
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: controller.selectedTab.value ==
                                          TabEnum.duration
                                          ? whiteColor
                                          : neutralColor,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(8),
                                          topLeft: Radius.circular(8)),
                                      gradient: LinearGradient(stops: const [
                                        0.1,
                                        0
                                      ], colors: [
                                        controller.selectedTab.value ==
                                            TabEnum.duration
                                            ? blackColor
                                            : whiteColor,
                                        Colors.white
                                      ]),
                                    ),
                                    child: const Text("Room Used Duration"),
                                  ),
                                  onTap: () {
                                    controller.selectedTab(TabEnum.duration);
                                  },
                                );
                              }
                              return const SizedBox();
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Obx(() {
                      if (controller.selectedTab.value == TabEnum.detail) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: Card(
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  CustomTextFormField(
                                      isRequired: true,
                                      readOnly: true,
                                      controller:
                                          controller.companyController,
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
                                        controller:
                                            controller.titleController,
                                        label: "Title".tr);
                                  }),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Obx(() {
                                    return CustomTextFormField(
                                        isRequired: true,
                                        readOnly: !controller.onEdit.value,
                                        suffixIcon: const Icon(
                                            IconlyLight.calendar),
                                        onTap: controller.onEdit.value
                                            ? () {
                                                showCustomCalendarPicker(
                                                  context,
                                                  dismissible: true,
                                                  minimumDate:
                                                      DateTime.now(),
                                                  maximumDate:
                                                      DateTime.now().add(
                                                          const Duration(
                                                              days: 365)),
                                                  endDate: controller
                                                      .endDate.value,
                                                  startDate: controller
                                                      .startDate.value,
                                                  backgroundColor:
                                                      Colors.white,
                                                  primaryColor:
                                                      Colors.green,
                                                  onApplyClick:
                                                      (start, end) {
                                                    controller.startDate
                                                        .value = start;
                                                    controller.endDate
                                                        .value = end;
                                                    controller
                                                            .dateController
                                                            .text =
                                                        "${controller.dateFormat.format(start)} ${end != null ? "-" : ""} ${end != null ? controller.dateFormat.format(end) : ""}";
                                                    controller.update();
                                                  },
                                                  onCancelClick: () {},
                                                );
                                              }
                                            : null,
                                        controller:
                                            controller.dateController,
                                        label: "Date".tr);
                                  }),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Obx(() {
                                    return CustomTextFormField(
                                        isRequired: true,
                                        readOnly: !controller.onEdit.value,
                                        suffixIcon: const Icon(
                                            IconlyLight.time_circle),
                                        onTap: controller.onEdit.value
                                            ? () {
                                                FocusScope.of(context)
                                                    .requestFocus(
                                                        FocusNode());
                                                Get.dialog(
                                                    MeetingRoomTimePickerDialog(
                                                  startDate: controller
                                                      .startDate.value,
                                                  endDate: controller
                                                      .endDate.value,
                                                  startTime: controller
                                                      .startTime.value,
                                                  endTime: controller
                                                      .endTime.value,
                                                  onConfirmClick:
                                                      (startTime, endTime) {
                                                    controller.startTime
                                                        .value = startTime;
                                                    controller.endTime
                                                        .value = endTime;
                                                    controller
                                                            .timeController
                                                            .text =
                                                        "${startTime?.toStringWithFormat()} ${endTime != null ? "-" : ""} ${endTime?.toStringWithFormat() ?? ""}";
                                                  },
                                                ));
                                              }
                                            : null,
                                        controller:
                                            controller.timeController,
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
                                            .map((e) => DropdownMenuItem(
                                                  value: e.id.toString(),
                                                  child: Text(
                                                      "${e.nameMeetingRoom}"),
                                                ))
                                            .toList(),
                                        onChanged: (item) {
                                          controller.onChangeSelectedRoom(
                                              item.toString());
                                        },
                                        label: "Meeting Room".tr,
                                        value: controller
                                            .selectedRoom.value?.id
                                            .toString(),
                                      );
                                    }

                                    return CustomTextFormField(
                                        isRequired: true,
                                        readOnly: true,
                                        suffixIcon:
                                            const Icon(IconlyLight.lock),
                                        controller: controller
                                            .meetingRoomController,
                                        label: "Meeting Room".tr);
                                  }),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextFormField(
                                      isRequired: true,
                                      readOnly: true,
                                      inputFormatters: [
                                        FilteringTextInputFormatter
                                            .digitsOnly,
                                      ],
                                      inputType: TextInputType.number,
                                      controller:
                                          controller.floorController,
                                      label: "Floor".tr),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  CustomTextFormField(
                                      isRequired: true,
                                      readOnly: true,
                                      suffixIcon:
                                          const Icon(IconlyLight.user),
                                      inputFormatters: [
                                        FilteringTextInputFormatter
                                            .digitsOnly,
                                      ],
                                      inputType: TextInputType.number,
                                      controller:
                                          controller.capacityController,
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
                                            style: TextStyle(
                                                color: Colors.red)),
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
                                        color: !controller.onEdit.value
                                            ? neutralColor
                                            : Colors.white,
                                        border: Border.all(
                                          color: controller
                                                  .showParticipantError
                                                  .value
                                              ? Colors.redAccent
                                              : Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Obx(() {
                                        if (controller.onEdit.value) {
                                          return Autocomplete<
                                              EmployeeModel>(
                                            optionsViewBuilder: (context,
                                                onSelected, options) {
                                              return Container(
                                                margin: const EdgeInsets
                                                        .symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 4.0),
                                                child: Align(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  child: Material(
                                                    elevation: 4.0,
                                                    child: ConstrainedBox(
                                                      constraints:
                                                          const BoxConstraints(
                                                              maxHeight:
                                                                  200),
                                                      child:
                                                          ListView.builder(
                                                        shrinkWrap: true,
                                                        itemCount:
                                                            options.length,
                                                        itemBuilder:
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                          final EmployeeModel
                                                              option =
                                                              options
                                                                  .elementAt(
                                                                      index);
                                                          return TextButton(
                                                            onPressed: () {
                                                              onSelected(
                                                                  option);
                                                            },
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .centerLeft,
                                                              child:
                                                                  Padding(
                                                                padding: const EdgeInsets
                                                                        .symmetric(
                                                                    vertical:
                                                                        0.0),
                                                                child: Text(
                                                                  "${option.employeeName}",
                                                                  textAlign:
                                                                      TextAlign
                                                                          .left,
                                                                  style: listSubTitleTextStyle.copyWith(
                                                                      color:
                                                                          Colors.black),
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
                                            optionsBuilder:
                                                (TextEditingValue
                                                    textEditingValue) {
                                              if (textEditingValue.text ==
                                                  '') {
                                                return const Iterable<
                                                    EmployeeModel>.empty();
                                              }
                                              return controller.listEmployee
                                                  .where((EmployeeModel
                                                      option) {
                                                return option.employeeName!
                                                        .contains(
                                                            textEditingValue
                                                                .text
                                                                .toLowerCase()) ||
                                                    option.email!.contains(
                                                        textEditingValue
                                                            .text
                                                            .toLowerCase());
                                              });
                                            },
                                            onSelected:
                                                (EmployeeModel selected) {
                                              controller
                                                  .listSelectedEmployee
                                                  .add(selected);
                                              controller
                                                  .autocompleteController
                                                  .text = "";
                                            },
                                            fieldViewBuilder: (context,
                                                ttec,
                                                tfn,
                                                onFieldSubmitted) {
                                              controller
                                                      .autocompleteController =
                                                  ttec;
                                              return Obx(() {
                                                return Wrap(
                                                  runSpacing: 8,
                                                  runAlignment:
                                                      WrapAlignment.center,
                                                  children: [
                                                    ...controller
                                                        .listSelectedEmployee
                                                        .mapIndexed(
                                                            (index, item) =>
                                                                Container(
                                                                  decoration:
                                                                      const BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                      Radius.circular(
                                                                          4.0),
                                                                    ),
                                                                    color: Color(
                                                                        0xFFe4e4e4),
                                                                  ),
                                                                  margin: const EdgeInsets
                                                                          .only(
                                                                      right:
                                                                          5.0,
                                                                      left:
                                                                          5),
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      horizontal:
                                                                          10.0,
                                                                      vertical:
                                                                          4.0),
                                                                  child:
                                                                      Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize.min,
                                                                    children: [
                                                                      InkWell(
                                                                        child:
                                                                            Text(
                                                                          item.employeeName ?? "",
                                                                          style: listSubTitleTextStyle,
                                                                        ),
                                                                        onTap:
                                                                            () {
                                                                          //print("$tag selected");
                                                                        },
                                                                      ),
                                                                      const SizedBox(
                                                                          width: 4.0),
                                                                      InkWell(
                                                                        child:
                                                                            const Icon(
                                                                          Icons.cancel,
                                                                          size: 14.0,
                                                                          color: greyColor,
                                                                        ),
                                                                        onTap:
                                                                            () {
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
                                                              controller
                                                                  .listSelectedEmployee
                                                                  .isEmpty);

                                                          if (controller
                                                              .listSelectedEmployee
                                                              .isEmpty) {
                                                            return "";
                                                          }
                                                          return null;
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                                isDense:
                                                                    true,
                                                                hintText:
                                                                    "Participant"
                                                                        .tr,
                                                                border:
                                                                    InputBorder
                                                                        .none,
                                                                contentPadding: const EdgeInsets
                                                                        .symmetric(
                                                                    horizontal:
                                                                        4.0,
                                                                    vertical:
                                                                        4.0),
                                                                errorText:
                                                                    null,
                                                                errorBorder:
                                                                    const OutlineInputBorder(
                                                                  borderSide:
                                                                      BorderSide
                                                                          .none,
                                                                  gapPadding:
                                                                      0,
                                                                ),
                                                                errorStyle:
                                                                    const TextStyle(
                                                                        height:
                                                                            0)),
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
                                            runAlignment:
                                                WrapAlignment.center,
                                            children: controller
                                                .listSelectedEmployee
                                                .map((EmployeeModel item) {
                                              return Container(
                                                decoration:
                                                    const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(4.0),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                margin:
                                                    const EdgeInsets.only(
                                                        right: 5.0,
                                                        left: 5),
                                                padding: const EdgeInsets
                                                        .symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      child: Text(
                                                        item.employeeName ??
                                                            "",
                                                        style:
                                                            listSubTitleTextStyle,
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
                                    if (controller
                                        .showParticipantError.value) {
                                      return const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 8),
                                        child: Text(
                                          "This field is required",
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 12),
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
                                        color: !controller.onEdit.value
                                            ? neutralColor
                                            : Colors.white,
                                        border: Border.all(
                                          color: controller
                                                  .showExternalParticipantError
                                                  .value
                                              ? Colors.redAccent
                                              : Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      width: double.infinity,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 12, horizontal: 8),
                                      child: Obx(() {
                                        if (controller.onEdit.value) {
                                          return Wrap(
                                            runSpacing: 8,
                                            runAlignment:
                                                WrapAlignment.center,
                                            children: [
                                              ...controller
                                                  .listExternalParticipant
                                                  .mapIndexed((index,
                                                          item) =>
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                                4.0),
                                                          ),
                                                          color: Color(
                                                              0xFFe4e4e4),
                                                        ),
                                                        margin:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 5.0,
                                                                left: 5),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    10.0,
                                                                vertical:
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .min,
                                                          children: [
                                                            InkWell(
                                                              child: Text(
                                                                item,
                                                                style:
                                                                    listSubTitleTextStyle,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 4.0),
                                                            InkWell(
                                                              child:
                                                                  const Icon(
                                                                Icons
                                                                    .cancel,
                                                                size: 14.0,
                                                                color:
                                                                    greyColor,
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
                                                  decoration:
                                                      InputDecoration(
                                                          isDense: true,
                                                          hintText:
                                                              "External Participant"
                                                                  .tr,
                                                          border:
                                                              InputBorder
                                                                  .none,
                                                          contentPadding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      4.0,
                                                                  vertical:
                                                                      4.0),
                                                          errorText: null,
                                                          errorBorder:
                                                              const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide
                                                                    .none,
                                                            gapPadding: 0,
                                                          ),
                                                          errorStyle:
                                                              const TextStyle(
                                                                  height:
                                                                      0)),
                                                  controller: controller
                                                      .externalParticipantController,
                                                  onFieldSubmitted:
                                                      (value) {
                                                    controller
                                                        .addExternalParticipant(
                                                            value);
                                                  },
                                                  onTapOutside: (_) {
                                                    if (controller
                                                        .externalParticipantController
                                                        .text
                                                        .isNotEmpty) {
                                                      controller
                                                          .addExternalParticipant(
                                                              controller
                                                                  .externalParticipantController
                                                                  .text);
                                                    }
                                                  },
                                                  onChanged: (value) {
                                                    if (value.isNotEmpty) {
                                                      controller
                                                          .showExternalParticipantError(
                                                              !value
                                                                  .isEmail);
                                                    } else {
                                                      controller
                                                          .showExternalParticipantError(
                                                              false);
                                                    }
                                                  },
                                                ),
                                              )
                                            ],
                                          );
                                        } else {
                                          return Wrap(
                                              runSpacing: 8,
                                              runAlignment:
                                                  WrapAlignment.center,
                                              children: controller
                                                  .listExternalParticipant
                                                  .map((String item) {
                                                return Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.all(
                                                      Radius.circular(4.0),
                                                    ),
                                                    color: Colors.white,
                                                  ),
                                                  margin:
                                                      const EdgeInsets.only(
                                                          right: 5.0,
                                                          left: 5),
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 10.0,
                                                      vertical: 4.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      InkWell(
                                                        child: Text(
                                                          item ?? "",
                                                          style:
                                                              listSubTitleTextStyle,
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
                                        }
                                      }),
                                    );
                                  }),
                                  Obx(() {
                                    if (controller
                                        .showExternalParticipantError
                                        .value) {
                                      return const Padding(
                                        padding: EdgeInsets.only(
                                            left: 10, top: 8),
                                        child: Text(
                                          "This field is not a valid email address",
                                          style: TextStyle(
                                              color: Colors.redAccent,
                                              fontSize: 12),
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
                                      value:
                                          controller.isOnlineMeeting.value,
                                      onChanged: controller.onEdit.value
                                          ? (value) {
                                              controller
                                                  .isOnlineMeeting(value);
                                            }
                                          : null,
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
                                          controller:
                                              controller.linkController,
                                          label: "Link".tr);
                                    }
                                    return const SizedBox();
                                  }),
                                  Obx(() {
                                    return SizedBox(
                                      height:
                                          controller.isOnlineMeeting.value
                                              ? 8
                                              : 0,
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
                                      onChanged: controller.onEdit.value
                                          ? (value) {
                                              controller
                                                  .isRecurrence(value);
                                            }
                                          : null,
                                      activeColor: infoColor,
                                    );
                                  }),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Obx(() {
                                    if (controller.isRecurrence.value) {
                                      return CustomTextFormField(
                                          readOnly:
                                              !controller.onEdit.value,
                                          onTap: controller.onEdit.value
                                              ? () async {
                                                  RecurrenceModel? result =
                                                      await Get.dialog(
                                                          RecurrenceDialog(
                                                    recurrenceModel: controller
                                                        .selectedRecurrence
                                                        .value,
                                                  ));
                                                  if (result != null) {
                                                    controller
                                                        .recurrenceController
                                                        .text = result
                                                            .text ??
                                                        "";
                                                    controller
                                                        .selectedRecurrence
                                                        .value = result;
                                                  }
                                                }
                                              : null,
                                          controller: controller
                                              .recurrenceController,
                                          label: "Recurrence".tr);
                                    }
                                    return const SizedBox();
                                  }),
                                  Obx(() {
                                    return SizedBox(
                                      height: controller.isRecurrence.value
                                          ? 8
                                          : 0,
                                    );
                                  }),
                                  RichText(
                                    text: TextSpan(
                                      text: "Facility".tr,
                                      style: formlabelTextStyle,
                                      children: const <TextSpan>[],
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
                                        color: !controller.onEdit.value
                                            ? neutralColor
                                            : Colors.white,
                                        border: Border.all(
                                          color: Colors.black,
                                          width: 1,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8),
                                      ),
                                      child: Obx(() {
                                        if (controller.onEdit.value) {
                                          return Wrap(
                                            runSpacing: 8,
                                            runAlignment:
                                                WrapAlignment.center,
                                            children: [
                                              ...controller
                                                  .listSelectedFacility
                                                  .mapIndexed((index,
                                                          item) =>
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .all(
                                                            Radius.circular(
                                                                4.0),
                                                          ),
                                                          color: Color(
                                                              0xFFe4e4e4),
                                                        ),
                                                        margin:
                                                            const EdgeInsets
                                                                    .only(
                                                                right: 5.0,
                                                                left: 5),
                                                        padding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    10.0,
                                                                vertical:
                                                                    4.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize
                                                                  .min,
                                                          children: [
                                                            InkWell(
                                                              child: Text(
                                                                item,
                                                                style:
                                                                    listSubTitleTextStyle,
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 4.0),
                                                            InkWell(
                                                              child:
                                                                  const Icon(
                                                                Icons
                                                                    .cancel,
                                                                size: 14.0,
                                                                color:
                                                                    greyColor,
                                                              ),
                                                              onTap: () {
                                                                controller
                                                                    .deleteFacility(
                                                                        index);
                                                                controller
                                                                    .updateButton();
                                                              },
                                                            )
                                                          ],
                                                        ),
                                                      ))
                                                  .toList(),
                                              SizedBox(
                                                width: double.infinity,
                                                child: TypeAheadFormField<
                                                    String>(
                                                  textFieldConfiguration:
                                                      TextFieldConfiguration(
                                                    controller: controller
                                                        .facilityAutocompleteController,
                                                    autofocus: false,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium,
                                                    decoration:
                                                        InputDecoration(
                                                            isDense: true,
                                                            hintText:
                                                                "Facility"
                                                                    .tr,
                                                            border:
                                                                InputBorder
                                                                    .none,
                                                            contentPadding: const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    4.0,
                                                                vertical:
                                                                    4.0),
                                                            errorText: null,
                                                            errorBorder:
                                                                const OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none,
                                                              gapPadding: 0,
                                                            ),
                                                            errorStyle:
                                                                const TextStyle(
                                                                    height:
                                                                        0)),
                                                  ),
                                                  suggestionsCallback:
                                                      (pattern) async {
                                                    final list =
                                                        await controller
                                                            .getFacilityByKeyword(
                                                                pattern);
                                                    return list;
                                                  },
                                                  itemBuilder: (context,
                                                      suggestion) {
                                                    return ListTile(
                                                      title:
                                                          Text(suggestion),
                                                    );
                                                  },
                                                  onSuggestionSelected:
                                                      (suggestion) {
                                                    controller.addFacility(
                                                        suggestion);
                                                    controller
                                                        .facilityAutocompleteController
                                                        .text = "";
                                                  },
                                                  debounceDuration:
                                                      const Duration(
                                                          milliseconds:
                                                              1500),
                                                  hideOnLoading: false,
                                                  hideSuggestionsOnKeyboardHide:
                                                      true,
                                                  keepSuggestionsOnLoading:
                                                      false,
                                                  minCharsForSuggestions: 0,
                                                ),
                                              )
                                            ],
                                          );
                                        }
                                        return Wrap(
                                            runSpacing: 8,
                                            runAlignment:
                                                WrapAlignment.center,
                                            children: controller
                                                .listSelectedFacility
                                                .map((String item) {
                                              return Container(
                                                decoration:
                                                    const BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                    Radius.circular(4.0),
                                                  ),
                                                  color: Colors.white,
                                                ),
                                                margin:
                                                    const EdgeInsets.only(
                                                        right: 5.0,
                                                        left: 5),
                                                padding: const EdgeInsets
                                                        .symmetric(
                                                    horizontal: 10.0,
                                                    vertical: 4.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    InkWell(
                                                      child: Text(
                                                        item ?? "",
                                                        style:
                                                            listSubTitleTextStyle,
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
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Obx(() {
                                    if (controller.onEdit.value) {
                                      return CustomFormFilePicker(
                                        label: "Attachment".tr,
                                        onFileSelected: (File value) {
                                          controller.selectedFile = value;
                                        },
                                      );
                                    }
                                    return CustomTextFormField(
                                      readOnly: true,
                                      backgroundColor: neutralColor,
                                      controller:
                                          controller.attachmentController,
                                      label: "Attachment".tr,
                                      onTap: () async {
                                        if (controller.selectedItem.value
                                            .attachmentPath
                                            .toString()
                                            .isImageFileName) {
                                          Get.dialog(Dialog(
                                            child: Padding(
                                              padding: const EdgeInsets
                                                      .symmetric(
                                                  horizontal: 16,
                                                  vertical: 16),
                                              child: Image.network(
                                                  controller.selectedItem
                                                      .value.attachmentPath
                                                      .toString()),
                                            ),
                                          ));
                                        } else {
                                          if (!await launchUrl(Uri.parse(
                                              controller.selectedItem.value
                                                  .attachmentPath
                                                  .toString()))) {
                                            throw Exception(
                                                'Could not launch ${controller.selectedItem.value.attachmentPath.toString()}');
                                          }
                                        }
                                      },
                                    );
                                  }),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Obx(() {
                                    return CustomTextFormField(
                                        readOnly: !controller.onEdit.value,
                                        multiLine: true,
                                        controller:
                                            controller.remarksController,
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
                          ),
                        );
                      } else if (controller.selectedTab.value ==
                          TabEnum.recurrence) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: Card(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: const Color(0xffEFF4FF)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 20),
                              child: Row(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Start Date",
                                        style: listSubTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "Recurrence",
                                        style: listSubTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        "End Date",
                                        style: listSubTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        ":",
                                        style: listSubTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        ":",
                                        style: listSubTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(
                                        ":",
                                        style: listSubTitleTextStyle.copyWith(
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${controller.selectedItem.value.recurrenceStart?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy")}",
                                          style: listSubTitleTextStyle.copyWith(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "${controller.selectedItem.value.recurrence?.capitalizeFirst}",
                                          style: listSubTitleTextStyle.copyWith(
                                              fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(
                                          width: 4,
                                        ),
                                        Text(
                                          "${controller.selectedItem.value.recurrenceEnd?.toDateFormat(originFormat: "yyyy-MM-dd", targetFormat: "dd/MM/yyyy")}",
                                          style: listSubTitleTextStyle.copyWith(
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      } else if (controller.selectedTab.value ==
                          TabEnum.approval) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: controller.listLogApproval.isEmpty
                            ? const SizedBox()
                          : Card(
                            child: ApprovalLogList(
                              list: controller.listLogApproval,
                              waitingApprovalValue: 0),
                          ),
                        );
                      }else if (controller.selectedTab.value ==
                          TabEnum.duration) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16, horizontal: 8),
                          child: Card(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 16,
                                ),
                                TimeLineItemWidget(
                                  contentWidget: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.selectedItem.value.nameStarted != null ? "${controller.selectedItem.value.nameStarted} start meeting" : "-",
                                        style: titleTextStyle.copyWith(
                                            fontSize: 14, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          controller.selectedItem.value.durationStart?.toDateFormat(
                                              targetFormat: "EEEE, dd MMMM yyyy",
                                              originFormat: "yyyy-MM-dd HH:mm:ss") ??
                                              "-",
                                        style: hintTextStyle.copyWith(
                                            color: const Color(0xFF8C8C8C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        controller.selectedItem.value.durationStart?.toDateFormat(
                                            targetFormat: "EEEE, dd MMMM yyyy",
                                            originFormat: "yyyy-MM-dd HH:mm:ss") ??
                                            "-",
                                        style: hintTextStyle.copyWith(
                                            color: const Color(0xFF8C8C8C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                                TimeLineItemWidget(
                                  contentWidget: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.selectedItem.value.nameEnded != null ? "${controller.selectedItem.value.nameEnded} end meeting" : "-",
                                        style: titleTextStyle.copyWith(
                                            fontSize: 14, fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                          controller.selectedItem.value.durationEnd?.toDateFormat(
                                              targetFormat: "EEEE, dd MMMM yyyy",
                                              originFormat: "yyyy-MM-dd HH:mm:ss") ??
                                              "-",
                                        style: hintTextStyle.copyWith(
                                            color: const Color(0xFF8C8C8C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      Text(
                                        controller.selectedItem.value.durationEnd?.toDateFormat(
                                            targetFormat: "EEEE, dd MMMM yyyy",
                                            originFormat: "yyyy-MM-dd HH:mm:ss") ??
                                            "-",
                                        style: hintTextStyle.copyWith(
                                            color: const Color(0xFF8C8C8C),
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                    ],
                                  ),
                                ),
                                TimeLineItemWidget(
                                  contentWidget: Text(
                                    "Total Duration : ${controller.getDuration()}",
                                    style: listTitleTextStyle,
                                  ),
                                  showContentIcon: false,
                                ),
                                const SizedBox(
                                  height: 32,
                                ),
                              ],
                            ),
                          ),
                        );
                      }else {
                        return const SizedBox();
                      }
                    }),
                    const SizedBox(
                      height: 32,
                    )
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}


class TimeLineItemWidget extends StatelessWidget{
  const TimeLineItemWidget({super.key, required this.contentWidget, this.showContentIcon = true});
  final Widget contentWidget;
  final bool showContentIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 8),
      child: Row(
        children: [
          Container(
            decoration:
            const BoxDecoration(shape: BoxShape.circle, color: infoColor),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              IconlyBold.time_circle,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffEFF4FF)),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showContentIcon ? Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFC3C3C3)),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        IconlyBold.profile,
                        color: greyColor,
                      ),
                    ): const SizedBox(),
                    SizedBox(
                      width: showContentIcon ? 16 : 0,
                    ),
                    Expanded(
                      child: contentWidget,
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

}