import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';

class CustomDropDownFormField<T> extends StatelessWidget {
  CustomDropDownFormField({super.key,
    required this.items,
    required this.label,
    this.value,
    this.hintText,
    this.readOnly = false,
    this.onChanged,
    this.isRequired = false,
    this.validator, this.selectedItem}) {
    if (isRequired) {
      validator ??= ValidationBuilder().required().build() as FormFieldValidator<T>?;
    }
  }

  final String label;
  final String? hintText;
  final String? selectedItem;
  final bool readOnly;
  T? value;
  final ValueChanged<T?>? onChanged;
  bool isRequired;
  FormFieldValidator<T>? validator;
  final List<DropdownMenuItem<T>>? items;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: formlabelTextStyle,
            children: <TextSpan>[
              TextSpan(
                  text: isRequired ? "*" : "",
                  style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: readOnly ? TextField(
            controller: TextEditingController(text: selectedItem.toString()),
            enabled: false,
            style: Theme.of(context).textTheme.bodyText1?.copyWith(
              fontSize: 16,
              color: Colors.black,
              // fontWeight: FontWeight.w600,
            ),
            decoration: InputDecoration(
              fillColor: neutralColor,
            ),
          ):DropdownButtonFormField(
            // autovalidateMode: AutovalidateMode.always,
            validator: validator,
            decoration: const InputDecoration(
                contentPadding:
                EdgeInsets.symmetric(horizontal: 8, vertical: 2)),
            icon: const Icon(Icons.keyboard_arrow_down),
            hint: Text(hintText ?? label, style: hintTextStyle,),
            value: value,
            isExpanded: true,
            items: items,
            onChanged: onChanged,

          ),
        ),
      ],
    );
  }
}
