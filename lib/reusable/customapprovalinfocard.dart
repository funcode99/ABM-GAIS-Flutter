import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:intl/intl.dart';

class CustomApprovalInfoCard extends StatelessWidget {
  final String? status;
  final String? name;
  final String? position;
  final String? message;
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("EEEE, dd MMMM yyyy");
    DateFormat timeFormat = DateFormat("hh:mm a");

    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.all(10),
      width: 270,
      decoration: BoxDecoration(
          color: lightBlueColor, borderRadius: BorderRadius.circular(12)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 30,
            width: 30,
            // padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: greyColor, borderRadius: BorderRadius.circular(50)),
            child: const Icon(Icons.person, color: whiteColor),
          ),
          Column(
            children: [
              Container(
                width: 200,
                child: RichText(
                  text: TextSpan(
                    text: status ?? "",
                    style: formlabelTextStyle,
                    children: <TextSpan>[
                      TextSpan(
                        text: name,
                        style: formlabelTextStyle,
                      ),
                      TextSpan(
                        text: "($position) ",
                        style: formlabelTextStyle.copyWith(color: Colors.blue),
                      ),
                      TextSpan(text: message, style: formlabelTextStyle),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: 200,
                child: Text(approvalDate== null ? "-": dateFormat.format(approvalDate!)),
              ),
              SizedBox(height: 10),
              Container(
                width: 200,
                child: Text(approvalDate == null ? "-" : timeFormat.format(approvalDate!) ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
