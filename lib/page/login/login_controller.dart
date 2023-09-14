import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_flutter/constants/app_constant.dart';
import 'package:food_flutter/constants/utils/error_util.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final ApiClient client;
  LoginController({required this.client});
  final TextEditingController emailController = TextEditingController();
  final FocusNode emailFocus = FocusNode();
  final TextEditingController passWordController = TextEditingController();
  final FocusNode passWordFocus = FocusNode();
  final showOld = false.obs;

  toggleShowPassword(RxBool show) {
    show.value = !show.value;
  }

  final GlobalKey<FormState> keyValidate = GlobalKey();

  resetFocus() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  login() async {
    resetFocus();
    final data = {
      "email": emailController.text,
      "password": passWordController.text
    };
    if (keyValidate.currentState!.validate()) {
      EasyLoading.show(status: 'loading'.tr);
      await client.login(data).then((response) async {
        Get.toNamed(AppRoutes.otp,
            arguments: {"email": emailController.text, "type": LOGIN});
        EasyLoading.dismiss();
      }).catchError((error, trace) {
        EasyLoading.dismiss();
        ErrorUtil.catchError(error, trace);
      });
    }
  }
}
