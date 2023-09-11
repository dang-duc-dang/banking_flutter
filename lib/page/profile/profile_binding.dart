import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/page/home/home_controller.dart';
import 'package:food_flutter/page/notification/notification_controller.dart';
import 'package:food_flutter/page/profile/profile_controller.dart';
import 'package:get/get.dart';

class ProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController(client: ApiClient()));
  }
}
