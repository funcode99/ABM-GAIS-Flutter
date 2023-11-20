import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/data/model/employee_info_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';


class MyProfileController extends BaseController{
  TextEditingController nameController = TextEditingController();
  TextEditingController snController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController positionController = TextEditingController();
  TextEditingController companyController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  EmployeeInfoModel? profile;

  @override
  void onInit() {
    super.onInit();
    getDetailProfile();
  }

  void setValue()async{
    if(profile!=null){
      nameController.text = profile?.data?[0].name ?? "";
      snController.text = profile?.data?[0].snEmployee ?? "";
      phoneController.text = profile?.data?[0].phoneNumber ?? "";
      dobController.text = profile?.data?[0].dob?.toDateFormat(targetFormat: "dd/MM/yyyy", originFormat: "yyyy-MM-dd HH:mm:ss" ) ?? "";
      genderController.text = profile?.data?[0].jenkel?.toLowerCase() == "l" || profile?.data?[0].jenkel?.toLowerCase() == "male" ? "Male" : profile?.data?[0].jenkel?.toLowerCase() == "p" || profile?.data?[0].jenkel?.toLowerCase() == "female" ? "Female"  : "";
      emailController.text = profile?.data?[0].email ?? "";
      positionController.text = profile?.data?[0].positionTittle ?? "";
      companyController.text = profile?.data?[0].companyName ?? "";
      locationController.text = profile?.data?[0].siteName ?? "";

    }

  }

  void getDetailProfile()async{
    profile = await repository.getProfile();
    if(profile!=null){
      setValue();
    }
  }

}