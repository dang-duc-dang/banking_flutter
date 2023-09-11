import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/page/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(client: ApiClient()));
  }
}
