import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:get/get.dart';

class FilterBottomSheet extends StatelessWidget{
  const FilterBottomSheet({super.key, required this.onApplyFilter, required this.children});

  final VoidCallback onApplyFilter;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 42),
      decoration: const BoxDecoration(
        color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
      ),
      child: SingleChildScrollView(
        child: Column(
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
    );
  }

}