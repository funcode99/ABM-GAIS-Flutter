import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:get/get.dart';

class MeetingRoomTimeModel {
  final String time;
  final int value;

  MeetingRoomTimeModel({required this.time, required this.value});
}

class MeetingRoomTimePickerDialog extends StatefulWidget {
  const MeetingRoomTimePickerDialog({super.key, this.startTime, this.endTime, required this.onConfirmClick});

  final MeetingRoomTimeModel? startTime;
  final MeetingRoomTimeModel? endTime;
  final Function(MeetingRoomTimeModel, MeetingRoomTimeModel) onConfirmClick;

  @override
  State<MeetingRoomTimePickerDialog> createState() =>
      _MeetingRoomTimePickerDialogState();
}

class _MeetingRoomTimePickerDialogState
    extends State<MeetingRoomTimePickerDialog> {
  List<MeetingRoomTimeModel> selected = [];
  MeetingRoomTimeModel? startTimeTemp;
  MeetingRoomTimeModel? endTimeTemp;


  List<MeetingRoomTimeModel> list = [
    MeetingRoomTimeModel(time: "07:30", value: 1),
    MeetingRoomTimeModel(time: "08:00", value: 2),
    MeetingRoomTimeModel(time: "08:30", value: 3),
    MeetingRoomTimeModel(time: "09:00", value: 4),
    MeetingRoomTimeModel(time: "09:30", value: 5),
    MeetingRoomTimeModel(time: "10:00", value: 6),
    MeetingRoomTimeModel(time: "10:30", value: 7),
    MeetingRoomTimeModel(time: "11:00", value: 8),
    MeetingRoomTimeModel(time: "11:30", value: 9),
    MeetingRoomTimeModel(time: "12:00", value: 10),
    MeetingRoomTimeModel(time: "12:30", value: 11),
    MeetingRoomTimeModel(time: "13:00", value: 12),
    MeetingRoomTimeModel(time: "13:30", value: 13),
    MeetingRoomTimeModel(time: "14:00", value: 14),
    MeetingRoomTimeModel(time: "14:30", value: 15),
    MeetingRoomTimeModel(time: "15:00", value: 16),
    MeetingRoomTimeModel(time: "15:30", value: 17),
    MeetingRoomTimeModel(time: "16:00", value: 18),
    MeetingRoomTimeModel(time: "16:30", value: 19),
    MeetingRoomTimeModel(time: "17:00", value: 20),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      startTimeTemp = widget.startTime;
      endTimeTemp = widget.endTime;
    });
  }
  
  bool _isSelected(MeetingRoomTimeModel item){
    bool result = false;
    if(startTimeTemp!=null){
      if(endTimeTemp!=null){
        if(startTimeTemp!.value <= item.value &&  item.value <= endTimeTemp!.value){
          result = true;
        }
      }else{
         result = startTimeTemp!.value == item.value;
      }
    }
    
    return result;
  }

  bool _isThumb(MeetingRoomTimeModel item){
    if(startTimeTemp!=null){
      if(endTimeTemp!=null){
        return endTimeTemp!.value == item.value || startTimeTemp!.value == item.value;
      }
      return startTimeTemp!.value == item.value;
    }

    return false;
  }

  void _setSelected(MeetingRoomTimeModel item){
    if(startTimeTemp!=null){
      if(endTimeTemp!=null){
        if(item.value == endTimeTemp!.value){
          setState(() {
            endTimeTemp = null;
          });
        }else if(item.value == startTimeTemp!.value){
          setState(() {
            startTimeTemp = endTimeTemp;
            endTimeTemp = null;
          });
        }
      }else{
        if(item.value == startTimeTemp!.value){
          setState(() {
            startTimeTemp = null;
          });
        }else if(item.value > startTimeTemp!.value){
          setState(() {
            endTimeTemp = item;
          });
        }else if(item.value < startTimeTemp!.value){
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
                      "Mon",
                      style: listTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: infoColor),
                      child: const Text(
                        "20",
                        style: TextStyle(
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
                      "Mon",
                      style: listTitleTextStyle,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: infoColor),
                      child: const Text(
                        "20",
                        style: TextStyle(
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
                    "${startTimeTemp?.time}",
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
                ) : SizedBox(),
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
                    "${endTimeTemp?.time}",
                    style: listTitleTextStyle,
                  ),
                ) : SizedBox(),
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
  final MeetingRoomTimeModel item;
  final ValueChanged<MeetingRoomTimeModel> onSelected;

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
            item.time,
            textAlign: TextAlign.center,
            style: listTitleTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
