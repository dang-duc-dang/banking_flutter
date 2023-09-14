import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:food_flutter/data/apiClient/api_client.dart';
import 'package:food_flutter/data/database_local/app_prefs.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final ApiClient client;

  ProfileController({required this.client});
  final indexTab = 0.obs;
  late TabController tabController;
  final GlobalKey menuButtonKey = GlobalKey();
  var tabs = [
    AccountTab.recipe,
    AccountTab.videos,
    AccountTab.tag,
  ].obs;

  void logout() async {
    // await client.signOut().then((response) {
    //   DialogUtil.showSuccessMessage('Đăng xuất thành công');
    // }).catchError((error, trace) {
    //   ErrorUtil.catchError(error, trace);
    // });

    await Get.offAndToNamed(AppRoutes.splash);
    await AppPrefs().clear();
  }

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
