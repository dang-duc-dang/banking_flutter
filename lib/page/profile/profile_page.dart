import 'package:flutter/cupertino.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/page/notification/notification_controller.dart';
import 'package:food_flutter/page/profile/profile_controller.dart';
import 'package:food_flutter/page/saved_recipes/widget/build_item_recipe.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_custom_header.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/src/rating_bar.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProfileController());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          appBar: CustomHeaderWidget(
            isShowBack: false,
            title: "Profile",
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                SizedBox(
                  height: 15.h,
                ),
                _buildTab(),
                SizedBox(height: 10.w),
                Expanded(
                  child: _buildListRecipe(),
                )
              ],
            ),
          )),
    );
  }

  Widget _buildHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                ImageConstant.logoSplash,
                fit: BoxFit.cover,
                width: 100.w,
                height: 100.h,
              ),
            ),
            SizedBox(
              width: 25.w,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Recipe",
                        style: Style()
                            .smallerTextRegular
                            .copyWith(color: Style.gray4),
                      ),
                      Text(
                        "4",
                        style: Style().largeTextBold,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Followers",
                        style: Style()
                            .smallerTextRegular
                            .copyWith(color: Style.gray4),
                      ),
                      Text(
                        "2.5M",
                        style: Style().largeTextBold,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        "Following",
                        style: Style()
                            .smallerTextRegular
                            .copyWith(color: Style.gray4),
                      ),
                      Text(
                        "259",
                        style: Style().largeTextBold,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 15.h,
        ),
        Text(
          "Afuwape Abiodun",
          style: Style().normalTextBold,
        ),
        Text(
          "Chef",
          style: Style().smallerTextRegular.copyWith(color: Style.gray3),
        ),
        SizedBox(
          height: 10.h,
        ),
        Text(
          "Private Chef Passionate about food and life 🥘🍲🍝🍱 More...",
          style: Style().smallerTextRegular.copyWith(color: Style.gray3),
        )
      ],
    );
  }

  Widget _buildTab() {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(vertical: 10.w),
        color: Colors.white,
        child: DefaultTabController(
          length: controller.tabs.length,
          child: TabBar(
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(10.w),
              color: Style.primary100,
            ),
            unselectedLabelColor: Style.primary100,
            controller: controller.tabController,
            labelColor: Colors.white,
            labelStyle: Style().smallerTextBold,
            dividerColor: Colors.red,
            indicatorColor: Style.primary100,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.zero,
            labelPadding: EdgeInsets.zero,
            tabs: List.generate(
              controller.tabs.length,
              (index) => Container(
                alignment: Alignment.center,
                width: (Get.width - 80.w) / 3,
                padding: const EdgeInsets.symmetric(vertical: 7),
                child: Text(
                  controller.tabs[index].rawValue,
                ),
              ),
            ),
            onTap: (index) {
              controller.indexTab.value = index;
            },
          ),
        ),
      ),
    );
  }

  Widget _buildListRecipe() {
    return ListView.builder(
        itemCount: controller.listNoti.length,
        itemBuilder: (BuildContext ontext, int index) {
          return Container(
            child: const RecipeItem(),
          );
        });
  }
}
