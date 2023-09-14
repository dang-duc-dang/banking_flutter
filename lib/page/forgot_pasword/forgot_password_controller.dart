import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:food_flutter/constants/utils/error_util.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final ApiClient client;
  ForgotPasswordController({required this.client});
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final FocusNode confirmPasswordFocus = FocusNode();
  final TextEditingController passWordController = TextEditingController();
  final FocusNode passWordFocus = FocusNode();
  final showOld = false.obs;
  final email = ''.obs;
  toggleShowPassword(RxBool show) {
    show.value = !show.value;
  }

  @override
  onInit() {
    super.onInit();
    if (Get.arguments != null) {
      email.value = Get.arguments['email'] as String;
    }
  }

  final GlobalKey<FormState> keyValidate = GlobalKey();

  resetFocus() {
    FocusScope.of(Get.context!).requestFocus(FocusNode());
  }

  forgotPass() async {
    resetFocus();

    final data = {
      "email": email.value,
      "newPassword": confirmPasswordController.text
    };
    if (keyValidate.currentState!.validate()) {
      EasyLoading.show(status: 'loading'.tr);
      await client.resetPass(data).then((response) async {
        Get.offNamed(AppRoutes.login);
        EasyLoading.dismiss();
      }).catchError((error, trace) {
        EasyLoading.dismiss();
        ErrorUtil.catchError(error, trace);
      });
    }
  }
}
