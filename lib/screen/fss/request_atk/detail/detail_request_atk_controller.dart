import 'package:flutter/material.dart';
import 'package:gais/base/base_controller.dart';

class RequestATKDetailController extends BaseController{
  final TextEditingController createdDateController = TextEditingController();
  final TextEditingController createdByController = TextEditingController();
  final TextEditingController itemController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController uomController = TextEditingController();
  final TextEditingController siteController = TextEditingController();
  final TextEditingController warehouseController = TextEditingController();
  final TextEditingController remarksController = TextEditingController();

  @override
  void onInit() {
    createdDateController.text = "23/02/23";
    createdByController.text = "John Smith";
    itemController.text = "Pencil";
    brandController.text = "Steadler";
    quantityController.text = "10";
    uomController.text = "pcs";
    siteController.text = "Depok";
    warehouseController.text = "Depok";
    remarksController.text = "Remarks Example";
    super.onInit();
  }
}