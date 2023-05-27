import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget{
  const FilterBottomSheet({super.key, required this.onApplyFilter, required this.children});

  final VoidCallback onApplyFilter;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 42),
          decoration: const BoxDecoration(
            color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...children,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed:onApplyFilter,
                    style: ElevatedButton.styleFrom(
                        backgroundColor: successColor
                    ),
                    child: Text(
                        "Filter".tr
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 13),
          height: 5,
          width: 80,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(20)
          ),
        )
      ],
    );
  }

}