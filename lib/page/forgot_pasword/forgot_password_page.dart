import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/constants/utils/app_valid.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/forgot_pasword/forgot_password_controller.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:get/get.dart';

class ForgotPasswordPage extends GetView<ForgotPasswordController> {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: controller.keyValidate,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 40.h,
                          ),
                          GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: const Icon(Icons.arrow_back_rounded)),
                          SizedBox(
                            height: 20.h,
                          ),
                          Text(
                            "${"forgot_password".tr},",
                            style: Style().headerTextBold,
                          ),
                          Text(
                            '${"please_enter_a_new_password".tr}!',
                            style: Style().largeTextRegular,
                          ),
                          SizedBox(
                            height: 57.h,
                          ),
                          Obx(() => TitleDefaultTextField(
                                validator: AppValid.validatePassword(),
                                width: double.infinity,
                                radius: 12,
                                textStyle: Style().smallTextRegular,
                                controller: controller.passWordController,
                                focusNode: controller.passWordFocus,
                                title: 'new_password'.tr,
                                hintText: 'enter_password'.tr,
                                obscureText: controller.showOld.value,
                                autoFillHints: const [AutofillHints.password],
                                innerPadding: EdgeInsets.only(
                                    top: 16.w,
                                    bottom: 16.w,
                                    left: 20.w,
                                    right: 20.w),
                                suffix: GestureDetector(
                                    onTap: () => controller
                                        .toggleShowPassword(controller.showOld),
                                    child: Icon(
                                      controller.showOld.value
                                          ? Icons.remove_red_eye_sharp
                                          : Icons.remove_red_eye_outlined,
                                      size: 20,
                                    )),
                                onChanged: (text) {},
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Obx(() => TitleDefaultTextField(
                                validator: AppValid.validatePasswordConfirm(
                                    controller.passWordController),
                                width: double.infinity,
                                radius: 12,
                                textStyle: Style().smallTextRegular,
                                controller:
                                    controller.confirmPasswordController,
                                focusNode: controller.confirmPasswordFocus,
                                title: 'confirm_password'.tr,
                                hintText: 'enter_password'.tr,
                                obscureText: controller.showOld.value,
                                autoFillHints: const [AutofillHints.password],
                                innerPadding: EdgeInsets.only(
                                    top: 16.w,
                                    bottom: 16.w,
                                    left: 20.w,
                                    right: 20.w),
                                suffix: GestureDetector(
                                    onTap: () => controller
                                        .toggleShowPassword(controller.showOld),
                                    child: Icon(
                                      controller.showOld.value
                                          ? Icons.remove_red_eye_sharp
                                          : Icons.remove_red_eye_outlined,
                                      size: 20,
                                    )),
                                onChanged: (text) {},
                              )),
                        ]),
                  ),
                ),
              ),
            ),
            RadiusButton(
              outsidePadding: EdgeInsets.all(30.h),
              onTap: () {
                controller.forgotPass();
              },
              isFullWidth: true,
              maxWidth: Get.width,
              text: "next".tr,
              textColor: Colors.white,
              fontSize: 16.w,
              innerPadding: EdgeInsets.symmetric(vertical: 18.w),
              fontFamily: Style.fontBold,
              postIcon: Image.asset(
                ImageConstant.arrowRight,
                width: 20,
                height: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
