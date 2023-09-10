import 'package:flutter/cupertino.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController {
  TextEditingController commentController = TextEditingController();
  FocusNode commentFocus = FocusNode();

  List<Map<String, String>> listMenu = [
    {"image": ImageConstant.share, "name": "share"},
    {"image": ImageConstant.icStart, "name": "Rate Recipe "},
    {"image": ImageConstant.message, "name": "Review"},
    {"image": ImageConstant.icBookMark, "name": "Unsave"},
    {"image": ImageConstant.icBookMark, "name": "Unsave"},
    {"image": ImageConstant.icBookMark, "name": "Unsave"},
    {"image": ImageConstant.icBookMark, "name": "Unsave"},
  ];

  List<String> tab = ["Ingrident", "Procedure"];

  @override
  void onInit() async {
    super.onInit();
  }
}
