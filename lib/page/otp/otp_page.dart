import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/constants/app_constant.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/otp/otp_controller.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpPage extends GetView<OtpController> {
  const OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(() => OtpController(client: ApiClient()));
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(child: buildBody(context)),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(
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
                    style: Style()
                        .smallTextBold
                        .copyWith(fontSize: 16.sp, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10.w,
                  ),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'the_verification_code_has_been_sent_by_email'.tr,
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
                  Text(
                    "please_wait_within_28_detik_to_Resend".tr,
                    style: Style()
                        .smallTextSemiBold
                        .copyWith(fontSize: 10.sp, fontWeight: FontWeight.w600),
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
              if (controller.type.value == REGISTER) {
                Get.offNamed(AppRoutes.register);
              } else {
                controller.checkOtpLogin();
              }
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
    );
  }

  Widget _buildOtp(BuildContext context) {
    return TitleDefaultTextField(
      width: double.infinity,
      radius: 12.w,
      controller: controller.otpController,
      title: 'otp'.tr,
      textInputType: TextInputType.number,
      textStyle: Style().smallTextRegular,
      hintText: 'enter_otp'.tr,
      innerPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.w),
      onChanged: (otp) {
        controller.onChange(otp);
      },
    );
  }
}
