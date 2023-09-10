import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final indexTab = 0.obs;
  late TabController tabController;
  var tabs = [
    AccountTab.recipe,
    AccountTab.videos,
    AccountTab.tag,
  ].obs;

  List<List<Map<String, String>>> listNoti = [
    [
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
    ],
    [
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
    ],
    [
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
      {
        "title": "New Recipe Alert!",
        "subTitle":
            "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum"
      },
    ],
  ];

  @override
  void onInit() async {
    super.onInit();
    tabs.value = [AccountTab.recipe, AccountTab.videos, AccountTab.tag];
    tabController = TabController(length: tabs.length, vsync: this);
  }
}
