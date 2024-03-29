import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/otp/otp_controller.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(child: buildBody(context)),
    );
  }

  Widget buildBody(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(CupertinoIcons.clear)),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 60.w,
                    ),
                    Image.asset(
                      ImageConstant.email,
                      width: 50.w,
                      height: 50.h,
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Text(
                      'verification'.tr,
                      style: Style().smallTextBold.copyWith(
                          fontSize: 16.sp, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 10.w,
                    ),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'the_verification_code_has_been_sent_by_email'
                                .tr,
                            style: Style().smallTextSemiBold.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: controller.email.toString(),
                            style: Style().smallTextSemiBold.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.w),
                    _buildOtp(context),
                    SizedBox(height: 30.w),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: 'please_wait_within'.tr,
                            style: Style().smallTextSemiBold.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: ' ${controller.countdown.value.toString()} ',
                            style: Style().smallTextSemiBold.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w800,
                                color: Colors.black),
                          ),
                          TextSpan(
                            text: 'detik_to_Resend'.tr,
                            style: Style().smallTextSemiBold.copyWith(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30.w),
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => RadiusButton(
              onTap: () {
                controller.onSubmit();
              },
              isFullWidth: true,
              outsidePadding: EdgeInsets.all(30.w),
              isDisable: !controller.isValid(),
              maxWidth: Get.width,
              text: "Next",
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
          ),
        ],
      ),
    );
  }

  Widget _buildOtp(BuildContext context) {
    return Obx(
      () => PinCodeTextField(
        controller: controller.otpController,
        autoFocus: true,
        enabled: controller.countdown.value != 0,
        keyboardType: TextInputType.number,
        appContext: context,
        length: 6,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          disabledColor: Style.gray4,
          fieldOuterPadding: EdgeInsets.only(right: 5.w),
          borderWidth: 1,
          activeColor: Style.primary100,
          activeFillColor: Colors.white,
          selectedColor: Style.primary100,
          selectedFillColor: Colors.white,
          inactiveColor: Style.gray4,
          inactiveFillColor: Colors.white,
          shape: PinCodeFieldShape.box,
          fieldHeight: 55.w,
          fieldWidth: 55.w,
        ),
        animationDuration: const Duration(milliseconds: 300),
        textStyle: Style().smallTextBold,
        enableActiveFill: true,
        onChanged: (value) {
          controller.onChange(value);
        },
        onCompleted: (v) {
          controller.onSubmit();
        },
        beforeTextPaste: (text) => true,
      ),
    );
  }
}
