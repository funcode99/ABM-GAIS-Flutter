import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';

class CustomRadioGroup<T> extends StatelessWidget {
  const CustomRadioGroup(
      {super.key,
      required this.onChanged,
      required this.listLabel,
      required this.listValue,
      required this.selectedValue})
      : assert(listLabel.length == listValue.length,
            "listLabel length must be == listValue length");

  final List<String> listLabel;
  final List<T> listValue;
  final T selectedValue;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children:
        listValue.mapIndexed(
          (index, item) => Column(
            children: [
              CustomRadio<T>(
                text: listLabel[index],
                isSelected: item == selectedValue,
                onChanged: onChanged,
                value: item,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          )).toList()
    );
  }
}

class CustomRadio<T> extends StatelessWidget {
  const CustomRadio(
      {super.key,
      required this.isSelected,
      required this.text,
      required this.value,
      required this.onChanged});

  final bool isSelected;
  final String text;
  final T value;
  final ValueChanged<T> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
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
