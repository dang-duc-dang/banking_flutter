import 'package:flutter/cupertino.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/constants/utils/app_valid.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/page/send_otp/send_otp_controller.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_custom_header.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/src/rating_bar.dart';

class SendOtpPage extends GetView<SendOtpController> {
  const SendOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SendOtpController(client: ApiClient()));
    return SafeArea(
      child: Obx(
        () => Scaffold(
            backgroundColor: Colors.white,
            resizeToAvoidBottomInset: true,
            appBar: CustomHeaderWidget(isShowBack: true),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(30.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "hello".tr,
                            style: Style().headerTextBold,
                          ),
                          Text(
                            "please_input_the_email".tr,
                            style: Style().largeTextRegular,
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          Form(
                            key: controller.keyValidate,
                            child: TitleDefaultTextField(
                              validator: AppValid.validateEmail(),
                              width: double.infinity,
                              radius: 12.w,
                              controller: controller.emailController,
                              focusNode: controller.emailFocus,
                              title: 'email'.tr,
                              textStyle: Style().smallTextRegular,
                              hintText: 'enter_email'.tr,
                              innerPadding: EdgeInsets.symmetric(
                                  horizontal: 20.w, vertical: 19.w),
                              onChanged: (email) {
                                controller.onChange(email);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                RadiusButton(
                  onTap: () {
                    controller.onSubmit();
                  },
                  isFullWidth: true,
                  outsidePadding: EdgeInsets.all(30.w),
                  isDisable: !controller.isValid(),
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
            )),
      ),
    );
  }
}
