import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/screen/notification/notification_controller.dart';
import 'package:gais/screen/notification/notification_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

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
    final NotificationController controller = Get.put(NotificationController());

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
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
                  padding: const EdgeInsets.all(5),
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
                  padding: const EdgeInsets.all(5),
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
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                CustomPagination(
                  onPageChanged: (int page){},
                  pageTotal: 5,
                  colorSub: whiteColor,
                  colorPrimary: infoColor,
                ),
                Expanded(
                    child: RefreshIndicator(
                      onRefresh: () async {
                        controller.getNotification();
                      },
                      child: Obx(() {
                        return controller.listNotification.isEmpty
                            ? const DataEmpty()
                            : ListView(
                          children: [
                            ...controller.listNotification.mapIndexed((index, item) =>
                                NotificationItem(
                                  text: item.text ?? "",
                                  date: item.date ?? "",
                                )
                            )
                          ],
                        );
                      }),
                    )),
              ],
            ),
          )
        )
      ],
    );
  }
}

class NotificationItem extends StatelessWidget{
  const NotificationItem({super.key, required this.date, required this.text, this.name});

  final String? name;
  final String date;
  final String text;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Stack(
            children: [
              Icon(Icons.add)
            ],
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                name == null ? const SizedBox() :
                Text(
                  "$name",
                  style: listTitleTextStyle.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.w700
                  ),
                ),
                SizedBox(
                  height: name == null ? 0 : 4,
                ),
                Text(
                  "$date",
                  style: listSubTitleTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  text,
                  style: listSubTitleTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ],
            )
          ),
          Container(
            color: Colors.redAccent,
            alignment: Alignment.bottomRight,
            child: Icon(IconlyBold.logout, color: infoColor,),
          )
        ],
      ),
    );
  }
  
}
