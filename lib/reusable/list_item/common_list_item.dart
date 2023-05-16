import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/customalertcontainer.dart';
import 'package:gais/reusable/customstatuscontainer.dart';

class CommonListItem extends StatelessWidget {
  const CommonListItem(
      {super.key,
        required this.number,
        this.title,
        required this.subtitle,
        this.status,
        required this.content,
        required this.action,
        this.total,
        this.onTap
      });

  final String number;
  final String? title;
  final String subtitle;
  final String? status;
  final Widget content;
  final List<Widget> action;
  final VoidCallback? onTap;
  final String? total;

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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        title != null ? Text(title ?? "", style: listTitleTextStyle) :
                        const SizedBox(height: 6,),
                        Text(
                          subtitle,
                          style: listSubTitleTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  status != null ? CustomStatusContainer(
                    backgroundColor: greenColor,
                    status: status ?? "",
                  ) : const SizedBox()
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
                  total != null ? CustomAlertContainer(
                    backgroundColor: infoColor,
                    content: Expanded(
                      child: Text(total!,
                          style: listSubTitleTextStyle.copyWith(
                              color: whiteColor, fontSize: 14),
                          textAlign: TextAlign.center),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
                  ) : const SizedBox(),
                  const SizedBox(
                    width: 8,
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