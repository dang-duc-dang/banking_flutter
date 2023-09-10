import 'package:flutter/material.dart';
import 'package:food_flutter/page/home/home_page.dart';
import 'package:food_flutter/page/notification/notification_page.dart';
import 'package:food_flutter/page/profile/profile_page.dart';
import 'package:food_flutter/page/saved_recipes/saved_recipes_page.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentTab = 0.obs;
  final iconList = [
    Icons.home_rounded,
    Icons.bookmark,
    Icons.notifications_on_sharp,
    Icons.supervisor_account_sharp,
  ];
  List<Widget> children = [
    const HomePage(),
    const SavedRecipesPage(),
    const NotificationPage(),
    const ProfilePage()
  ];

  void switchTab(index) {
    currentTab.value = index;
  }

  Widget get currentPage => children[currentTab.value];
}
