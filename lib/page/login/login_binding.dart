import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/page/login/login.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(client: ApiClient()));
  }
}
