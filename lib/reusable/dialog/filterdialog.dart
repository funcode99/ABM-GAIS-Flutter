import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:get/get.dart';

class FilterDialog extends StatelessWidget{
  const FilterDialog({super.key, required this.onApplyFilter, required this.children});

  final VoidCallback onApplyFilter;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      titlePadding: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(8))),
      title: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 20, vertical: 5),
        decoration: const BoxDecoration(
            color: lightBlueColor,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                topLeft: Radius.circular(8))),
        child: Row(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          children: [
            Text("Filter".tr),
            IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close))
          ],
        ),
      ),
      content: Column(
        crossAxisAlignment:
        CrossAxisAlignment.start,
        children: children,
      ),
      actionsAlignment:
      MainAxisAlignment.center,
      actions: [
        ElevatedButton(
          onPressed:onApplyFilter,
          style: ElevatedButton.styleFrom(
            backgroundColor: successColor
          ),
          child: Text(
            "Filter".tr
          ),
        )
      ],
    );
  }

}