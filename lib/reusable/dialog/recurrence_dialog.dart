import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/booking_meeting_room/recurrence_model.dart';
import 'package:gais/reusable/calendar/custom_calendar_picker.dart';
import 'package:gais/reusable/dialog/recurrence_dialog_controller.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class RecurrenceDialog extends StatelessWidget {
  const RecurrenceDialog(
      {super.key, required this.recurrenceModel});

  final RecurrenceModel? recurrenceModel;

  @override
  Widget build(BuildContext context) {
    final RecurrenceDialogController controller = Get.put(
        RecurrenceDialogController())
      ..selectedRecurrence(recurrenceModel);

    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 10),
        child: Form(
          key: controller.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: () {
            controller.updateButton();
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "Recurrence".tr,
                      style: Theme
                          .of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(IconlyBold.close_square),
                    color: Colors.red,
                  )
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Obx(() {
                return CustomDropDownFormField(
                  isRequired: true,
                  items: controller.listRecurrence
                      .map((e) =>
                      DropdownMenuItem(
                        value: e.value.toString(),
                        child: Text("${e.text}"),
                      ))
                      .toList(),
                  onChanged: (item) {
                    controller.onChangeSelectedRecurrence(item!);
                  },
                  label: "Recurrence".tr,
                  value: controller.selectedRecurrence.value?.value,
                );
              }),


              const SizedBox(
                height: 8,
              ),

              LayoutBuilder(
                  builder: (context, constraint) {
                    double width = (constraint.maxWidth - (2 * 7 * 2)) / 7;
                    return Obx(() {
                      if(controller.selectedRecurrence.value?.value == "daily" || controller.selectedRecurrence.value?.value == "weekly"){
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: controller.recurrenceDays.mapIndexed((index,
                              item) {
                            return GestureDetector(
                              onTap: () {
                                controller.recurrenceDays[index].isSelected =
                                !controller.recurrenceDays[index].isSelected;
                                controller.recurrenceDays.refresh();
                              },
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxWidth: width,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: item.isSelected
                                          ? infoColor
                                          : neutralColor),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 2),
                                  child: Center(
                                    child: Text(
                                      "${item.dayCode}",
                                      textAlign: TextAlign.center,
                                      style: listTitleTextStyle.copyWith(
                                          color: item.isSelected
                                              ? whiteColor
                                              : blackColor,
                                          fontSize: 12
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }

                      return const SizedBox();
                    });
                  }
              ),

              Obx(() => controller.isRecurrenceDayValid() ? const SizedBox() : const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  "Please select day(s)",
                  textAlign: TextAlign.start,
                  style:
                  TextStyle(color: Colors.redAccent, fontSize: 12),
                ),
              )),

              const SizedBox(
                height: 8,
              ),

              CustomTextFormField(
                  isRequired: true,
                  readOnly: true,
                  suffixIcon: const Icon(IconlyLight.calendar),
                  onTap: () async {
                    DateTime? dateTime = await showDatePicker(
                      context: context,
                      initialDate: controller.occursUntilDate.value ??
                          DateTime.now(),
                      firstDate: DateTime.now(),
                      lastDate: DateTime(DateTime
                          .now()
                          .year + 100),
                    );
                    controller.dateController.text =
                        controller.dateFormat.format(dateTime!);
                    controller.occursUntilDate.value = dateTime;
                    controller.updateButton();
                  },
                  controller: controller.dateController,
                  label: "Occurs Until".tr),

              const SizedBox(
                height: 8,
              ),
              Obx((){
                return RichText(
                    text: TextSpan(
                      text: controller.getConclusionText().isNotEmpty ? "*" : "",
                      children:[
                        TextSpan(
                            text: controller.getConclusionText(),
                            style: const TextStyle(color: blackColor, fontSize: 11)
                        )
                      ],
                      style: const TextStyle(color: Colors.red),
                    ),

                );
              }),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: OutlinedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text("Cancel".tr))),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Obx(() {
                      return ElevatedButton(
                        onPressed: controller.enableButton.value && controller.isRecurrenceDayValid() ? () {
                          Get.back(result: controller.select());
                        } : null,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: successColor),
                        child: Text("Confirm".tr),
                      );
                    }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}
