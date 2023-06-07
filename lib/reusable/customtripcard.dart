import 'package:flutter/material.dart';
import 'package:gais/util/responsive/text_scale_factor.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/customfilledbutton.dart';

class CustomTripCard extends StatelessWidget {
  final int listNumber;
  final String title;
  final String? subtitle;
  final String? status;
  final String? info;
  final Widget content;
  final bool? isEdit;
  final bool? isDelete;
  final VoidCallback? editAction;
  final VoidCallback? deleteAction;
  final Widget? editButton;
  final Widget? deleteButton;
  final VoidCallback? onTap;
  final bool? approval;
  final bool? iconOnly;
  final VoidCallback? approveAction;
  final VoidCallback? rejectAction;

  const CustomTripCard({
    Key? key,
    required this.listNumber,
    required this.title,
    this.subtitle,
    this.status,
    required this.content,
    this.info,
    this.isEdit = false,
    this.isDelete = false,
    this.editAction,
    this.deleteAction,
    this.onTap,
    this.approval = false,
    this.approveAction,
    this.rejectAction,
    this.editButton,
    this.deleteButton,
    this.iconOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
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
                mainAxisAlignment: status != null ? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        margin: EdgeInsets.only(right: status != null ? 0 : 10),
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(4)),
                        child: Text("No\n$listNumber", style: listTitleTextStyle.copyWith(color: whiteColor), textAlign: TextAlign.center),
                      ),
                      const SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: Get.width /2.2,
                            child: Text(
                              title,
                              style: listTitleTextStyle.copyWith(),
                              textAlign: TextAlign.start,

                            ),
                          ),
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
                      ? Container(
                          alignment: Alignment.center,
                          width: Get.width/5,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(color: greenColor, borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            status ?? "",
                            style: TextStyle(fontSize: 12, color: whiteColor, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
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
                  info != null
                      ? Container(
                          width: Get.width/4,
                          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                          decoration: BoxDecoration(color: infoColor, borderRadius: BorderRadius.circular(4)),
                          child:
                              Text(info ?? "", style: listSubTitleTextStyle.copyWith(color: whiteColor, fontSize: 14), textAlign: TextAlign.center),
                        )
                      : Container(),
                  Row(
                    children: [
                      isDelete! && isEdit!
                          ? editButton ??
                              CustomFilledButton(
                                width: 80,
                                height: 40,
                                color: successColor,
                                title: approval! ? "approve" : "Edit",
                                fontSize: 14,
                                icon: approval! ? Icons.check : IconlyBold.edit,
                                onPressed: approval! ? approveAction : editAction,
                              )
                          : const SizedBox(),
                      const SizedBox(width: 5),
                      isEdit!
                          ? deleteButton ??
                              CustomFilledButton(
                                width: 80,
                                height: 40,
                                fontSize: 14,
                                color: isDelete! ? redColor : successColor,
                                title: approval!
                                    ? "reject"
                                    : isDelete!
                                        ? "Delete"
                                        : approval!
                                            ? "approve"
                                            : "Edit",
                                icon: approval!
                                    ? Icons.close
                                    : isDelete!
                                        ? IconlyBold.delete
                                        : approval!
                                            ? Icons.check
                                            : IconlyBold.edit,
                                onPressed: approval!
                                    ? rejectAction
                                    : isDelete!
                                        ? deleteAction
                                        : approval!
                                            ? approveAction
                                            : editAction,
                              )
                          : const SizedBox()
                    ],
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
