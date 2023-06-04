import 'package:flutter/material.dart';
import 'package:gais/data/model/stock_in/item_stock_in_atk_model.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';

class DetailItemStockInATKScreen extends StatefulWidget{
  const DetailItemStockInATKScreen({super.key, required this.item});

  final StockInATKDetailModel item;

  @override
  State<DetailItemStockInATKScreen> createState() => _DetailItemStockInATKScreenState();
}

class _DetailItemStockInATKScreenState extends State<DetailItemStockInATKScreen> {
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _itemController = TextEditingController();
  final TextEditingController _brandController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _uomController = TextEditingController();
  final TextEditingController _siteController = TextEditingController();
  final TextEditingController _warehouseController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  final storage = Get.find<StorageCore>();

  @override
  void initState() {
    super.initState();
    initData();
  }

  void initData()async{
    String companyName = await storage.readString(StorageCore.companyName);
    String siteName = await storage.readString(StorageCore.siteName);
    _companyController.text = companyName;
    _siteController.text = siteName ?? "";

    _itemController.text = widget.item.itemName ?? "-";
    _brandController.text = widget.item.brandName ?? "-";
    _quantityController.text = widget.item.qty.toString();
    _uomController.text = widget.item.uomName ?? "-";
    _warehouseController.text = widget.item.warehouseName ?? "-";
    _remarksController.text = widget.item.remarks ?? "-";
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Card(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
              horizontal: 32, vertical: 16),
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
                  CustomTextFormField(
                      readOnly: true,
                      controller: _warehouseController,
                      label: "Warehouse".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      readOnly: true,
                      controller: _itemController,
                      label: "Item".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      readOnly: true,
                      controller: _brandController,
                      label: "Brand".tr),
                  const SizedBox(
                    height: 8,
                  ),
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
      ),
    );
  }
}