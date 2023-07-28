import 'package:flutter/material.dart';
import 'package:gais/data/model/cash_advance/cash_advance_detail_model.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/util/ext/int_ext.dart';
import 'package:gais/util/ext/string_ext.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DetailItemCashAdvanceNonTravelScreen extends StatefulWidget{
  const DetailItemCashAdvanceNonTravelScreen({super.key, required this.item});

  final CashAdvanceDetailModel item;

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
    _itemCenterController.text = "${widget.item.itemName}";
    _costCenterController.text = "${widget.item.costCenterName ?? ""} - ${widget.item.costCenterName ?? ""}";
    _nominalController.text = "${widget.item.nominal?.toInt().toCurrency()}";
    _remarksController.text = "${widget.item.remarks}";
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
                  }, icon: const Icon(IconlyBold.close_square))
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
                      readOnly: true,
                      controller: _remarksController,
                      label: "Remarks".tr),
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