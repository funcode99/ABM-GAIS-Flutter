import 'package:flutter/material.dart';
import 'package:gais/data/model/cash_advance/item_cash_advance_non_travel_model.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';

class DetailItemCashAdvanceNonTravelScreen extends StatefulWidget{
  const DetailItemCashAdvanceNonTravelScreen({super.key, required this.item});

  final ItemCashAdvanceNonTravelModel item;

  @override
  State<DetailItemCashAdvanceNonTravelScreen> createState() => _DetailItemCashAdvanceNonTravelScreenState();
}

class _DetailItemCashAdvanceNonTravelScreenState extends State<DetailItemCashAdvanceNonTravelScreen> {
  final TextEditingController _itemCenterController = TextEditingController();
  final TextEditingController _costCenterController = TextEditingController();
  final TextEditingController _nominalController = TextEditingController();
  final TextEditingController _remarksController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _itemCenterController.text = widget.item.item;
    _costCenterController.text = widget.item.costCenter;
    _nominalController.text = widget.item.nominal;
    _remarksController.text = widget.item.remarks;
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
              const SizedBox(
                height: 16,
              ),
              CustomTextFormField(
                  readOnly: true,
                  controller: _itemCenterController,
                  label: "Item".tr),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                  readOnly: true,
                  controller: _costCenterController,
                  label: "Cost Center".tr),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                  readOnly: true,
                  controller: _nominalController,
                  label: "Nominal".tr),
              const SizedBox(
                height: 8,
              ),
              CustomTextFormField(
                  multiLine: true,
                  controller: _remarksController,
                  label: "Remarks".tr),
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