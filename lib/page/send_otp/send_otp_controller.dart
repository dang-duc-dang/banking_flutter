import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:food_flutter/constants/utils/error_util.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:get/get.dart';

class SendOtpController extends GetxController {
  final ApiClient client;
  SendOtpController({required this.client});
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final GlobalKey<FormState> keyValidate = GlobalKey();
  final isDisable = false.obs;
  onChange(String text) {
    isDisable.value = emailController.text.isNotEmpty;
  }

  bool isValid() {
    return isDisable.value && emailController.text.isNotEmpty;
  }

  sendOtp() async {
    final data = {
      "email": emailController.text,
    };
    if (keyValidate.currentState!.validate()) {
      EasyLoading.show(status: 'loading'.tr);
      await client.sendOtp(data).then((response) async {
        Get.toNamed(AppRoutes.otp,
            arguments: {"email": emailController.text, "type": "REGISTER"});
        EasyLoading.dismiss();
      }).catchError((error, trace) {
        EasyLoading.dismiss();
        ErrorUtil.catchError(error, trace);
      });
    }
  }

  @override
  void onInit() async {
    super.onInit();
  }
}