import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/reusable/divider/dashed_vertical_line.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:url_launcher/url_launcher.dart';

class ApprovalLogList extends StatelessWidget {
  const ApprovalLogList(
      {super.key, required this.list, required this.waitingApprovalValue});

  final List<ApprovalLogModel> list;
  final int waitingApprovalValue;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 220, minHeight: 160),
          child: SizedBox(
            height: double.infinity,
            child: ApprovalLogItem(
              item: list[index],
              showBottomLine: list.length <= 1 || index == list.length - 1,
              showTopLine: index == 0,
              iconColor: list[index].codeStatus == waitingApprovalValue
                  ? const Color(0xFF8fb0c7)
                  : infoColor,
            ),
          ),
        );
      },
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
    );
  }
}

class ApprovalLogItem extends StatelessWidget {
  final ApprovalLogModel item;
  final bool showTopLine;
  final bool showBottomLine;
  final Color iconColor;

  const ApprovalLogItem(
      {super.key,
      required this.item,
      this.showTopLine = false,
      this.showBottomLine = false,
      this.iconColor = const Color(0xFF8fb0c7)});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: item.notes != null
          ? item.notes!.isNotEmpty
              ? () {
                  Get.dialog(Dialog(
                    child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 21),
                        child: Text(item.notes ?? "")),
                  ));
                }
              : null
          : null,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Expanded(
                child: showTopLine
                    ? const SizedBox()
                    : SizedBox(
                        height: double.infinity,
                        child: CustomPaint(
                            size: const Size(1.5, double.infinity),
                            painter: DashedVerticalLine()),
                      ),
              ),
              Container(
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: iconColor),
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  IconlyBold.user_3,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Expanded(
                child: showBottomLine
                    ? const SizedBox()
                    : SizedBox(
                        height: double.infinity,
                        child: CustomPaint(
                            size: const Size(1.5, double.infinity),
                            painter: DashedVerticalLine()),
                      ),
              ),
            ],
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color(0xffEFF4FF)),
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xFFC3C3C3)),
                    padding: const EdgeInsets.all(8),
                    child: const Icon(
                      IconlyBold.profile,
                      color: greyColor,
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${item.text}",
                          style: titleTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          item.date?.toDateFormat(
                                  targetFormat: "EEEE, dd MMMM yyyy",
                                  originFormat: "yyyy-MM-dd HH:mm:ss") ??
                              "-",
                          style: hintTextStyle.copyWith(
                              color: const Color(0xFF8C8C8C),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          item.date?.toDateFormat(
                                  targetFormat: "HH:mm:ss a",
                                  originFormat: "yyyy-MM-dd HH:mm:ss") ??
                              "-",
                          style: hintTextStyle.copyWith(
                              color: const Color(0xFF8C8C8C),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        item.notes == null
                            ? const SizedBox()
                            : Text(
                                "Notes : ${item.notes ?? ""}",
                                style: const TextStyle(
                                    overflow: TextOverflow.ellipsis),
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                        item.path == null
                            ? const SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Attachment : "),
                                  GestureDetector(
                                    onTap: () async{
                                      if (item.path
                                          .toString()
                                          .isImageFileName) {
                                        Get.dialog(Dialog(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 16),
                                            child: Image.network(item.path!),
                                          ),
                                        ));
                                      } else {
                                        if (!await launchUrl(Uri.parse(item.path.toString()))) {
                                          throw Exception('Could not launch ${item.path.toString}');
                                        }
                                      }
                                    },
                                    child: Text(
                                      "${item.file ?? ""}",
                                      style: const TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          color: infoColor),
                                    ),
                                  )
                                ],
                              )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
