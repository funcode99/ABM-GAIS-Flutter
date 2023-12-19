import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/data/storage_core.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DetailItemStockInATKScreen extends StatefulWidget{
  const DetailItemStockInATKScreen({super.key, required this.item});

  // final StockInATKDetailModel item;
  final Map<String, dynamic> item;

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

  List<TextEditingController> _listController = [];
  List<StockInATKDetailModel> _listDetail = [];

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

    _itemController.text = widget.item["itemName"] ?? "-";

    List<StockInATKDetailModel> list = List<StockInATKDetailModel>.from(widget.item["listDetail"]);

    // _brandController.text = widget.item.brandName ?? "-";
    // _quantityController.text = widget.item.qty.toString();
    // _uomController.text = widget.item.uomName ?? "-";
    // _warehouseController.text = widget.item.warehouseName ?? "-";
    // _remarksController.text = widget.item.remarks ?? "-";

    _brandController.text = list.first.brandName ?? "";
    _uomController.text = list.first.uomName ?? "";
    _remarksController.text = list.first.remarks ?? "";

    List<TextEditingController> listController = [];
    for (StockInATKDetailModel element in list) {
      TextEditingController textEditingController = TextEditingController();
      textEditingController.text = "${element.qty ?? 0}";

      listController.add(textEditingController);
    }

    setState(() {
      _listDetail = list;
      _listController = listController;
    });
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
                  CustomTextFormField(
                      readOnly: true,
                      controller: _itemController,
                      label: "Item".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  /*CustomTextFormField(
                      readOnly: true,
                      controller: _brandController,
                      label: "Brand".tr),
                  const SizedBox(
                    height: 8,
                  ),*/
                  /*CustomTextFormField(
                      readOnly: true,
                      controller: _quantityController,
                      label: "Quantity".tr),
                  const SizedBox(
                    height: 8,
                  ),*/
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
                  const SizedBox(
                    height: 16,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Quantity ATK Warehouse".tr,
                      style: formlabelTextStyle,
                    ),
                  ),
                  Divider(),
                  const SizedBox(
                    height: 16,
                  ),
                  ..._listDetail.mapIndexed((index, item){
                    return Column(
                      children: [
                        CustomTextFormField(
                            readOnly: true,
                            controller: _listController[index],
                            label: "${item.warehouseName}".tr),
                        const SizedBox(
                          height: 8,
                        ),
                      ],
                    );
                  }),
                  const SizedBox(
                    height: 32,
                  ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}