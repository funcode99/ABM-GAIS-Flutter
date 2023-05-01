import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/customalertcontainer.dart';
import 'package:gais/reusable/customstatuscontainer.dart';

class CashAdvanceListItem extends StatelessWidget {
  const CashAdvanceListItem(
      {super.key,
        required this.number,
        required this.title,
        required this.subtitle,
        required this.status,
        required this.content,
        required this.action,
        this.onTap
      });

  final String number;
  final String title;
  final String subtitle;
  final String status;
  final Widget content;
  final List<Widget> action;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minHeight: 50,
                      minWidth: 50,
                    ),
                    child: CustomAlertContainer(
                      backgroundColor: infoColor,
                      content: Text("No\n$number",
                          style: listTitleTextStyle.copyWith(color: whiteColor),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: listTitleTextStyle),
                        Text(
                          subtitle,
                          style: listSubTitleTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  CustomStatusContainer(
                    backgroundColor: greenColor,
                    status: status,
                  )
                ],
              ),
              const Divider(
                height: 20,
                color: greyColor,
              ),
              content,
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomAlertContainer(
                    backgroundColor: infoColor,
                    content: Text("120.000",
                        style: listSubTitleTextStyle.copyWith(
                            color: whiteColor, fontSize: 14),
                        textAlign: TextAlign.center),
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                  ),
                  Row(
                    children: action,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}