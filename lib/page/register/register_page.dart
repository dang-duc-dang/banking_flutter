import 'package:flutter/cupertino.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/login/login.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/page/register/build_form.dart';
import 'package:food_flutter/page/register/register_controller.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:get/get.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      "Create an account",
                      style: Style().largeTextBold,
                    ),
                    Text(
                      "Let’s help you set up your account,",
                      style: Style().smallerTextRegular,
                    ),
                    Text(
                      "won’t take long.",
                      style: Style().smallerTextRegular,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const BuildForm(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.checkBox.value =
                                !controller.checkBox.value;
                          },
                          child: Icon(
                            controller.checkBox.value == false
                                ? Icons.check_box_outline_blank
                                : Icons.check_box,
                            size: 14,
                            color: Style.secondary100,
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text("Accept terms & Condition",
                            style: Style().smallerTextRegular.copyWith(
                                  color: Style.secondary100,
                                )),
                      ],
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    RadiusButton(
                      onTap: () {
                        // Get.toNamed(AppRoutes.login);
                      },
                      isFullWidth: true,
                      maxWidth: Get.width,
                      text: "Sign Up",
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
                        Text("Or Sign in With",
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
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already a member? ",
                          style: Style().smallerTextSemiBold,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: Text("Sign in",
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
