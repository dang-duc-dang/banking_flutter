import 'package:flutter/cupertino.dart';
import 'package:food_flutter/constants/enum_file.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/data/database_local/app_prefs.dart';
import 'package:food_flutter/data/models/user/user_model.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/page/home/home_controller.dart';
import 'package:food_flutter/page/home/widget/build_filter.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/src/rating_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              _buildTab(),
              SizedBox(height: 15.w),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildListProduct(),
                      SizedBox(height: 20.w),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30.w),
                        child: Text(
                          "New Recipes",
                          style: Style().normalTextBold,
                        ),
                      ),
                      SizedBox(height: 5.w),
                      _buildListRecipes(),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget buildHeader() {
    return StreamBuilder(
        stream: AppPrefs().watch('userData'),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          UserModel user = AppPrefs.box.get('userData');
          return Padding(
            padding: EdgeInsets.only(
                top: 20.w, right: 30.w, left: 30.w, bottom: 15.w),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hello ${user.email}",
                            style: Style().largeTextBold,
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("What are you cooking today?",
                              style: Style().smallTextRegular.copyWith(
                                    color: Style.gray3,
                                  )),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.sp),
                      child: Image.asset(
                        ImageConstant.logoSplash,
                        fit: BoxFit.cover,
                        width: 40,
                        height: 40,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                _buildSearch()
              ],
            ),
          );
        });
  }

  Widget _buildSearch() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: TitleDefaultTextField(
            preIcon: Icon(
              Icons.search,
              size: 20.w,
            ),
            width: double.infinity,
            radius: 12.w,
            controller: controller.searchController,
            focusNode: controller.searchFocus,
            textStyle: Style().smallTextRegular,
            hintText: 'Search recipe'.tr,
            innerPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 19.w),
            onChanged: (text) {},
          ),
        ),
        SizedBox(
          width: 20.w,
        ),
        GestureDetector(
          onTap: () {
            Get.bottomSheet(
              const BuildFilter(),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(18.w),
            decoration: BoxDecoration(
                color: Style.primary100,
                borderRadius: BorderRadius.circular(10.w)),
            child: Image.asset(
              ImageConstant.filter,
              width: 20.w,
              height: 20.h,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTab() {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(vertical: 10.w).copyWith(left: 10.w),
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
              (index) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                child: Text(
                  controller.tabs[index].rawValue,
                ),
              ),
            ),
            onTap: (index) {
              controller.indexTab.value = index;
            },
            isScrollable: true,
          ),
        ),
      ),
    );
  }

  Widget _buildListProduct() {
    return SizedBox(
      height: 218,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: ListView.builder(
            padding: EdgeInsets.only(left: 10.w),
            scrollDirection: Axis.horizontal,
            itemCount: controller.listData.length,
            itemBuilder: (BuildContext ontext, int index) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: _buildItemProduct(),
              );
            }),
      ),
    );
  }

  Widget _buildListRecipes() {
    return SizedBox(
      height: 130,
      child: Padding(
        padding: EdgeInsets.only(left: 10.w),
        child: ListView.builder(
            padding: EdgeInsets.only(left: 10.w),
            scrollDirection: Axis.horizontal,
            itemCount: controller.listData.length,
            itemBuilder: (BuildContext ontext, int index) {
              return Container(
                margin: const EdgeInsets.only(right: 12),
                child: _buildItemRecipes(),
              );
            }),
      ),
    );
  }

  Widget _buildItemProduct() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: 60.w,
            ),
            Container(
              width: 150.w,
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  color: Style.gray4,
                  borderRadius: BorderRadius.circular(12.sp)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 60.w,
                  ),
                  Text(
                    "Classic Greek Salad",
                    style: Style().smallTextBold,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                  SizedBox(
                    height: 19.w,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Time",
                            style: Style().smallerTextRegular,
                          ),
                          Text(
                            "15 Mins",
                            style: Style().smallerTextRegular,
                          )
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(6.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100)),
                        child: Image.asset(
                          ImageConstant.icBookMark,
                          width: 16.w,
                          height: 16.h,
                          color: Style.primary100,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              ImageConstant.product,
              width: 100,
              height: 100,
            ),
          ),
        ),
        Positioned(
            top: 30,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 3.w, horizontal: 7.w),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.w),
                  color: Style.secondary20),
              child: Row(children: [
                Icon(
                  Icons.star,
                  size: 10.sp,
                  color: Style.rating,
                ),
                SizedBox(width: 4.w),
                Text(
                  "4.5",
                  style: Style().smallerTextRegular,
                )
              ]),
            ))
      ],
    );
  }

  Widget _buildItemRecipes() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            SizedBox(
              height: 32.w,
            ),
            Container(
              padding: EdgeInsets.all(10.w),
              decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      color: Style.gray4,
                      spreadRadius: 3,
                      blurRadius: 4,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                  color: Style.white,
                  borderRadius: BorderRadius.circular(12.sp)),
              height: 100.w,
              width: 251.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 139,
                    child: Text(
                      "Steak with tomato sauce and bulgur rice.",
                      style: Style().smallTextBold,
                      textAlign: TextAlign.start,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    height: 5.w,
                  ),
                  RatingBar(
                    itemSize: 10.w,
                    initialRating: 4,
                    allowHalfRating: true,
                    ratingWidget: RatingWidget(
                      full: Image.asset(
                        ImageConstant.icStart,
                        width: 12.w,
                        height: 12.h,
                      ),
                      half: Image.asset(
                        ImageConstant.icStart,
                        width: 12.w,
                        height: 12.h,
                      ),
                      empty: Image.asset(
                        ImageConstant.icStart,
                        color: Style.gray4,
                        width: 12.w,
                        height: 12.h,
                      ),
                    ),
                    itemPadding: EdgeInsets.only(right: 6.w),
                    onRatingUpdate: (rating) {
                      // controller.onChangeRating(rating);
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                          ImageConstant.product,
                          width: 25.w,
                          height: 25.h,
                        ),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Expanded(
                        child: Text(
                          "By James Milner",
                          style: Style()
                              .smallerTextRegular
                              .copyWith(color: Style.gray4),
                        ),
                      ),
                      Image.asset(
                        ImageConstant.timer,
                        width: 17.w,
                        height: 17.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "15 Mins",
                        style: Style().smallerTextRegular
                          ..copyWith(color: Style.gray4),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          right: 10,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.asset(
              ImageConstant.product,
              width: 75,
              fit: BoxFit.cover,
              height: 80,
            ),
          ),
        ),
      ],
    );
  }
}
