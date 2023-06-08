import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/util/ext/date_ext.dart';
import 'package:get/get.dart';


class MeetingRoomTimePickerDialog extends StatefulWidget {
  const MeetingRoomTimePickerDialog({super.key, this.startDate, this.endDate, this.startTime, this.endTime, required this.onConfirmClick});

  final DateTime? startDate;
  final DateTime? endDate;
  final DateTime? startTime;
  final DateTime? endTime;
  final Function(DateTime?, DateTime?) onConfirmClick;

  @override
  State<MeetingRoomTimePickerDialog> createState() =>
      _MeetingRoomTimePickerDialogState();
}

class _MeetingRoomTimePickerDialogState
    extends State<MeetingRoomTimePickerDialog> {
  List<DateTime> selected = [];
  DateTime? startTimeTemp;
  DateTime? endTimeTemp;


  List<DateTime> list = [
    DateTime.now().copyDateWith(hour: 7, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 8, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 8, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 9, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 9, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 10, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 10, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 11, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 11, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 12, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 12, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 13, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 13, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 14, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 14, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 15, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 15, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 16, minute: 00, second: 0),
    DateTime.now().copyDateWith(hour: 16, minute: 30, second: 0),
    DateTime.now().copyDateWith(hour: 17, minute: 00, second: 0),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      startTimeTemp = widget.startTime;
      endTimeTemp = widget.endTime;
    });
  }
  
  bool _isSelected(DateTime item){
    bool result = false;
    if(startTimeTemp!=null){
      if(endTimeTemp!=null){
        if(startTimeTemp!.isTimeBefore(item) &&  endTimeTemp!.isTimeAfter(item)){
          result = true;
        }
      }else{
         result = startTimeTemp!.isSameTime(item);
      }
    }
    
    return result;
  }

  bool _isThumb(DateTime item){
    if(startTimeTemp!=null){
      if(endTimeTemp!=null){
        return endTimeTemp!.isSameTime(item) || startTimeTemp!.isSameTime(item);
      }
      return startTimeTemp!.isSameTime(item);
    }

    return false;
  }

  void _setSelected(DateTime item){
    if(startTimeTemp!=null){
      if(endTimeTemp!=null){
        if(endTimeTemp!.isSameTime(item)){
          setState(() {
            endTimeTemp = null;
          });
        }else if(startTimeTemp!.isSameTime(item)){
          setState(() {
            startTimeTemp = endTimeTemp;
            endTimeTemp = null;
          });
        }else if(startTimeTemp!.isTimeAfter(item)){
          setState(() {
            startTimeTemp = item;
          });
        }else if(item.isTimeAfter(endTimeTemp!)){
          setState(() {
            endTimeTemp = item;
          });
        }
      }else{
        if(startTimeTemp!.isSameTime(item)){
          setState(() {
            startTimeTemp = null;
          });
        }else if(startTimeTemp!.isTimeBefore(item) && !startTimeTemp!.isSameTime(item)){
          setState(() {
            endTimeTemp = item;
          });
        }else if(startTimeTemp!.isTimeAfter(item) && !startTimeTemp!.isSameTime(item)){
          setState(() {
            endTimeTemp = startTimeTemp;
            startTimeTemp = item;
          });
        }
      }
    }else{
      setState(() {
        startTimeTemp = item;
      });
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: const BoxDecoration(
                color: lightBlueColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(8))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      "${widget.startDate?.toStringWithFormat(format: "EEE")}",
                      style: listTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: infoColor),
                      child: Text(
                        "${widget.startDate?.toStringWithFormat(format: "d")}",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  width: 8,
                ),
                const Icon(
                  Icons.arrow_forward,
                  color: infoColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Column(
                  children: [
                    Text(
                      "${widget.endDate?.toStringWithFormat(format: "EEE")}",
                      style: listTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: infoColor),
                      child: Text(
                        "${widget.endDate?.toStringWithFormat(format: "d")}",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                startTimeTemp != null ? Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: infoColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    startTimeTemp!.toStringWithFormat(),
                    style: listTitleTextStyle,
                  ),
                ) : Container(
                  padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: infoColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    "Select Time",
                    style: listTitleTextStyle,
                  ),
                ),
                SizedBox(
                  width: endTimeTemp != null ? 16 : 0,
                ),
                endTimeTemp != null ? const Icon(
                  Icons.arrow_forward,
                  size: 24,
                  color: infoColor,
                ) : const SizedBox(),
                SizedBox(
                  width: endTimeTemp != null ? 16 : 0,
                ),
                endTimeTemp != null ? Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                      border: Border.all(color: infoColor),
                      borderRadius: BorderRadius.circular(8)),
                  child: Text(
                    "${endTimeTemp?.toStringWithFormat()}",
                    style: listTitleTextStyle,
                  ),
                ) : const SizedBox(),
              ],
            ),
          ),
          Expanded(
              child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Wrap(
              runSpacing: 16,
              spacing: 8,
              children: list
                  .map((e) => MeetingRoomTimeItem(
                        item: e,
                        onSelected: (item) {
                          _setSelected(item);
                        },
                        isThumb: _isThumb(e),
                        selected: _isSelected(e),
                      ))
                  .toList(),
            ),
          )),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: startTimeTemp != null ? () {
                widget.onConfirmClick(startTimeTemp, endTimeTemp);
                Get.back();
              } : null,
              style: ElevatedButton.styleFrom(backgroundColor: infoColor),
              child: Text("Confirm".tr),
            ),
          )
        ],
      ),
    );
  }
}

class MeetingRoomTimeItem extends StatelessWidget {
  const MeetingRoomTimeItem(
      {super.key,
      this.selected = false,
      this.isThumb = false,
      required this.item,
      required this.onSelected});

  final bool selected;
  final bool isThumb;
  final DateTime item;
  final ValueChanged<DateTime> onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onSelected(item);
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 120, minWidth: 90),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
              color: isThumb ? infoColor : selected ? infoColor.withOpacity(0.6) : const Color(0xFF8b8b8b),
              borderRadius: BorderRadius.circular(8)),
          child: Text(
            item.toStringWithFormat(),
            textAlign: TextAlign.center,
            style: listTitleTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
