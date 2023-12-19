import 'package:flutter/material.dart';
import 'package:gais/reusable/form/customtextformfield.dart';
import 'package:gais/screen/profil/myprofile/my_profile_screen/my_profile_controller.dart';
import 'package:get/get.dart';

class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final MyProfileController controller =
    Get.put(MyProfileController());

    return Container(
      margin: const EdgeInsets.only(top: 10, left: 16,right: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.nameController,
                label: "Name".tr),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.snController,
                label: "SN".tr),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.phoneController,
                label: "Phone Number".tr),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.dobController,
                label: "DOB".tr),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.genderController,
                label: "Gender".tr),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.emailController,
                label: "Email".tr),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.positionController,
                label: "Position Title".tr),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.companyController,
                label: "Company".tr),
            const SizedBox(
              height: 8,
            ),
            CustomTextFormField(
                readOnly: true,
                onTap: (){},
                controller: controller.locationController,
                label: "Location".tr),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }

}