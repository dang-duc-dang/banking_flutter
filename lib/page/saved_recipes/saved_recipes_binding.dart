import 'package:food_flutter/page/home/home_controller.dart';
import 'package:food_flutter/page/saved_recipes/saved_recipes_controller.dart';
import 'package:get/get.dart';

class SavedRecipesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SavedRecipesController());
  }
}
