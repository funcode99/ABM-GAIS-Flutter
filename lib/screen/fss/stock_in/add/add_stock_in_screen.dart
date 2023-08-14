import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/stock_in/stock_in_atk_detail_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/stock_in/add/add_stock_in_controller.dart';
import 'package:gais/screen/fss/stock_in/add/item_stock_in/add/add_item_stock_in_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddStockInATKScreen extends StatelessWidget {
  const AddStockInATKScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AddStockInATKController controller =
    Get.put(AddStockInATKController());

    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        leading: const CustomBackButton(),
        backgroundColor: whiteColor,
        title: Text("Stock In ATK".tr, style: appTitle),
        centerTitle: true,
        flexibleSpace: const TopBar(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Card(
          child: Form(
            key: controller.formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: () {
              controller.updateButton();
            },
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.companyController,
                      label: "Company".tr),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomTextFormField(
                      isRequired: true,
                      readOnly: true,
                      controller: controller.siteController,
                      label: "Site".tr),
                  const SizedBox(
                    height: 32,
                  ),
                  Text(
                    "Details Item".tr,
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  const Divider(
                    height: 20,
                    color: greyColor,
                  ),
                  Obx(
                        () =>
                        Column(
                          children: [
                            ...controller.mapDetail
                                .entries.mapIndexed((index, item) {
                                  Map<String, dynamic> element = item.value;
                                  List<StockInATKDetailModel> listDetail = List<StockInATKDetailModel>.from(element["listDetail"]);
                              return CommonAddItem(
                                number: "${index + 1}",
                                title: "${element["itemName"]}",
                                // subtitle: element.brandName ?? "",
                                subtitle: "",
                                content: Column(
                                  children: listDetail.mapIndexed((index, itemDetail) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                          child: Column(
                                            children: [
                                              Text(
                                                "ATK Warehouse".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                itemDetail.warehouseName ?? "-",
                                                style: listSubTitleTextStyle
                                                    .copyWith(
                                                    overflow: TextOverflow
                                                        .ellipsis
                                                ),
                                              )
                                            ],
                                          ),
                                        ),

                                        Column(
                                          children: [
                                            Text(
                                              "QTY".tr,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              "${itemDetail.qty}",
                                              style: listSubTitleTextStyle
                                                  .copyWith(
                                                  overflow: TextOverflow
                                                      .ellipsis
                                              ),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              "UOM".tr,
                                              style: listTitleTextStyle,
                                            ),
                                            Text(
                                              itemDetail.uomName ?? "-",
                                              style: listSubTitleTextStyle
                                                  .copyWith(
                                                  overflow: TextOverflow
                                                      .ellipsis
                                              ),
                                            )
                                          ],
                                        ),
                                        if(listDetail.length > 1) IconButton(onPressed: (){
                                          controller.removeDetailItem(element["idItem"], itemDetail);
                                        }, icon: const Icon(Icons.delete, color: redColor,))
                                      ],
                                    ),
                                  )).toList(),
                                ),
                                /*content: Text("TEST"),*/
                                action: [
                                  CustomIconButton(
                                      title: "Edit".tr,
                                      iconData: IconlyBold.edit,
                                      backgroundColor: successColor,
                                      onPressed: () async{
                                        final editedItems = await Get.to(()=>AddItemStockInATKScreen(item: item.value));
                                        if(editedItems!=null){
                                          controller.editItem(editedItems["idItem"], editedItems);
                                        }
                                      },
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    CustomIconButton(
                                      title: "Delete".tr,
                                      iconData: IconlyBold.delete,
                                      backgroundColor: redColor,
                                      onPressed: () {
                                        Get.dialog(DeleteConfirmationDialog(
                                          onDeletePressed: () {
                                            Get.close(1);
                                            controller.removeItem(element["idItem"]);
                                          },
                                        ));
                                      },
                                    )
                                ],
                                nominal: '',
                              );
                            })
                                .toList()
                          ],
                        ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        final addedItems =
                        await Get.to(() => const AddItemStockInATKScreen());
                        if (addedItems != null) {
                          controller.addItems(addedItems["idItem"], addedItems);
                        }
                      },
                      style:
                      ElevatedButton.styleFrom(backgroundColor: infoColor),
                      child: RichText(
                        text: TextSpan(
                            style: Theme
                                .of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w700),
                            children: [
                              const TextSpan(text: "+ "),
                              TextSpan(text: "Add Item".tr)
                            ]),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 64,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size(100, 40),
                        ),
                        child: Text("Cancel".tr),
                      ),
                      Obx(
                        () => ElevatedButton(
                          onPressed: controller.enableButton.value && controller.mapDetail.isNotEmpty
                              ? () {
                                  controller.saveData();
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                              backgroundColor: successColor),
                          child: Text("Save".tr),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 0),
    );
  }
}
