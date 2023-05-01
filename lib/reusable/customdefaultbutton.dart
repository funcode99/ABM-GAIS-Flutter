import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';

class CustomDefaultButton extends StatelessWidget {
  final String title;
  final VoidCallback? onPressed;

  const CustomDefaultButton({super.key, required this.title, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
            minimumSize: MaterialStateProperty.all<Size>(const Size(100, 40)),
            elevation: MaterialStateProperty.resolveWith<double>(
              // As you said you dont need elevation. I'm returning 0 in both case
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return 0;
                }
                return 0; // Defer to the widget's default.
              },
            ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16
            )
          )
        ),
        onPressed: onPressed,
        child: Text(title));
  }
}
