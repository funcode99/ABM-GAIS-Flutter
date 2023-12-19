import 'dart:io';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/reusable/picker/image_picker.dart';

class CustomRadioGroup<T> extends StatefulWidget {
  const CustomRadioGroup(
      {super.key,
      required this.onChanged,
      required this.listLabel,
      required this.listValue,
      this.listAttachable,
      this.onImageSelected,
      this.readOnly = false,
      this.withImage = false,
      required this.selectedValue})
      : assert(listLabel.length == listValue.length,
            "listLabel length must be == listValue length");

  final List<String> listLabel;
  final List<T> listValue;
  final List<bool>? listAttachable;
  final T selectedValue;
  final ValueChanged<T> onChanged;
  final ValueChanged<File?>? onImageSelected;
  final bool readOnly;
  final bool withImage;

  @override
  State<CustomRadioGroup<T>> createState() => _CustomRadioGroupState<T>();
}

class _CustomRadioGroupState<T> extends State<CustomRadioGroup<T>> {
  bool _showImage = false;

  @override
  void initState() {
    super.initState();
    if(widget.listAttachable!=null){
      setState(() {
        _showImage = widget.listAttachable![0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...widget.listValue
          .mapIndexed((index, item) => Column(
                children: [
                  CustomRadio<T>(
                    text: widget.listLabel[index],
                    isSelected: item == widget.selectedValue,
                    onChanged: (value){
                      widget.onChanged(value);
                      if(widget.listAttachable!=null){
                        setState(() {
                          _showImage = widget.listAttachable![index];
                        });
                      }
                    },
                    value: item,
                    readOnly: widget.readOnly,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                ],
              ))
          .toList(),
      AnimatedSwitcher(
        reverseDuration: const Duration(milliseconds: 500),
        duration: const Duration(milliseconds: 500),
        child: widget.withImage && _showImage ? ImagePicker(
          onImageSelected: (file) {
            if (widget.onImageSelected != null) {
              widget.onImageSelected!(file);
            }
          },
        ) : const SizedBox(),
      )
    ]);
  }
}

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.value,
      this.readOnly = false,
      required this.onChanged});

  final bool isSelected;
  final String text;
  final T value;
  final ValueChanged<T> onChanged;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: readOnly
          ? null
          : () {
              onChanged(value);
            },
      child: Row(
        children: [
          Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: blackColor),
                color: isSelected ? infoColor : Colors.transparent),
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
