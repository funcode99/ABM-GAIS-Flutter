import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_validator/form_validator.dart';
import 'package:gais/const/textstyle.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({super.key,
    required this.controller,
    required this.label,
    this.hintText,
    this.readOnly = false,
    this.onChanged,
    this.isRequired = false,
    this.validator,
    this.inputFormatters,
    this.onTap,
    this.inputType}) {
    if (isRequired) {
      validator ??= ValidationBuilder().required().build();
    }
  }

  final TextEditingController controller;
  final String label;
  final String? hintText;
  final bool readOnly;
  final ValueChanged<String>? onChanged;
  bool isRequired;
  FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? inputType;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            text: label,
            style: Theme
                .of(context)
                .textTheme
                .bodyText1
                ?.copyWith(
                fontSize: 14, color: Colors.black, fontWeight: FontWeight.w600),
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
          child: TextFormField(
            onTap:onTap,
            enabled: onTap != null ? true : !readOnly,
            controller: controller,
            readOnly: readOnly,
            onChanged: onChanged,
            validator: validator,
            keyboardType: inputType,
            inputFormatters: inputFormatters,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: Theme
                .of(context)
                .textTheme
                .bodyText1
                ?.copyWith(
                fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
                contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                hintText: hintText ?? label,
                hintStyle: hintTextStyle),
          ),
        ),
      ],
    );
  }
}
