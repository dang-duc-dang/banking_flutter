import 'package:food_flutter/page/review/review_controller.dart';
import 'package:get/get.dart';

class ReviewBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReviewController());
  }
}
