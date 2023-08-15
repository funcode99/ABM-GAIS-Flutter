import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:intl/intl.dart';

class ActActivitiesDetailController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final activityDate = TextEditingController();
  final activityDetail = TextEditingController();

  DateFormat dateFormat = DateFormat("MM/dd/yyyy");
  DateFormat saveDateFormat = DateFormat("yyyy/MM/dd");

  @override
  void onInit() {
    super.onInit();
  }
}
