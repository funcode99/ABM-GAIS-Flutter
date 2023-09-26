import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:get/get.dart';


class MyProfileMainController extends BaseController with GetTickerProviderStateMixin{
  final tabController = Rxn<TabController>();
  final isEmployee = false.obs;

  final name = "".obs;
  final image = "".obs;
  final isLoading = false.obs;

  EmployeeInfoModel? profile;

  @override
  void onInit() {
    super.onInit();
    initData();
    tabController.value = TabController(length: 1, vsync: this);
  }

  @override
  void onClose() {
    tabController.value?.dispose();
    super.onClose();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void initData()async{
    String isEmployee = await storage.readString(StorageCore.isEmployee);
    String name = await storage.readString(StorageCore.employeeName);
    String imagePath = await storage.readString(StorageCore.filePath);

    if(isEmployee == "1"){
      tabController.value = TabController(length: 2, vsync: this);
    }

    this.name.value = name;
    image.value = imagePath;

    this.isEmployee.value = isEmployee == "1";
  }

  void changePhoto(String? filepath)async{
    if(filepath!=null){
      isLoading.value = true;
      final result = await repository.changePhotoProfile(filepath);
      if(result!=null){
        getDetailProfile();
      }

      isLoading.value = false;
    }

  }

  void getDetailProfile()async{
    profile = await repository.getProfile();
    if(profile!=null){
      image.value = profile?.data?[0].filePath ?? "";
    }
  }

}