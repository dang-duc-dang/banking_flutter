import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/page/send_otp/send_otp_controller.dart';
import 'package:get/get.dart';

class SendOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendOtpController(client: ApiClient()));
  }
}
