import 'package:flutter/material.dart';
import 'package:gais/data/model/request_atk/request_atk_detail_model.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DetailItemRequestATKScreen extends StatefulWidget{
  const DetailItemRequestATKScreen({super.key, required this.detailItem, required this.header});


  final RequestAtkModel header;
  final RequestATKDetailModel detailItem;

  @override
  State<DetailItemRequestATKScreen> createState() => _DetailItemRequestATKScreenState();
}

class _DetailItemRequestATKScreenState extends State<DetailItemRequestATKScreen> {
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _uomController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  final TextEditingController _warehouseController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _companyController.text = "${widget.header.companyName}";
    _itemController.text = "${widget.detailItem.itemName}";
    _brandController.text = "${widget.detailItem.brandName}";
    _quantityController.text ="${widget.detailItem.qty}";
    _uomController.text = "${widget.detailItem.uomName}";
    _siteController.text = "${widget.header.siteName}";
    _warehouseController.text = "${widget.detailItem.warehouseName}";
    _remarksController.text = widget.detailItem.remarksDetail ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){
                    Get.back();
                  }, icon: Icon(IconlyBold.close_square))
                ],
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: 32, vertical: 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      CustomTextFormField(
                          readOnly: true,
                          controller: _companyController,
                          label: "Company".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          readOnly: true,
                          controller: _siteController,
                          label: "Site".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      /*CustomTextFormField(
                          readOnly: true,
                          controller: _warehouseController,
                          label: "Warehouse".tr),
                      const SizedBox(
                        height: 8,
                      ),*/
                      CustomTextFormField(
                          readOnly: true,
                          controller: _itemController,
                          label: "Item".tr),
                      const SizedBox(
                        height: 8,
                      ),
                     /* CustomTextFormField(
                          readOnly: true,
                          controller: _brandController,
                          label: "Brand".tr),
                      const SizedBox(
                        height: 8,
                      ),*/
                      CustomTextFormField(
                          readOnly: true,
                          controller: _quantityController,
                          label: "Quantity".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          readOnly: true,
                          controller: _uomController,
                          label: "UOM".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          readOnly: true,
                          multiLine: true,
                          controller: _remarksController,
                          label: "Remarks".tr),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}