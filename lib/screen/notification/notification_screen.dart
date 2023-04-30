import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: TabBar(
            controller: tabController,
            labelColor: infoColor,
            unselectedLabelColor: greyColor,
            indicatorSize: TabBarIndicatorSize.label,
            tabs: [
              Tab(
                icon: Container(
                  alignment: Alignment.center,
                  height: 30, width: 30,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: baseColor,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("2", style: listSubTitleTextStyle.copyWith(color: infoColor),),
                ),
                text: "Notification",
              ),
              Tab(
                icon: Container(
                  alignment: Alignment.center,
                  height: 30, width: 30,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: baseColor,
                      borderRadius: BorderRadius.circular(50)
                  ),
                  child: Text("2", style: listSubTitleTextStyle.copyWith(color: infoColor),),
                ),
                text: "Approval",
              ),
            ],
          ),
        )
      ],
    );
  }
}
