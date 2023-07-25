import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/notification/notification_model.dart';
import 'package:gais/data/model/pagination_model.dart';
import 'package:gais/data/repository/notification/notification_repository.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';

class NotificationController extends BaseController{

  final listNotification = <NotificationModel>[].obs;

  final NotificationRepository _repository = Get.find();
  late PaginationModel? paginationModel;
  final totalPage = 1.obs;
  final currentPage = 1.obs;
  int limit = 10;

  final isApproval = false.obs;

  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  @override
  void onReady() {
    super.onReady();
    initData();
  }

  void initData()async{
    String roleId = await storage.readString(StorageCore.siteID);
    isApproval.value = roleId == "1" || roleId == "2" || roleId == "3" ? true : false;

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
          Get.showSnackbar(
              CustomGetSnackBar(message: l.message, backgroundColor: Colors.red));
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

}