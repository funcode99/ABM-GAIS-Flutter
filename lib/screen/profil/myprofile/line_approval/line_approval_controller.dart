import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';
import 'package:gais/reusable/snackbar/custom_get_snackbar.dart';
import 'package:get/get.dart';


class LineApprovalController extends BaseController{
  TextEditingController l1Controller = TextEditingController();
  TextEditingController l2Controller = TextEditingController();
  TextEditingController l3Controller = TextEditingController();
  TextEditingController l4Controller = TextEditingController();
  TextEditingController l5Controller = TextEditingController();
  TextEditingController l6Controller = TextEditingController();

  final listController = <TextEditingController>[].obs;
  final listLevel = <String>[].obs;
  final listData = <Map<String, dynamic>>[].obs;

  final lineApproval = {}.obs;
  @override
  void onInit() {
    super.onInit();
    getLineApproval();
  }

  @override
  void onReady() {
    super.onReady();
  }

  void setValue()async{
    if(lineApproval.value!=null){


    }

  }

  void getLineApproval()async{
    try{
      Map<String, dynamic> result = await repository.getLineApproval();
      if(result.containsKey("data")){
        List<Map<String, dynamic>> list = List<Map<String, dynamic>>.from(result['data']);
        for (Map<String, dynamic> element in list) {

          listData.add(element);

          if(element.containsKey("level")){
            listLevel.add(element["level"]);

            TextEditingController textEditingController = TextEditingController();
            List<String> listName = List<String>.from(element["nama"]);
            textEditingController.text = "${element["jabatan"] ?? ""}\n${listName.map((e) => "$e\n").toList()}".replaceAll(RegExp("[\\[\\], ]"), "");

            listController.add(textEditingController);
          }

        }
      }
    }catch(e){
      Get.showSnackbar(
          CustomGetSnackBar(message: "$e", backgroundColor: Colors.red));
    }
  }
  
  void setText(TextEditingController controller, Map<String, dynamic> data){
    
  }

}