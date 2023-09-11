import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
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
                      "create_an_account".tr,
                      style: Style().largeTextBold,
                    ),
                    Text(
                      "let’s_help_you_set_up_your_account".tr,
                      style: Style().smallerTextRegular,
                    ),
                    Text(
                      "won’t_take_long".tr,
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
                            size: 16,
                            color: Style.secondary100,
                          ),
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text("Accept_terms_condition".tr,
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
                        controller.onRegister();
                      },
                      isFullWidth: true,
                      maxWidth: Get.width,
                      isDisable: controller.checkBox.value == false,
                      text: "sign_up".tr,
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
                        Text("or_sign_in_With".tr,
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
                          '${"already_a_member".tr} ',
                          style: Style().smallerTextSemiBold,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(AppRoutes.login);
                          },
                          child: Text("sign_in".tr,
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
