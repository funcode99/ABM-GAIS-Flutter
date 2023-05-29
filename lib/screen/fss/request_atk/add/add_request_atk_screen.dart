import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_add_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/request_atk/add/add_request_atk_controller.dart';
import 'package:gais/screen/fss/request_atk/add/item_request_atk/add/add_item_request_atk_screen.dart';
import 'package:gais/screen/fss/request_atk/detail/detail_request_atk_screen.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class AddRequestATKScreen extends StatefulWidget {
  const AddRequestATKScreen({super.key});

  @override
  State<AddRequestATKScreen> createState() => _AddRequestATKScreenState();
}

class _AddRequestATKScreenState extends State<AddRequestATKScreen> {
  bool _isButtonEnabled = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddRequestATKController>(
        init: AddRequestATKController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: baseColor,
            appBar: AppBar(
              leading: const CustomBackButton(),
              backgroundColor: whiteColor,
              title: Text("ATK Request".tr, style: appTitle),
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
                    setState(() {
                      _isButtonEnabled =
                          controller.formKey.currentState!.validate();
                    });
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
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
                        const SizedBox(
                          height: 32,
                        ),
                        Text(
                          "Details Item",
                          style: Theme.of(context)
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
                        ...controller.listItem
                            .mapIndexed((index, element) => CommonAddItem(
                                  number: "${index + 1}",
                                  title: "${element.codeItem} -  ${element.itemName}",
                                  subtitle: "${element.brandName}",
                                  content: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 8),
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceAround,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                "Quantity".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                "${element.qty}",
                                                style: listSubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "UOM".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                "${element.uomName}",
                                                style: listSubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                "Warehouse".tr,
                                                style: listTitleTextStyle,
                                              ),
                                              Text(
                                                "${element.warehouseName}",
                                                style: listSubTitleTextStyle,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  action: [
                                  ],
                                ))
                            .toList(),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              final addedItem = await Get.to(
                                  () => const AddItemRequestATKScreen());
                              if (addedItem != null) {
                                controller.addItem(addedItem);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: infoColor),
                            child: RichText(
                              text: TextSpan(
                                  style: Theme.of(context)
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
                            ElevatedButton(
                              onPressed: _isButtonEnabled
                                  ? () {
                                      controller.saveData();
                                    }
                                  : null,
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: infoColor),
                              child: Text("Book".tr),
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
            bottomNavigationBar: const BottomBar(menu: 1),
          );
        });
  }
}
