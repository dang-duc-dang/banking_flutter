import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:get/get.dart';
import 'otp_controller.dart';

class OtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtpController(client: ApiClient()));
  }
}
