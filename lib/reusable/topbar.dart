import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Image(
        image: AssetImage('assets/img/TopBar.png'),
        fit: BoxFit.fill,
      ),
    );
  }
}
