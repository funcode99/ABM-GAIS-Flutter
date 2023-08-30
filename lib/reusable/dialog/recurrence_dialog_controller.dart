import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
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
    // final statuses = await getListStatusDoc();
    // listStatus.addAll(statuses);
    if(selectedRecurrence.value!=null){
      if(selectedRecurrence.value?.date!=null){
        occursUntilDate.value = selectedRecurrence.value?.date?.toDate(originFormat: "yyyy-MM-dd HH:mm:ss");
        dateController.text = dateFormat.format(occursUntilDate.value!);
      }
    }

    onChangeSelectedRecurrence(selectedRecurrence.value?.value ?? "daily");

  }

  RecurrenceModel select(){
    RecurrenceModel recurrenceModel = RecurrenceModel(
      date: occursUntilDate.value.toString(),
      text: selectedRecurrence.value?.text,
      value: selectedRecurrence.value?.value,
    );

    return recurrenceModel;
  }

  void updateButton(){
    if(occursUntilDate.value == null){
      enableButton.value = false;
    }else{
      enableButton.value = true;
    }

    print("UPDATE BUTTON ${enableButton.value}");

  }

  void onChangeSelectedRecurrence(String value) {
    final selected = listRecurrence.firstWhere((item) => item.value.toString() == value.toString());
    print("SELECTED ${selected.text}");
    selectedRecurrence(selected);
  }
}
