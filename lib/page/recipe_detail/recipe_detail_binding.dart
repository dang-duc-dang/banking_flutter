import 'package:food_flutter/page/recipe_detail/recipe_detail_controller.dart';
import 'package:get/get.dart';

class RecipeDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecipeDetailController());
  }
}
