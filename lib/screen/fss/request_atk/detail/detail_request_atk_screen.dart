import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/const/textstyle.dart';
import 'package:gais/data/model/request_atk/request_atk_model.dart';
import 'package:gais/reusable/bottombar.dart';
import 'package:gais/reusable/custombackbutton.dart';
import 'package:gais/reusable/customiconbutton.dart';
import 'package:gais/reusable/customstatuscontainer.dart';
import 'package:gais/reusable/dialog/deleteconfirmationdialog.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/reusable/list_item/common_list_item.dart';
import 'package:gais/reusable/topbar.dart';
import 'package:gais/screen/fss/request_atk/add/item_request_atk/add/add_item_request_atk_screen.dart';
import 'package:gais/screen/fss/request_atk/add/item_request_atk/detail/detail_item_request_atk_screen.dart';
import 'package:gais/screen/fss/request_atk/detail/detail_request_atk_controller.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class RequestATKDetailScreen extends StatelessWidget {
  const RequestATKDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RequestAtkModel? selectedItem;
    if (Get.arguments != null) {
      selectedItem = Get.arguments["item"];
    }

    final RequestATKDetailController controller =
        Get.put(RequestATKDetailController())..selectedItem(selectedItem);

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
            autovalidateMode: AutovalidateMode.always,
            onChanged: () {
              controller.updateEnableButton();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Obx(() {
                        if(controller.selectedItem.value.status==null){
                          return const SizedBox();
                        }
                        return CustomStatusContainer(
                          backgroundColor: greenColor,
                          status: "${controller.selectedItem.value.status}",
                        );
                      })
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Obx(() {
                    return Text(
                      controller.selectedItem.value.noAtkRequest ?? "-",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1
                          ?.copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    );
                  }),
                ),
                Obx(() {
                  if (controller.selectedItem.value.codeStatusDoc.toString() ==
                      "0") {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(
                          onPressed: () {
                            controller.updateOnEdit();
                          },
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(75, 30),
                          ),
                          child: controller.onEdit.value
                              ? Text("Cancel".tr)
                              : Text("Edit".tr),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        controller.onEdit.value
                            ? ElevatedButton(
                                onPressed: controller.enableButton.value
                                    ? () {
                                        controller.onEdit(false);
                                      }
                                    : null,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(75, 30),
                                    backgroundColor: successColor),
                                child: Text("Save".tr),
                              )
                            : ElevatedButton(
                                onPressed: () {
                                  controller.submitHeader();
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(75, 30),
                                    backgroundColor: orangeColor),
                                child: Text("Submit".tr),
                              ),
                      ],
                    );
                  }
                  return const SizedBox();
                }),
                const SizedBox(
                  height: 16,
                ),
                const Divider(
                  height: 20,
                  color: greyColor,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                          readOnly: true,
                          isRequired: true,
                          controller: controller.createdDateController,
                          label: "Created Date".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      CustomTextFormField(
                          readOnly: true,
                          isRequired: true,
                          controller: controller.createdByController,
                          label: "Created By".tr),
                      const SizedBox(
                        height: 8,
                      ),
                      Obx(() {
                        if (controller.selectedItem.value.notes != null) {
                          return CustomTextFormField(
                              readOnly: true,
                              controller: controller.rejectNoteController,
                              label: "Note".tr);
                        }
                        return const SizedBox();
                      }),
                      const SizedBox(
                        height: 64,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        blurRadius: 7,
                        spreadRadius: 1,
                        offset: const Offset(0, 4),
                      )
                    ],
                    color: infoColor,
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(8),
                        topLeft: Radius.circular(8)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.only(top: 10, left: 5),
                        width: 100,
                        height: 50,
                        decoration: const BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8),
                              topLeft: Radius.circular(8)),
                          gradient: LinearGradient(
                              stops: [0.1, 0],
                              colors: [blackColor, whiteColor]),
                        ),
                        child: const Text("Detail"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Obx(() {
                  return controller.onEdit.value
                      ? Container(
                          margin: const EdgeInsets.only(right: 8, bottom: 8),
                          alignment: Alignment.topRight,
                          child: SizedBox(
                            width: 100,
                            child: CustomIconButton(
                              title: "Add".tr,
                              iconData: IconlyBold.plus,
                              backgroundColor: infoColor,
                              onPressed: () async {
                                final addedItem = await Get.to(
                                    () => const AddItemRequestATKScreen());
                                if (addedItem != null) {
                                  //add item
                                  controller.addDetail(addedItem);
                                }
                              },
                            ),
                          ),
                        )
                      : const SizedBox();
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Obx(() {
                    return controller.listDetail.isEmpty
                        ? const SizedBox()
                        : ListView(
                            shrinkWrap: true,
                            physics: const ScrollPhysics(),
                            children: [
                              ...controller.listDetail
                                  .mapIndexed((index, item) => CommonListItem(
                                        number: "${index + 1}",
                                        title: item.itemName,
                                        subtitle: item.brandName ?? "-",
                                        action: controller.onEdit.value
                                            ? [
                                                CustomIconButton(
                                                  title: "Edit".tr,
                                                  iconData: IconlyBold.edit,
                                                  backgroundColor: successColor,
                                                  onPressed: () async {
                                                    final updatedItem =
                                                        await Get.to(() =>
                                                            AddItemRequestATKScreen(
                                                                item: item));
                                                    if (updatedItem != null) {
                                                      //add item
                                                      controller.updateDetail(
                                                          updatedItem);
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
                                                    Get.dialog(
                                                        DeleteConfirmationDialog(
                                                      onDeletePressed: () {
                                                        Get.close(1);
                                                        controller.deleteDetail(item);
                                                      },
                                                    ));
                                                  },
                                                )
                                              ]
                                            : [],
                                        content: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 8, vertical: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Quantity".tr,
                                                      style: listTitleTextStyle,
                                                    ),
                                                    Text(
                                                      "${item.qty}",
                                                      style: listSubTitleTextStyle
                                                          .copyWith(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "UOM".tr,
                                                      style: listTitleTextStyle,
                                                    ),
                                                    Text(
                                                      item.uomName ?? "-",
                                                      style: listSubTitleTextStyle
                                                          .copyWith(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    Text(
                                                      "Warehouse".tr,
                                                      style: listTitleTextStyle,
                                                    ),
                                                    Text(
                                                      item.warehouseName ?? "-",
                                                      style: listSubTitleTextStyle
                                                          .copyWith(
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () {
                                          Get.dialog(DetailItemRequestATKScreen(
                                              detailItem: item,
                                              header: controller
                                                  .selectedItem.value));
                                        },
                                      ))
                            ],
                          );
                  }),
                ),
                const SizedBox(
                  height: 32,
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const BottomBar(menu: 1),
    );
  }
}
