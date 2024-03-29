import 'package:food_flutter/page/home/home_controller.dart';
import 'package:food_flutter/page/notification/notification_controller.dart';
import 'package:get/get.dart';

class NotificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
