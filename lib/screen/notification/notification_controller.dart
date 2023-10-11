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
  PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

  PaginationModel? paginationModelApproval;
  final totalPageApproval = 1.obs;
  final currentPageApproval = 1.obs;

  final isApproval = false.obs;
  final tabs = <NotificationTabEnum>[].obs;
  final totalNotification = 0.obs;
  final totalNotificationApproval = 0.obs;
  final isLoading = true.obs;
  final isLoadingApproval = true.obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 0, vsync: this);
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

    isApproval.value = roleId == "1" || roleId == "2" || roleId == "3" || roleId == "91" || roleId == "93" ? true : false;

    tabs.add(NotificationTabEnum.notification);
    if(isApproval.value){
      tabs.add(NotificationTabEnum.approval);
    }
    tabController = TabController(length: tabs.length, vsync: this);

  }

  void getNotification({int page = 1}) async {
    isLoading(true);
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
          isLoading(false);

        },
            (r) {
          paginationModel = r;
          int tempTotalPage = (paginationModel!.total!/limit).ceil();
          totalPage(tempTotalPage);
          currentPage(paginationModel?.currentPage);

          totalNotification.value = paginationModel!.total!;
          isLoading(false);

          listNotification.value = paginationModel!.data!
              .map((e) => NotificationModel.fromJson(e))
              .toList();
          listNotification.refresh();
        });
  }

  void getNotificationApproval({int page = 1}) async {
    isLoadingApproval(true);
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
          isLoadingApproval(false);
        },
            (r) {
          paginationModelApproval = r;
          int tempTotalPage = (paginationModelApproval!.total!/limit).ceil();
          totalPageApproval(tempTotalPage);
          currentPageApproval(paginationModelApproval?.currentPage);
          isLoadingApproval(false);

          totalNotificationApproval.value = paginationModelApproval!.total!;

          listNotificationApproval.value = paginationModelApproval!.data!
              .map((e) => NotificationModel.fromJson(e))
              .toList();
          listNotificationApproval.refresh();
        });
  }

  void updateNotificationStatus(String? id)async{
    final result = await _repository.updateNotificationStatus(id);
  }

  int unreadMessageCount(){
    int result = 0;
    /*for (var element in listNotification) {
      if(element.isViewed==1){
        result++;
      }
    }*/

    if(paginationModel != null){
      result = paginationModel?.total ?? 0;
    }

    print("RESULT $result");

    return result;
  }

  int unreadMessageCountApproval(){
    int result = 0;
    /*for (var element in listNotificationApproval) {
      if(element.isViewed==1){
        result++;
      }
    }*/

    if(paginationModelApproval != null){
      result = paginationModelApproval?.total ?? 0;
    }

    return result;
  }


}