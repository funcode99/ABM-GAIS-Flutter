import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:iconly/iconly.dart';

class TimeLineItemWidget extends StatelessWidget{
  const TimeLineItemWidget({super.key, required this.contentWidget, this.showContentIcon = true});
  final Widget contentWidget;
  final bool showContentIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 0, top: 8),
      child: Row(
        children: [
          Container(
            decoration:
            const BoxDecoration(shape: BoxShape.circle, color: infoColor),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              IconlyBold.time_circle,
              color: Colors.white,
              size: 24,
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: const Color(0xffEFF4FF)),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    showContentIcon ? Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFC3C3C3)),
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        IconlyBold.profile,
                        color: greyColor,
                      ),
                    ): const SizedBox(),
                    SizedBox(
                      width: showContentIcon ? 16 : 0,
                    ),
                    Expanded(
                      child: contentWidget,
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

}