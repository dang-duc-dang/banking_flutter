import 'package:flutter/cupertino.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:get/get.dart';

class RecipeDetailController extends GetxController {
  Offset? selectedPosition;
  final indexTab = 0.obs;
  final indexStar = 0.0.obs;
  final GlobalKey menuButtonKey = GlobalKey();
  List<Map<String, String>> listMenu = [
    {"image": ImageConstant.share, "name": "share"},
    {"image": ImageConstant.icStart, "name": "Rate Recipe "},
    {"image": ImageConstant.message, "name": "Review"},
    {"image": ImageConstant.icBookMark, "name": "Unsave"},
  ];

  List<String> tab = ["Ingrident", "Procedure"];

  @override
  void onInit() async {
    super.onInit();
  }
}
