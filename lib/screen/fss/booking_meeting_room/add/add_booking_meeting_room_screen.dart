import 'package:custom_date_range_picker/custom_date_range_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/booking_meeting_room/add/add_booking_meeting_room_controller.dart';
import 'package:gais/screen/fss/booking_meeting_room/widget/meeting_room_time_picker_dialog.dart';
import 'package:gais/util/ext/date_ext.dart';
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
                      suffixIcon: const Icon(Icons.calendar_month),
                      onTap: (){
                        showCustomDateRangePicker(
                          context,
                          dismissible: true,
                          minimumDate: DateTime.now()
                              .subtract(const Duration(days: 365)),
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
                            "${controller.dateFormat.format(start)} - ${controller.dateFormat.format(end)}";
                            controller.update();
                          },
                          onCancelClick: () {
                          },
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
                      suffixIcon: const Icon(Icons.access_time),
                      onTap: (){
                        Get.dialog(MeetingRoomTimePickerDialog(
                          startDate: controller.startDate.value,
                          endDate: controller.endDate.value,
                          startTime: controller.startTime.value,
                          endTime: controller.endTime.value,
                          onConfirmClick: (startTime, endTime){
                            controller.startTime.value = startTime;
                            controller.endTime.value = endTime;
                            controller.timeController.text = "${startTime?.toStringWithFormat()} ${endTime!=null ? "-" : ""} ${endTime?.toStringWithFormat() ?? ""}";
                          },
                        ));
                      },
                      controller: controller.timeController,
                      label: "Time Detail".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      suffixIcon: const Icon(Icons.key),
                      controller: controller.meetingRoomController,
                      label: "Meeting Room".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
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
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      inputType: TextInputType.number,
                      controller: controller.capacityController,
                      label: "Capacity".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      controller: controller.participantController,
                      label: "Participant".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
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
                            onPressed:
                                controller.enableButton.value ? () {} : null,
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
