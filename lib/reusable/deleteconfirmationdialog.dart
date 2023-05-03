import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';

class DeleteConfirmationDialog extends StatelessWidget {
  const DeleteConfirmationDialog(
      {super.key, this.title, this.subtitle, required this.onDeletePressed});

  final String? title;
  final String? subtitle;
  final VoidCallback onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      onPressed: () => Get.back(),
                      icon: const Icon(
                        IconlyBold.close_square,
                        color: Colors.red,
                        size: 30,
                      ))
                ],
              ),
              const Center(
                child: Icon(
                  Icons.warning,
                  color: Colors.red,
                  size: 100,
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Text(
                title ?? "Are you sure want to delete this?".tr,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 16),
              ),
              const SizedBox(
                height: 16,
              ),
              Text(
                subtitle ??
                    "This will delete this data permanently, You cannot undo this action."
                        .tr,
                style: Theme.of(context).textTheme.subtitle1?.copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancel".tr)),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: onDeletePressed,
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text("Yes".tr),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
            ],
          )),
    );
  }
}
