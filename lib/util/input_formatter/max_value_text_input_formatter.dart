import 'package:flutter/services.dart';

class MaxValueTextInputFormatter extends TextInputFormatter{
  final int maxValue;

  MaxValueTextInputFormatter(this.maxValue);
  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'^0+(?=.)'), '');
    int? value = int.tryParse(text);
    String enforceValue = text;
    if(value != null) {
      if (value > maxValue) {
        enforceValue = maxValue.toString();
      }
    }
    else{
      enforceValue = 0.toString();
    }

    return TextEditingValue(text: enforceValue, selection: TextSelection.collapsed(offset: enforceValue.length));

  }

}