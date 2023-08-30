import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/booking_meeting_room/recurrence_day.dart';
import 'package:gais/data/model/booking_meeting_room/recurrence_model.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:gais/util/mixin/master_data_mixin.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecurrenceDialogController extends BaseController with MasterDataMixin{
  final TextEditingController dateController = TextEditingController();

  DateFormat dateFormat = DateFormat("dd/MM/yyyy");
  final formKey = GlobalKey<FormState>();

  File? selectedFile;
  final enableButton = false.obs;
  final showAttachment = false.obs;

  final listRecurrence = <RecurrenceModel>[].obs;
  final selectedRecurrence = Rxn<RecurrenceModel>();
  final occursUntilDate = Rxn<DateTime>();

  final recurrenceDays = <RecurrenceDay>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    listRecurrence.add(RecurrenceModel(value: "daily", text: "Daily"));
    listRecurrence.add(RecurrenceModel(value: "weekly", text: "Weekly"));
    listRecurrence.add(RecurrenceModel(value: "monthly", text: "Monthly"));
    listRecurrence.add(RecurrenceModel(value: "yearly", text: "Yearly"));

    //init recurrence days
    recurrenceDays.add(RecurrenceDay(value: "1", dayCode: "M", dayName: "Monday"));
    recurrenceDays.add(RecurrenceDay(value: "2", dayCode: "T", dayName: "Tuesday"));
    recurrenceDays.add(RecurrenceDay(value: "3", dayCode: "W", dayName: "Wednesday"));
    recurrenceDays.add(RecurrenceDay(value: "4", dayCode: "T", dayName: "Thursday"));
    recurrenceDays.add(RecurrenceDay(value: "5", dayCode: "F", dayName: "Friday"));
    recurrenceDays.add(RecurrenceDay(value: "6", dayCode: "S", dayName: "Saturday"));
    recurrenceDays.add(RecurrenceDay(value: "7", dayCode: "S", dayName: "Sunday"));

    // final statuses = await getListStatusDoc();
    // listStatus.addAll(statuses);
    if(selectedRecurrence.value!=null){
      if(selectedRecurrence.value?.date!=null){
        occursUntilDate.value = selectedRecurrence.value?.date?.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        dateController.text = dateFormat.format(occursUntilDate.value!);
      }

      if(selectedRecurrence.value?.recurrenceDays != null){
        recurrenceDays.clear();
        recurrenceDays.value = selectedRecurrence.value!.recurrenceDays!;
      }
    }

    onChangeSelectedRecurrence(selectedRecurrence.value?.value ?? "daily");


    //listen onchange recurrence
    selectedRecurrence.listen((value) {
      if(value?.value == "daily"){
        List<RecurrenceDay> update = [];
        recurrenceDays.forEach((element){
          update.add(
            RecurrenceDay(
              dayName: element.dayName,
              dayCode: element.dayCode,
              value: element.value,
              isSelected: true
            )
          );
        });
        recurrenceDays.value = update;
        recurrenceDays.refresh();
      }
    });

    recurrenceDays.listen((element) {
      List<RecurrenceDay> selected = recurrenceDays.where((element) => element.isSelected).toList();
      if(selected.length == 7){
        onChangeSelectedRecurrence("daily");
      }else{
        onChangeSelectedRecurrence("weekly");
      }
    });

  }

  RecurrenceModel select(){
    RecurrenceModel recurrenceModel = RecurrenceModel(
      date: occursUntilDate.value.toString(),
      text: selectedRecurrence.value?.text,
      value: selectedRecurrence.value?.value,
      recurrenceDays: recurrenceDays
    );

    return recurrenceModel;
  }

  void updateButton(){
    if(occursUntilDate.value == null){
      enableButton.value = false;
    }else{
      enableButton.value = true;
    }


  }

  void onChangeSelectedRecurrence(String value) {
    final selected = listRecurrence.firstWhere((item) => item.value.toString() == value.toString());
    selectedRecurrence(selected);
  }

  String getConclusionText() {
    if (occursUntilDate.value == null) {
      return "";
    }

    String result = "";

    if (selectedRecurrence.value?.value == "daily") {
      result += "Occurs everyday ";
    } else if (selectedRecurrence.value?.value == "weekly") {
      result += "Occurs every ${recurrenceDays.where((element) => element.isSelected).map((e) => e.dayName)} ";
    }else if (selectedRecurrence.value?.value == "monthly") {
      result += "Occurs monthly ";
    }else if (selectedRecurrence.value?.value == "yearly") {
      result += "Occurs yearly ";
    }

    result += "until ${dateController.text}";

    return result.replaceAll(RegExp("[()]"), "");
  }
}
