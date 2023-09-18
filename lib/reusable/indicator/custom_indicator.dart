import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';

class CustomIndicator extends StatelessWidget {
  const CustomIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(50),
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(8)),
      child: const Center(
        child: SizedBox(
            width: 32, height: 32, child: CircularProgressIndicator()
        ),
      ),
    );
  }
}
