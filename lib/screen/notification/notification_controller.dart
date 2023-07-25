import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/notification/notification_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/notification/notification_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';

enum NotificationTabEnum{
  notification,
  approval
}
class NotificationController extends BaseController with GetTickerProviderStateMixin{
  late TabController tabController;

  final listNotification = <NotificationModel>[].obs;
  final listNotificationApproval = <NotificationModel>[].obs;

  final NotificationRepository _repository = Get.find();
  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

  late PaginationModel? paginationModelApproval;
  final totalPageApproval = 1.obs;
  final currentPageApproval = 1.obs;

  final isApproval = false.obs;
  final tabs = <NotificationTabEnum>[].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: tabs.length, vsync: this);
    getNotification();
    getNotificationApproval();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    String roleId = await storage.readString(StorageCore.roleID);

    isApproval.value = roleId == "1" || roleId == "2" || roleId == "3" ? true : false;

    tabs.add(NotificationTabEnum.notification);
    if(isApproval.value){
      tabs.add(NotificationTabEnum.approval);
    }
    tabController = TabController(length: tabs.length, vsync: this);

  }

  void getNotification({int page = 1}) async {
    final result = await _repository.getNotification(
        data: {
          "page" : page,
          "perPage" : limit,
        }
    );

    result.fold(
            (l) {
          /*Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));*/
          listNotification.clear();
          totalPage(1);
          currentPage(1);
        },
            (r) {
          paginationModel = r;
          int tempTotalPage = (paginationModel!.total!/limit).ceil();
          totalPage(tempTotalPage);
          currentPage(paginationModel?.currentPage);

          listNotification.value = paginationModel!.data!
              .map((e) => NotificationModel.fromJson(e))
              .toList();
          listNotification.refresh();
        });
  }

  void getNotificationApproval({int page = 1}) async {
    final result = await _repository.getNotificationApproval(
        data: {
          "page" : page,
          "perPage" : limit,
        }
    );

    result.fold(
            (l) {
          /*Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
          listNotification.clear();*/
          totalPageApproval(1);
          currentPageApproval(1);
        },
            (r) {
          paginationModelApproval = r;
          int tempTotalPage = (paginationModelApproval!.total!/limit).ceil();
          totalPageApproval(tempTotalPage);
          currentPageApproval(paginationModelApproval?.currentPage);

          listNotificationApproval.value = paginationModelApproval!.data!
              .map((e) => NotificationModel.fromJson(e))
              .toList();
          listNotificationApproval.refresh();
        });
  }

  int unreadMessageCount(){
    int result = 0;
    listNotification.forEach((element) {
      if(element.isViewed!=1){
        result++;
      }
    });

    return result;
  }

  int unreadMessageCountApproval(){
    int result = 0;
    listNotificationApproval.forEach((element) {
      if(element.isViewed!=1){
        result++;
      }
    });

    return result;
  }

}