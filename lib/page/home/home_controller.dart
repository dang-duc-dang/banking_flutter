import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final TextEditingController searchController = TextEditingController();
  final FocusNode searchFocus = FocusNode();
  final indexTab = 0.obs;
  final star = 0.obs;
  final timer = 0.obs;
  final rate = 0.obs;
  late TabController tabController;
  final chooseeCategory = [].obs;
  var tabs = [
    HomeTab.all,
    HomeTab.writing,
    HomeTab.creative,
    HomeTab.business,
    HomeTab.socialMedia,
    HomeTab.developer,
    HomeTab.personal,
    HomeTab.other,
  ].obs;
  final showOld = false.obs;
  final checkBox = false.obs;
  final showConfirm = false.obs;
  toggleShowPassword(RxBool show) {
    show.value = !show.value;
  }

  List<String> listTime = [
    "All",
    "Newest",
    "Oldest",
    "Popularity",
  ].obs;
  List<String> listCategory = [
    "All",
    "Newest",
    "Oldest",
    "Popularity",
    "Chinese",
    "BreakFast",
    "Vegetables",
    "Local Dish",
  ].obs;

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
    tabs.value = [
      HomeTab.all,
      HomeTab.writing,
      HomeTab.creative,
      HomeTab.business,
      HomeTab.socialMedia,
      HomeTab.developer,
      HomeTab.personal,
      HomeTab.other,
    ];
    tabController = TabController(length: tabs.length, vsync: this);
  }
}
