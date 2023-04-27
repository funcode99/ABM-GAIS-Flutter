import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:iconly/iconly.dart';

class CustomSearchBar extends StatelessWidget{
  const CustomSearchBar({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        onChanged: onChanged,
        decoration: const InputDecoration(
            hintText: "Search",
            prefixIcon: Icon(IconlyLight.search)),
      ),
    );
  }

}