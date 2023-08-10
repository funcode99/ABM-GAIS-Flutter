import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';

class CustomIconButton extends StatelessWidget{
  const CustomIconButton({super.key, this.backgroundColor = successColor, required this.onPressed, required this.iconData, required this.title});

  final Color? backgroundColor;
  final VoidCallback onPressed;
  final IconData iconData;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 16,
            ),
            const SizedBox(
              width: 6,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 10),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

}