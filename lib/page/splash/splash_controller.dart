import 'package:food_flutter/data/database_local/app_prefs.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final token = ''.obs;
  @override
  void onInit() {
    onToHome();
    super.onInit();
  }

  void onToHome() async {
    token.value = AppPrefs.accessToken ?? "";
    await Future.delayed(const Duration(seconds: 5));
    await 2.delay();

    if (token.value != "" && token.value.isNotEmpty) {
      Get.offNamed(AppRoutes.dashboard);
    } else {
      Get.offNamed(AppRoutes.login);
    }
  }
}
