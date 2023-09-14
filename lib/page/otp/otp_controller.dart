import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_flutter/constants/app_constant.dart';
import 'package:food_flutter/constants/utils/app_export.dart';
import 'package:food_flutter/constants/utils/error_util.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/data/database_local/app_prefs.dart';
import 'package:food_flutter/data/models/user/user_model.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/widget/dialog/dialog_util.dart';

class OtpController extends GetxController {
  ApiClient client;
  OtpController({
    required this.client,
  });
  TextEditingController otpController = TextEditingController();
  final email = ''.obs;
  final type = ''.obs;
  final isDisable = true.obs;
  final countdown = 30.obs;
  late Timer timer;
  @override
  onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      email.value = Get.arguments['email'] as String;
      type.value = Get.arguments['type'] as String;
    }
    startCountdown();
  }

  void startCountdown() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown > 0) {
        countdown.value--;
      } else {
        timer.cancel();
      }
    });
  }

  onChange(String text) {
    isDisable.value = otpController.text.isNotEmpty;
  }

  bool isValid() {
    return isDisable.value && otpController.text.isNotEmpty;
  }

  onSubmit() {
    if (type.value == REGISTER) {
      checkOtpRegister();
    } else if (type.value == FORGOTPASS) {
      checkOtpForgot();
    } else if (type.value == LOGIN) {
      checkOtpLogin();
    }
  }

  checkOtpLogin() async {
    final data = {
      "email": email.value.toLowerCase(),
      "code": otpController.text
    };
    EasyLoading.show(status: 'loading'.tr);
    await client.verifyOtpLogin(data).then((response) async {
      UserModel userData = UserModel.fromJson(response.data['data']['user']);
      String accessToken = response.data['data']['access_token'];
      AppPrefs.accessToken = accessToken;
      AppPrefs.userData = userData;
      userData.save();
      EasyLoading.dismiss();
      DialogUtil.showSuccessMessage('Đăng nhập thành công');
      Get.offNamed(AppRoutes.dashboard);
    }).catchError((error, trace) {
      ErrorUtil.catchError(error, trace);
      EasyLoading.dismiss();
    });
  }

  checkOtpRegister() async {
    final data = {"email": email.value, "code": int.parse(otpController.text)};
    EasyLoading.show(status: 'loading'.tr);
    await client.verifyOtp(data).then((response) async {
      EasyLoading.dismiss();
      DialogUtil.showSuccessMessage('Send otp success');

      Get.offNamed(AppRoutes.register, arguments: {'email': email.value});
    }).catchError((error, trace) {
      ErrorUtil.catchError(error, trace);
      EasyLoading.dismiss();
    });
  }

  checkOtpForgot() async {
    final data = {"email": email.value, "code": int.parse(otpController.text)};
    EasyLoading.show(status: 'loading'.tr);
    await client.otpForgot(data).then((response) async {
      EasyLoading.dismiss();
      DialogUtil.showSuccessMessage('Send otp success');

      Get.offNamed(AppRoutes.forgotPass, arguments: {'email': email.value});
    }).catchError((error, trace) {
      ErrorUtil.catchError(error, trace);
      EasyLoading.dismiss();
    });
  }
}
