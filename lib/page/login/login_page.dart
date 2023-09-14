import 'package:food_flutter/constants/app_constant.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/constants/utils/app_valid.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Form(
            key: controller.keyValidate,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 94.h,
                    ),
                    Text(
                      "Hello,",
                      style: Style().headerTextBold,
                    ),
                    Text(
                      "Welcome Back!",
                      style: Style().largeTextRegular,
                    ),
                    SizedBox(
                      height: 57.h,
                    ),
                    TitleDefaultTextField(
                      validator: AppValid.validateEmail(),
                      width: double.infinity,
                      radius: 12.w,
                      controller: controller.emailController,
                      focusNode: controller.emailFocus,
                      title: 'Email '.tr,
                      textStyle: Style().smallTextRegular,
                      hintText: 'Enter email'.tr,
                      innerPadding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 19.w),
                      onChanged: (text) {},
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Obx(() => TitleDefaultTextField(
                          validator: AppValid.validatePassword(),
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
                      height: 20.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.sendOtp,
                            arguments: {'type': FORGOTPASS});
                      },
                      child: Text("Forgot Password?",
                          style: Style().smallerTextRegular.copyWith(
                                color: Style.secondary100,
                              )),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    RadiusButton(
                      onTap: () {
                        controller.login();
                      },
                      isFullWidth: true,
                      maxWidth: Get.width,
                      text: "Sign In",
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
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        const Expanded(child: Divider()),
                        Text("Sign Up ",
                            style: Style().smallerTextSemiBold.copyWith(
                                  color: Style.gray4,
                                )),
                        const Expanded(child: Divider()),
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Style.gray4,
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: Image.asset(
                            ImageConstant.google,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                        SizedBox(
                          width: 25.w,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.sp),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Style.gray4,
                                spreadRadius: 3,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 0), // changes position of shadow
                              ),
                            ],
                          ),
                          padding: EdgeInsets.all(10.w),
                          child: Image.asset(
                            ImageConstant.facebook,
                            width: 24.w,
                            height: 24.h,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 55.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don’t have an account? ",
                          style: Style().smallerTextSemiBold,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.sendOtp,
                                arguments: {'type': REGISTER});
                          },
                          child: Text("Sign up",
                              style: Style().smallerTextSemiBold.copyWith(
                                    color: Style.secondary100,
                                  )),
                        )
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
