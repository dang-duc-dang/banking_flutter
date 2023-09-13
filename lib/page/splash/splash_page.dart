import 'package:flutter/material.dart';
import 'package:food_flutter/constants/app_constant.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/splash/splash_controller.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/utils/screen_util.dart';
import 'package:food_flutter/widget/button_with_icon.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 430, allowFontScaling: true)
      ..init(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            ImageConstant.logoSplash,
            fit: BoxFit.cover,
            width: Get.width,
            height: Get.height,
          ),
          Positioned(
            top: 80.h,
            right: 66,
            left: 66,
            child: Column(
              children: [
                Image.asset(
                  ImageConstant.icChef,
                  width: 79.w,
                  height: 79.h,
                ),
                SizedBox(
                  height: 14.h,
                ),
                Text(
                  "100K+ Premium Recipe",
                  style: Style().mediumTextBold.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 222.h,
                ),
                Text(
                  "Get Cooking",
                  textAlign: TextAlign.center,
                  style: Style().headerTitle.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Simple way to find Tasty Recipe",
                  style:
                      Style().normalTextRegular.copyWith(color: Colors.white),
                ),
                SizedBox(
                  height: 64.h,
                ),
                RadiusButton(
                  onTap: () {
                    Get.toNamed(AppRoutes.login);
                    // Get.offAndToNamed(AppRoutes.dashboard);
                  },
                  isFullWidth: true,
                  text: "Start Cooking",
                  textColor: Colors.white,
                  fontSize: 16.w,
                  fontFamily: Style.fontBold,
                  postIcon: Image.asset(
                    ImageConstant.arrowRight,
                    width: 20,
                    height: 20,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
