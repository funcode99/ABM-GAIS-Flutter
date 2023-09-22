import 'package:flutter/material.dart';
import 'package:gais/util/ext/string_ext.dart';

class CustomAvatarNetwork extends StatelessWidget{
  const CustomAvatarNetwork({super.key, required this.imagePath, required this.name, required this.size, required this.fontSize});

  final String imagePath;
  final String name;
  final double size;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0Xfff6de9d)
      ),
      child: Image.network(
        imagePath,
        fit: BoxFit.contain,
        errorBuilder: (context, _, __) {
          return Center(
              child: Text(
                name.getInitials() ?? "",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize),));
        },
      ),
    );
  }

}