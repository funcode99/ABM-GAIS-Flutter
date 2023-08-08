import 'package:flutter/material.dart';
import 'package:gais/const/color.dart';
import 'package:gais/reusable/dialog/change_car_controller.dart';
import 'package:gais/reusable/form/custom_dropdown_form_field.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class ChangeCarDialog extends StatelessWidget {
  const ChangeCarDialog({super.key, this.idSite});

  final int? idSite;

  @override
  Widget build(BuildContext context) {
    final ChangeCarController controller = Get.put(ChangeCarController())
      ..idSite(idSite);

    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "Change Car".tr,
                    style: Theme
                        .of(context)
                        .textTheme
                        .subtitle1
                        ?.copyWith(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(IconlyBold.close_square),
                  color: Colors.red,
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Obx(() {
              return CustomDropDownFormField(
                items: controller.listCar
                    .map((e) => DropdownMenuItem(
                  value: e.id.toString(),
                  child: Text("${e.carName} - ${e.plate}"),
                ))
                    .toList(),
                label: "Select Car",
                isRequired: true,
                value: controller.selectedCar.value?.id.toString(),
                onChanged: (value) {
                  controller.onChangeSelectedCar(value.toString());

                },
              );
            }),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("Cancel".tr))),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(result: controller.selectCar());
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: infoColor),
                    child: Text("Change".tr),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
