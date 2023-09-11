import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_flutter/constants/utils/app_export.dart';
import 'package:food_flutter/constants/utils/error_util.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/data/database_local/app_prefs.dart';
import 'package:food_flutter/data/models/user/user_model.dart';
import 'package:food_flutter/page/otp/widgets/widget_countdown_timer.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/widget/dialog/dialog_util.dart';

class OtpController extends GetxController {
  ApiClient client;
  OtpController({
    required this.client,
  });
  TextEditingController otpController = TextEditingController();
  GlobalKey<WidgetCountDownTimerState> keyCountDown = GlobalKey();
  final email = ''.obs;
  final type = ''.obs;
  final isDisable = true.obs;
  @override
  onInit() {
    super.onInit();
    if (Get.arguments != null) {
      email.value = Get.arguments['email'] as String;
      type.value = Get.arguments['type'] as String;
    }
  }

  onChange(String text) {
    isDisable.value = otpController.text.isNotEmpty;
  }

  bool isValid() {
    return isDisable.value && otpController.text.isNotEmpty;
  }

  checkOtpLogin() async {
    final data = {"email": email.value, "code": otpController.text};
    EasyLoading.show(status: 'loading'.tr);
    await client.verifyOtpLogin(data).then((response) async {
      UserModel userData = UserModel.fromJson(response.data['data']['user']);
      print('${userData}userData');
      String accessToken = response.data['data']['access_token'];
      AppPrefs.accessToken = accessToken;
      AppPrefs.userData = userData;
      print("TOKEN $accessToken , userData $userData ");
      userData.save();
      EasyLoading.dismiss();
      DialogUtil.showSuccessMessage('Đăng nhập thành công');
      Get.offNamed(AppRoutes.dashboard);
    }).catchError((error, trace) {
      EasyLoading.dismiss();
      ErrorUtil.catchError(error, trace);
    });
  }

  checkOtpRegister() async {
    final data = {"email": email.value, "code": otpController.text};
    EasyLoading.show(status: 'loading'.tr);
    await client.verifyOtp(data).then((response) async {
      EasyLoading.dismiss();
      DialogUtil.showSuccessMessage('Đăng nhập thành công');

      Get.offNamed(AppRoutes.register);
    }).catchError((error, trace) {
      EasyLoading.dismiss();
      ErrorUtil.catchError(error, trace);
    });
  }
}
