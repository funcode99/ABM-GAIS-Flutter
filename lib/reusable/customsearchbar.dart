import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, required this.onChanged, this.onPressedFilter});

  final ValueChanged<String> onChanged;
  final VoidCallback? onPressedFilter;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Timer? _debounce;

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      widget.onChanged(query);
    });
  }

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
              onChanged: _onSearchChanged,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  hintText: "Search".tr, prefixIcon: const Icon(IconlyLight.search)),
            ),
          ),
          SizedBox(
            width: widget.onPressedFilter != null ? 18 : 0,
          ),
          widget.onPressedFilter != null ? ElevatedButton(
            onPressed: widget.onPressedFilter,
            style: ElevatedButton.styleFrom(
                backgroundColor: successColor,
                minimumSize: const Size(48, 48)
            ),
            child: const Icon(IconlyBold.filter_2),
          ) : const SizedBox()
        ],
      ),
    );
  }
}