import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.onChanged, this.onPressedFilter});

  final ValueChanged<String> onChanged;
  final VoidCallback? onPressedFilter;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: onChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  hintText: "Search".tr, prefixIcon: const Icon(IconlyLight.search)),
            ),
          ),
          SizedBox(
            width: onPressedFilter != null ? 18 : 0,
          ),
          onPressedFilter != null ? ElevatedButton(
            onPressed: onPressedFilter,
            style: ElevatedButton.styleFrom(
                backgroundColor: successColor,
                minimumSize: const Size(48, 48)
            ),
            child: const Icon(IconlyBold.filter_2),
          ) : SizedBox()
        ],
      ),
    );
  }
}
