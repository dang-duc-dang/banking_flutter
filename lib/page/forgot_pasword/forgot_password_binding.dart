import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/page/forgot_pasword/forgot_password_controller.dart';
import 'package:get/get.dart';

class ForgotPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController(client: ApiClient()));
  }
}
