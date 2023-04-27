import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/customfilledbutton.dart';

class CustomTripCard extends StatelessWidget {
  final int listNumber;
  final String title;
  final String? subtitle;
  final String? status;
  final String info;
  final Widget content;
  final bool? isEdit;
  final bool? isDelete;
  final VoidCallback? editAction;
  final VoidCallback? deleteAction;

  const CustomTripCard({
    Key? key,
    required this.listNumber,
    required this.title,
    this.subtitle,
    this.status,
    required this.content,
    required this.info,
    this.isEdit = false,
    this.isDelete = false,
    this.editAction,
    this.deleteAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: status != null
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(right: status != null ? 0 : 10),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: infoColor,
                          borderRadius: BorderRadius.circular(4)),
                      child: Text("No\n$listNumber",
                          style: listTitleTextStyle.copyWith(color: whiteColor),
                          textAlign: TextAlign.center),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title, style: listTitleTextStyle),
                        Text(
                          subtitle ?? "",
                          style: listSubTitleTextStyle,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ],
                ),
                status != null
                    ? CustomFilledButton(
                        color: greenColor,
                        width: 100,
                        height: 30,
                        fontSize: 14,
                        title: status ?? "",
                      )
                    : Container()
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
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: infoColor, borderRadius: BorderRadius.circular(4)),
                  child: Text(info,
                      style: listSubTitleTextStyle.copyWith(
                          color: whiteColor, fontSize: 14),
                      textAlign: TextAlign.center),
                ),
                Row(
                  children: [
                    isDelete! && isEdit!
                        ? CustomFilledButton(
                            width: 80,
                            height: 40,
                            color: successColor,
                            title: "Edit",
                            fontSize: 14,
                            icon: IconlyBold.edit,
                            onPressed: editAction,
                          )
                        : const SizedBox(),
                    const SizedBox(width: 5),
                    isEdit!
                        ? CustomFilledButton(
                            width: 80,
                            height: 40,
                            fontSize: 14,
                            color: isDelete! ? redColor : successColor,
                            title: isDelete! ? "Delete" : "Edit",
                            icon:
                                isDelete! ? IconlyBold.delete : IconlyBold.edit,
                            onPressed: isDelete! ? deleteAction : editAction,
                          )
                        : const SizedBox()
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
