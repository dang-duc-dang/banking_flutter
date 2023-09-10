import 'package:food_flutter/page/login/login.dart';
import 'package:food_flutter/page/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
