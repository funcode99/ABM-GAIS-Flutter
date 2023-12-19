import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/util/input_formatter/max_value_text_input_formatter.dart';
import 'package:gais/util/input_formatter/min_value_text_input_formatter.dart';

class CustomNumberPicker extends StatefulWidget {
  const CustomNumberPicker(
      {super.key,
        required this.onChanged,
        this.maxValue,
        this.minValue,
        this.suffix,
        required this.currentValue})
      : assert(maxValue != null ? currentValue <= maxValue : true,
  "currentValue must be <= maxValue"),
        assert(minValue != null ? currentValue >= minValue : true,
        "currentValue must be >= minValue");

  final ValueChanged<int> onChanged;
  final int currentValue;
  final int? maxValue;
  final int? minValue;
  final String? suffix;

  @override
  State<CustomNumberPicker> createState() => _CustomNumberPickerState();
}

class _CustomNumberPickerState extends State<CustomNumberPicker> {
  int _currentValue = 0;
  final Color _colorDisable = Colors.grey;
  final Color _colorEnable = greyColor;
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentValue = widget.currentValue;
    });
    _textEditingController.text = "$_currentValue";
  }

  _getInputFormatters() {
    List<TextInputFormatter> inputFormatters = [
      FilteringTextInputFormatter.digitsOnly,
    ];

    if (widget.maxValue != null) {
      inputFormatters.add(MaxValueTextInputFormatter(widget.maxValue!));
    }
    if (widget.minValue != null) {
      inputFormatters.add(MinValueTextInputFormatter(widget.minValue!));
    }

    return inputFormatters;
  }

  _checkDisableAddButton() {
    return widget.maxValue != null
        ? widget.maxValue! <= widget.currentValue
        : false;
  }

  _checkDisableSubButton() {
    return widget.minValue != null
        ? widget.minValue! >= widget.currentValue
        : false;
  }

  _updateValue(int val) {
    FocusScope.of(context).unfocus();
    setState(() {
      _currentValue = val;
    });

    _textEditingController.text = "$_currentValue";

    widget.onChanged(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(width: 1),
      ),
      padding: EdgeInsets.all(4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 18,
            width: 18,
            child: InkWell(
              onTap: _checkDisableSubButton()
                  ? null
                  : () {
                _updateValue(_currentValue - 1);
              },
              child: Icon(
                Icons.remove,
                size: 12,
                color: _checkDisableSubButton() ? _colorDisable : _colorEnable,
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            width: 30,
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
            child: Center(
              child: TextField(
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
                textAlign: TextAlign.center,
                controller: _textEditingController,
                style: Theme.of(context).textTheme.subtitle2?.copyWith(
                  color: Color(0xFF1C1C1C),
                  fontWeight: FontWeight.w700,
                  fontSize: 14,
                ),
                keyboardType: Platform.isIOS
                    ? const TextInputType.numberWithOptions(decimal: true, signed: true)
                    : TextInputType.number,
                inputFormatters: _getInputFormatters(),
                onChanged: (val) {
                  String text = val.replaceAll(RegExp(r"\D"), "");
                  setState(() {
                    _currentValue = int.parse(text);
                  });

                  widget.onChanged(_currentValue);
                },
              ),
            ),
          ),
          SizedBox(
            width: 4,
          ),
          Container(
            height: 18,
            width: 18,
            child: InkWell(
              onTap: _checkDisableAddButton()
                  ? null
                  : () {
                _updateValue(_currentValue + 1);
              },
              child: Icon(
                Icons.add,
                size: 12,
                color: _checkDisableAddButton() ? _colorDisable : _colorEnable,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
