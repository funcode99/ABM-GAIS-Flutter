import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/cutompagination.dart';
import 'package:gais/reusable/dataempty.dart';
import 'package:gais/reusable/indicator/custom_indicator.dart';
import 'package:gais/screen/notification/notification_controller.dart';
import 'package:gais/util/navigation/notification_navigation.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

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
          child: Obx(() {
            return TabBar(
              controller: controller.tabController,
              labelColor: infoColor,
              unselectedLabelColor: greyColor,
              indicatorSize: TabBarIndicatorSize.label,
              tabs: controller.tabs.mapIndexed(
                      (index, element){
                        return Tab(
                          icon: Container(
                            alignment: Alignment.center,
                            height: 30,
                            width: 30,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: baseColor,
                                borderRadius: BorderRadius.circular(50)
                            ),
                            child: Text(
                              "${element == NotificationTabEnum.notification ? controller.totalNotification : controller.totalNotificationApproval}",
                              style: listSubTitleTextStyle.copyWith(color: infoColor),),
                          ),
                          text: element == NotificationTabEnum.notification ? "Notification" : "Approval",
                        );
                      }).toList(),
            );
          }),
        ),
        Expanded(
            child: Obx(() {
              return TabBarView(
                controller: controller.tabController,
                children: controller.tabs.mapIndexed(
                      (index, element){
                        if(element == NotificationTabEnum.notification){
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Obx(() {
                                  if(controller.listNotification.isEmpty){
                                    return const SizedBox();
                                  }
                                  return CustomPagination(
                                    colorSub: whiteColor,
                                    colorPrimary: infoColor,
                                    key: UniqueKey(),
                                    onPageChanged: (page) {
                                      if (page != controller.currentPage.value) {
                                        controller.getNotification(page: page);
                                      }
                                    },
                                    pageTotal: controller.totalPage.value,
                                    margin: EdgeInsets.zero,
                                    pageInit: controller.currentPage.value,
                                  );
                                }),
                                const SizedBox(
                                  height: 8,
                                ),
                                Expanded(
                                    child: RefreshIndicator(
                                      onRefresh: () async {
                                        controller.getNotification();
                                      },
                                      child: Obx(() {
                                        if(controller.isLoading.value){
                                          return const CustomIndicator();
                                        }
                                        return controller.listNotification.isEmpty
                                            ? const DataEmpty()
                                            : ListView(
                                          children: [
                                            ...controller.listNotification.mapIndexed((
                                                index,
                                                item) =>
                                                NotificationItem(
                                                  text: item.text ?? "",
                                                  date: item.date ?? "",
                                                  name: item.name ?? "",
                                                  showIndicator: item.isViewed == 1,
                                                  onClick: (){
                                                    if(item.isViewed == 1){
                                                      controller.updateNotificationStatus(item.id);
                                                    }
                                                    NotificationNavigation.navigateToPage(codeDocument: item.codeDocument, idDocument: item.idDocument, typeDocument: item.typeDocument);
                                                  },
                                                )
                                            )
                                          ],
                                        );
                                      }),
                                    )),
                              ],
                            ),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            children: [
                              Obx(() {
                                if(controller.listNotificationApproval.isEmpty){
                                  return const SizedBox();
                                }
                                return CustomPagination(
                                  colorSub: whiteColor,
                                  colorPrimary: infoColor,
                                  key: UniqueKey(),
                                  onPageChanged: (page) {
                                    if (page != controller.currentPageApproval.value) {
                                      controller.getNotificationApproval(page: page);
                                    }
                                  },
                                  pageTotal: controller.totalPageApproval.value,
                                  margin: EdgeInsets.zero,
                                  pageInit: controller.currentPageApproval.value,
                                );
                              }),
                              const SizedBox(
                                height: 8,
                              ),
                              Expanded(
                                  child: RefreshIndicator(
                                    onRefresh: () async {
                                      controller.getNotificationApproval();
                                    },
                                    child: Obx(() {
                                      if(controller.isLoadingApproval.value){
                                        return const CustomIndicator();
                                      }
                                      return controller.listNotificationApproval.isEmpty
                                          ? const DataEmpty()
                                          : ListView(
                                        children: [
                                          ...controller.listNotificationApproval.mapIndexed((
                                              index,
                                              item) =>
                                              NotificationItem(
                                                text: item.text ?? "",
                                                date: item.date ?? "",
                                                name: item.name ?? "",
                                                showIndicator: item.isViewed == 1,
                                                onClick: (){
                                                  if(item.isViewed == 1){
                                                    controller.updateNotificationStatus(item.id);
                                                  }
                                                  NotificationNavigation.navigateToPageApproval(codeDocument: item.codeDocument, idDocument: item.idDocument, typeDocument: item.typeDocument, idApproval: item.id);
                                                },
                                              )
                                          )
                                        ],
                                      );
                                    }),
                                  )),
                            ],
                          ),
                        );
                      }).toList(),
              );
            })
        )
      ],
    );
  }
}

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {super.key, required this.date, required this.text, required this.name, this.showIndicator = false, this.onClick});

  final String name;
  final String date;
  final String text;
  final bool showIndicator;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey
                  ),
                ),
                if (showIndicator) Positioned(
                  left: 0,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: redColor
                    ),
                  ),
                ) else
                  const SizedBox(),
              ],
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name ?? "",
                      style: listTitleTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.w700
                      ),
                    ),
                    const SizedBox(
                      height: 4,
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
            const SizedBox(
              width: 8,
            ),
            Container(
              height: 80,
              alignment: Alignment.bottomRight,
              child: const Icon(IconlyBold.logout, color: infoColor,),
            )
          ],
        ),
      ),
    );
  }

}
