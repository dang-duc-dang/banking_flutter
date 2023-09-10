import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/register/register.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:get/get.dart';

class BuildForm extends GetView<RegisterController> {
  const BuildForm({super.key});
  @override
  Widget build(BuildContext context) {
    return Form(
        key: controller.keyValidate,
        child: Column(
          children: [
            TitleDefaultTextField(
              // validator: AppValid.validatePasswordConfirm(
              //     controller.newPasswordController),
              width: double.infinity,
              radius: 12.w,
              controller: controller.nameController,
              focusNode: controller.nameFocus,
              title: 'Name '.tr,
              textStyle: Style().smallTextRegular,
              hintText: 'Enter name'.tr,
              innerPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.w),
              onChanged: (text) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            TitleDefaultTextField(
              // validator: AppValid.validatePasswordConfirm(
              //     controller.newPasswordController),
              width: double.infinity,
              radius: 12.w,
              controller: controller.emailController,
              focusNode: controller.emailFocus,
              title: 'Email '.tr,
              textStyle: Style().smallTextRegular,
              hintText: 'Enter email'.tr,
              innerPadding:
                  EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.w),
              onChanged: (text) {},
            ),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => TitleDefaultTextField(
                  // validator: AppValid.validatePassword(),
                  width: double.infinity,
                  radius: 12,
                  textStyle: Style().smallTextRegular,
                  controller: controller.passWordController,
                  focusNode: controller.passWordFocus,
                  title: 'Password'.tr,
                  hintText: 'Enter password'.tr,
                  obscureText: controller.showOld.value,
                  autoFillHints: const [AutofillHints.password],
                  innerPadding: EdgeInsets.only(
                      top: 16.w, bottom: 16.w, left: 20.w, right: 20.w),
                  suffix: GestureDetector(
                      onTap: () =>
                          controller.toggleShowPassword(controller.showOld),
                      child: Icon(
                        controller.showOld.value
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined,
                        size: 20,
                      )),
                  onChanged: (text) {},
                )),
            SizedBox(
              height: 20.h,
            ),
            Obx(() => TitleDefaultTextField(
                  // validator: AppValid.validatePasswordConfirm(
                  //     controller.newPasswordController),
                  width: double.infinity,
                  radius: 12.w,
                  controller: controller.passwordConfirmController,
                  focusNode: controller.passwordFocus,
                  title: 'Confirm Password'.tr,
                  textStyle: Style().smallTextRegular,
                  hintText: 'Retype Password'.tr,
                  obscureText: controller.showConfirm.value,
                  autoFillHints: const [AutofillHints.password],
                  innerPadding: EdgeInsets.only(
                      top: 16.w, bottom: 16.w, left: 20.w, right: 20.w),
                  suffix: GestureDetector(
                      onTap: () =>
                          controller.toggleShowPassword(controller.showConfirm),
                      child: Icon(
                        controller.showConfirm.value
                            ? Icons.remove_red_eye_sharp
                            : Icons.remove_red_eye_outlined,
                        size: 20,
                      )),
                  onChanged: (text) {},
                )),
          ],
        ));
  }
}