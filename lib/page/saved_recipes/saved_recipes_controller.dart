import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:get/get.dart';

class SavedRecipesController extends GetxController {
  List<Map<String, String>> listData = [
    {"image": ImageConstant.product, "name": "Classic Greek Salad"},
    {"image": ImageConstant.product, "name": "Crunchy Nut Coleslaw"},
    {"image": ImageConstant.product, "name": "Crunchy Nut Coleslaw"},
    {"image": ImageConstant.product, "name": "Classic Greek Salad"},
    {"image": ImageConstant.product, "name": "Classic Greek Salad"},
  ];

  @override
  void onInit() async {
    super.onInit();
  }
}
