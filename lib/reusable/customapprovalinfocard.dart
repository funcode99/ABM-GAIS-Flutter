import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomApprovalInfoCard extends StatelessWidget {
  final String? status;
  final String? name;
  final String? position;
  final String? message;
  final String? notes;
  final DateTime? approvalDate;
  final DateTime? approvalTime;

  const CustomApprovalInfoCard({
    Key? key,
    this.status,
    this.name,
    this.position,
    this.message,
    this.approvalDate,
    this.approvalTime,
    this.notes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("EEEE, dd MMMM yyyy");
    DateFormat timeFormat = DateFormat("hh:mm a");

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      width: Get.width / 1.5,
      decoration: BoxDecoration(color: lightBlueColor, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 30,
            decoration: BoxDecoration(color: greyColor, borderRadius: BorderRadius.circular(50)),
            child: const Icon(Icons.person, color: whiteColor),
          ),
          Column(
            children: [
              Container(
                width: Get.width / 2,
                child: RichText(
                  text: TextSpan(
                    text: status ?? "",
                    style: listTitleTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: name,
                        style: listTitleTextStyle,
                      ),
                      TextSpan(
                        text: position,
                        style: listTitleTextStyle.copyWith(color: Colors.blue),
                      ),
                      TextSpan(text: message, style: listTitleTextStyle),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width / 2,
                child: Text(approvalDate == null ? "-" : dateFormat.format(approvalDate!)),
              ),
              SizedBox(height: 10),
              Container(
                width: Get.width / 2,
                child: Text(approvalDate == null ? "-" : timeFormat.format(approvalDate!)),
              ),
              notes != null
                  ? Container(
                      margin: EdgeInsets.only(top: 10),
                      width: Get.width / 2,
                      child: RichText(
                        text: TextSpan(
                          text: "Notes: ",
                          style: listTitleTextStyle,
                          children: <TextSpan>[
                            TextSpan(
                              text: notes,
                              style: listSubTitleTextStyle,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
