import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/customalertcontainer.dart';

class ActualizationTripItem extends StatelessWidget {
  final String? number;
  final String? title;
  final Widget? content;
  final List<Widget> action;

  const ActualizationTripItem(
      {super.key, this.title, this.content, required this.action, this.number});


  @override
  Widget build(BuildContext context) {
    return Row(
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
            content: Text("No\n${number}",
                style: listTitleTextStyle.copyWith(color: whiteColor),
                textAlign: TextAlign.center),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              title != null
                  ? Text(
                  title ?? "", style: listTitleTextStyle.copyWith(fontSize: 12))
                  :
              const SizedBox(height: 6,),
              content ?? const SizedBox(),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: action,
              )
            ],
          ),
        ),
      ],
    );
  }

}
