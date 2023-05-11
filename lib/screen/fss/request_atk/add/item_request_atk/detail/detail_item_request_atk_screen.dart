import 'package:flutter/material.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:gais/data/model/request_atk/item_request_atk_model.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';

class DetailItemRequestATKScreen extends StatefulWidget{
  const DetailItemRequestATKScreen({super.key, required this.item});

  final ItemRequestATKModel item;

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
    _companyController.text = widget.item.company;
    _itemController.text = widget.item.item;
    _brandController.text = widget.item.brand;
    _quantityController.text = widget.item.quantity.toString();
    _uomController.text = widget.item.uom;
    _siteController.text = widget.item.site;
    _warehouseController.text = widget.item.warehouse;
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