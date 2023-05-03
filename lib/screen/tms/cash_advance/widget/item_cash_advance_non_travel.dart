import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/customalertcontainer.dart';
import 'package:gais/reusable/customstatuscontainer.dart';

class ItemCashAdvanceNonTravel extends StatelessWidget {
  const ItemCashAdvanceNonTravel(
      {super.key,
        required this.number,
        required this.title,
        required this.subtitle,
        required this.nominal,
        required this.action,
        this.onTap
      });

  final String number;
  final String title;
  final String subtitle;
  final String nominal;
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
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        Text(title, style: listSubTitleTextStyle),
                        Text(
                          subtitle,
                          style: listSubTitleTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Text(
                    nominal
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: action,
              )
            ],
          ),
        ),
      ),
    );
  }
}