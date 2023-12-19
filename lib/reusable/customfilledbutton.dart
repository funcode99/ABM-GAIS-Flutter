import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final String? title;
  final IconData? icon;
  final Color color;
  final Color? borderColor;
  final Color? fontColor;
  final double? fontSize;
  final double width;
  final double? height;
  final double radius;
  final VoidCallback? onPressed;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const CustomFilledButton(
      {Key? key,
      this.title = '',
      this.width = double.infinity,
      this.height,
      this.icon,
      required this.color,
      this.onPressed,
      this.borderColor = Colors.transparent,
      this.fontColor = Colors.white,
      this.radius = 5,
      this.fontSize = 14,
      this.margin,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        margin: margin ?? const EdgeInsets.symmetric(vertical: 10),
        padding: padding ?? const EdgeInsets.symmetric(vertical: 10),
        width: width,
        height: height ?? 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null
                ? Icon(
                    icon,
                    color: fontColor,
                    size: fontSize! + 2,
                  )
                : Container(),
            title != null
                ? Text(
                    ' $title',
                    style: TextStyle(color: fontColor, fontWeight: FontWeight.w900, fontSize: fontSize),
                    textAlign: TextAlign.center,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
