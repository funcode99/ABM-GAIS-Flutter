import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class ManagementMeetingRoomController extends BaseController{
  final formKey = GlobalKey<FormState>();

  String filterCapacity = "-1";
  String filterStatus = "-1";
  String? searchValue;
  int currentPage = 1;
  int perPage = 10;

  bool isLoading = false;
  bool dataisnull = false;

  List capacityList = [];
  List statusList = [];

}