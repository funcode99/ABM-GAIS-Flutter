import 'package:flutter/material.dart';
import 'package:gais/screen/home/home_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class BottomBar extends StatelessWidget {
  final int menu;

  const BottomBar({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
        // init: HomeController(),
        builder: (controller) {
      return BottomNavigationBar(
        elevation: 10,
        items: [
          BottomNavigationBarItem(
              icon:
                  Icon(menu != 0 ? IconlyLight.home : IconlyBold.home),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(menu != 1
                  ? IconlyLight.chart
                  : IconlyBold.chart),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(menu != 2
                  ? IconlyLight.notification
                  : IconlyBold.notification),
              label: ""),
          BottomNavigationBarItem(
              icon: Icon(menu != 3
                  ? IconlyLight.profile
                  : IconlyBold.profile),
              label: ""),
        ],
        currentIndex: menu,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          Get.offAll(const HomeScreen(), arguments: index);
        },
      );
    });
  }
}
