import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/approval_log_model.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/divider/dashed_vertical_line.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:measured_size/measured_size.dart';
import 'package:url_launcher/url_launcher.dart';

class ApprovalLogList extends StatelessWidget {
  const ApprovalLogList(
      {super.key, required this.list, required this.waitingApprovalValue});

  final List<ApprovalLogModel> list;
  final int waitingApprovalValue;

  @override
  Widget build(BuildContext context) {
    if(list.isEmpty){
      return const DataEmpty();
    }
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        return ApprovalLogItem(
          item: list[index],
          showBottomLine: list.length <= 1 || index == list.length - 1,
          showTopLine: index == 0,
          iconColor: list[index].codeStatus == waitingApprovalValue
              ? const Color(0xFF8fb0c7)
              : infoColor,
        );
      },
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 8),
      shrinkWrap: true,
      physics: const ScrollPhysics(),
    );
  }
}

class ApprovalLogItem extends StatefulWidget {
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
  State<ApprovalLogItem> createState() => _ApprovalLogItemState();
}

class _ApprovalLogItemState extends State<ApprovalLogItem> {

  Size _size = const Size(0, 0);
  @override
  Widget build(BuildContext context) {
    return MeasuredSize(
      onChange: (Size size) {
        setState(() {
          _size = size;
        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: _size.height
            ),
            child: Column(
              children: [
                Expanded(
                  child: widget.showTopLine
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
                  BoxDecoration(shape: BoxShape.circle, color: widget.iconColor),
                  padding: const EdgeInsets.all(10),
                  child: const Icon(
                    IconlyBold.user_3,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                Expanded(
                  child: widget.showBottomLine
                      ? const SizedBox()
                      : SizedBox(
                    height: double.infinity,
                    child: CustomPaint(
                        size: const Size(1.5, double.infinity),
                        painter: DashedVerticalLine()),
                  ),
                ),
              ],
            )
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
                          "${widget.item.text ?? ""}",
                          style: titleTextStyle.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.item.date?.toDateFormat(
                              targetFormat: "EEEE, dd MMMM yyyy",
                              originFormat: "yyyy-MM-dd HH:mm:ss") ?? "",
                          style: hintTextStyle.copyWith(
                              color: const Color(0xFF8C8C8C),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.item.date?.toDateFormat(
                                  targetFormat: "HH:mm:ss a",
                                  originFormat: "yyyy-MM-dd HH:mm:ss") ??
                              "",
                          style: hintTextStyle.copyWith(
                              color: const Color(0xFF8C8C8C),
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        widget.item.notes == null
                            ? const SizedBox()
                            : GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: widget.item.notes != null
                                    ? widget.item.notes!.isNotEmpty
                                        ? () {
                                            Get.dialog(Dialog(
                                              child: Container(
                                                  padding:
                                                      const EdgeInsets.symmetric(
                                                          horizontal: 16,
                                                          vertical: 21),
                                                  child: Text(widget.item.notes ?? "")),
                                            ));
                                          }
                                        : null
                                    : null,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4),
                                  child: Text(
                                    "Notes : ${widget.item.notes ?? ""}",
                                    style: const TextStyle(
                                        overflow: TextOverflow.ellipsis),
                                  ),
                                ),
                              ),
                        const SizedBox(
                          height: 8,
                        ),
                        widget.item.path == null
                            ? const SizedBox()
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Attachment : "),
                                  GestureDetector(
                                    behavior: HitTestBehavior.translucent,
                                    onTap: () async {
                                      if (widget.item.path.toString().isImageFileName) {
                                        Get.dialog(Dialog(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 16),
                                            child: Image.network(widget.item.path!),
                                          ),
                                        ));
                                      } else {
                                        if (!await launchUrl(
                                            Uri.parse(widget.item.path.toString()))) {
                                          throw Exception(
                                              'Could not launch ${widget.item.path.toString()}');
                                        }
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4),
                                      child: Text(
                                        "${widget.item.file ?? ""}",
                                        style: const TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            color: infoColor),
                                      ),
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
