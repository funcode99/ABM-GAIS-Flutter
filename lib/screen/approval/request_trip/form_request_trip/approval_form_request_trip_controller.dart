import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class ApprovalFormRequestTripController extends BaseController {
  final formKey = GlobalKey<FormState>();
  final createdDate = TextEditingController();
  final requestor = TextEditingController();
  final purpose = TextEditingController();

  String? tabName;
  bool? isDetail = true;
  bool? isTLK = false;

  List<String> approve = ["Behalf of", "Fully Approve"];
  late String approval = approve[0];

  List<String> reject = ["With Notes", "Fully Rejected"];
  late String rejection = reject[0];

  List requestTrip = [
    "Traveller",
    "Airliness",
    "Taxi Voucher",
    "Other Transportation",
    "Accommodation",
    "Cash Advance"
  ];

  @override
  void onInit() {
    super.onInit();
    createdDate.text = "23/02/23";
    requestor.text = "Jack H";
    purpose.text = "Company Business";
  }

  @override
  void dispose() {
    super.dispose();
    createdDate.dispose();
    requestor.dispose();
    purpose.dispose();
  }

}

