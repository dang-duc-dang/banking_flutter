import 'package:food_flutter/constants/app_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/dashboard/dashboard_controller.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/utils/screen_util.dart';
import 'package:food_flutter/widget/animatedBottomNavigationBar/animated_bottom_navigation_bar.dart';
import 'package:food_flutter/widget/indexed_transition_switcher.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: BASE_WIDTH, allowFontScaling: true)
      ..init(context);
    return Material(
      child: WillPopScope(
          onWillPop: () async {
            return true;
          },
          child: Obx(
            () => Scaffold(
              body: IndexedTransitionSwitcher(
                transitionBuilder: (
                  Widget child,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                ) {
                  return FadeThroughTransition(
                    fillColor: Colors.transparent,
                    animation: animation,
                    secondaryAnimation: secondaryAnimation,
                    child: child,
                  );
                },
                index: controller.currentTab.value,
                children: controller.children,
              ),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Style.primary100,
                onPressed: () {},
                child: Icon(Icons.add),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: AnimatedBottomNavigationBar(
                activeIndex: controller.currentTab.value,
                backgroundColor: Colors.white,
                activeColor: Style.primary100,
                inactiveColor: Colors.grey,
                splashColor: Style.primary100,
                splashSpeedInMilliseconds: 300,
                gapLocation: GapLocation.center,
                onTap: controller.switchTab,
                icons: controller.iconList,
              ),
            ),
          )),
    );
  }

  List<Widget> _buildBottomNavBar(BuildContext context, bool isActive) {
    return [
      _buildBottomNavigationBarItem(
        context,
        'Chat'.tr,
        Icons.home,
        0,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'AI Assistants'.tr,
        Icons.star_border,
        1,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'History'.tr,
        Icons.search,
        2,
        isActive,
      ),
      _buildBottomNavigationBarItem(
        context,
        'Account'.tr,
        Icons.explore_outlined,
        3,
        isActive,
      ),
    ];
  }

  Widget _buildBottomNavigationBarItem(BuildContext context, String title,
      IconData iconUri, int idx, bool active) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCrossFade(
            crossFadeState:
                active ? CrossFadeState.showFirst : CrossFadeState.showSecond,
            duration: const Duration(milliseconds: 250),
            firstChild: Icon(
              iconUri,
              size: 20.w,
              color: Style.primary100,
            ),
            secondChild: Icon(
              iconUri,
              size: 20.w,
              color: Style.gray1,
            )),
        SizedBox(height: 2.h),
        Text(
          title,
          style: active ? Style().normalTextBold : Style().normalTextBold,
        )
      ],
    );
  }
}
