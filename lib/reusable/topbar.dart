import 'package:flutter/material.dart';

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final Widget? leading;
  final List<Widget>? action;
  final Size height;
  final double elevation;

  const TopBar({
    Key? key,
    this.title,
    this.leading,
    this.action,
    this.height = const Size.fromHeight(50),
    this.elevation = 0,
  }) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PreferredSize(
        preferredSize: height,
        child: AppBar(
          centerTitle: true,
          title: title,
          leading: leading,
          actions: action,
          flexibleSpace: const Image(
            image: AssetImage('assets/img/TopBar.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
