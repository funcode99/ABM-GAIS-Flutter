import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key, this.onChanged, this.onPressedFilter, this.onClearFilter, this.margin, this.padding, this.onSubmit});

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmit;
  final VoidCallback? onPressedFilter;
  final VoidCallback? onClearFilter;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  Timer? _debounce;
  bool _showclearsearch = false;
  final _controller = TextEditingController();

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  _onSearchChanged(String query) {
    setState(() {
      _showclearsearch = query == "" ? false : true;
    });

    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      if (widget.onChanged != null) {
        widget.onChanged!(query);
      }
    });
  }

  _onSubmit(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      widget.onSubmit!(query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(vertical: 15),
      padding: widget.padding ?? const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              onChanged: _onSearchChanged,
              onSubmitted: _onSubmit,
              decoration: InputDecoration(
                  // contentPadding: const EdgeInsets.symmetric(vertical: 8),
                  hintText: "Search".tr,
                  prefixIcon: const Icon(IconlyLight.search),
                  suffixIcon: widget.onClearFilter != null && _showclearsearch == true
                      ? IconButton(
                          onPressed: () {
                            setState(() {
                              _controller.text = "";
                              _showclearsearch = false;
                            });
                            widget.onClearFilter!();
                          },
                          icon: const Icon(Icons.close))
                      : null),
            ),
          ),
          SizedBox(
            width: widget.onPressedFilter != null ? 18 : 0,
          ),
          widget.onPressedFilter != null
              ? ElevatedButton(
                  onPressed: widget.onPressedFilter,
                  style: ElevatedButton.styleFrom(backgroundColor: successColor, minimumSize: const Size(48, 48)),
                  child: const Icon(IconlyBold.filter_2),
                )
              : const SizedBox()
        ],
      ),
    );
  }
}
