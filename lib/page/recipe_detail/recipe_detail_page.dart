import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/page/recipe_detail/recipe_detail_controller.dart';
import 'package:food_flutter/page/recipe_detail/widget/dialog_rate_recipe.dart';
import 'package:food_flutter/page/recipe_detail/widget/dialog_share.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_custom_header.dart';
import 'package:get/get.dart';

class RecipeDetailPage extends GetView<RecipeDetailController> {
  const RecipeDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RecipeDetailController());
    return SafeArea(
      child: Scaffold(
          appBar: CustomHeaderWidget(
            actions: [
              GestureDetector(
                key: controller.menuButtonKey,
                onTap: () {
                  _showPopupMenu(context);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Image.asset(
                    ImageConstant.icMore,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              )
            ],
            isShowBack: true,
          ),
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              children: [
                _buildHeader(),
                SizedBox(
                  height: 8.h,
                ),
                _buildTab(),
                SizedBox(
                  height: 22.h,
                ),
                _buildBody()
              ],
            ),
          )),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.w),
                child: Image.asset(
                  ImageConstant.product,
                  fit: BoxFit.cover,
                  width: Get.width,
                  height: 150.h,
                ),
              ),
              Positioned(
                  top: 0,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      gradient: LinearGradient(
                        stops: const [0.0, 1],
                        begin: FractionalOffset.topCenter,
                        end: FractionalOffset.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.01),
                          Colors.black,
                        ],
                      ),
                    ),
                  )),
              Positioned(
                  bottom: 10,
                  right: 10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Image.asset(
                        ImageConstant.timer,
                        width: 17.w,
                        height: 17.h,
                      ),
                      SizedBox(
                        width: 5.w,
                      ),
                      Text(
                        "20 min",
                        style: Style()
                            .smallerTextRegular
                            .copyWith(color: Style.gray4),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        padding: EdgeInsets.all(4.w),
                        decoration: BoxDecoration(
                            color: Style.white,
                            borderRadius: BorderRadius.circular(100.sp)),
                        child: Image.asset(
                          ImageConstant.icBookMark,
                          width: 16.w,
                          height: 16.h,
                        ),
                      )
                    ],
                  )),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 4.w, horizontal: 7.w),
                    decoration: BoxDecoration(
                        color: Style.secondary20,
                        borderRadius: BorderRadius.circular(20.sp)),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant.icStart,
                          width: 8.w,
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          "4.0",
                          style: Style().smallerTextRegular,
                        )
                      ],
                    ),
                  )),
            ],
          ),
          SizedBox(
            height: 10.w,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  "Spicy chicken burger with French fries",
                  style: Style().smallTextBold,
                ),
              ),
              SizedBox(width: 18.w),
              Text(
                "(13k Reviews)",
                textAlign: TextAlign.end,
                style: Style().labelRegular.copyWith(color: Style.gray4),
              ),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  ImageConstant.logoSplash,
                  fit: BoxFit.cover,
                  width: 40.w,
                  height: 40.h,
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Laura wilson",
                      style: Style().smallTextBold,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          ImageConstant.icLocation,
                          width: 17.w,
                          height: 17.h,
                        ),
                        Text("Lagos, Nigeria",
                            style: Style().smallerTextRegular.copyWith(
                                  color: Style.gray4,
                                )),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
                decoration: BoxDecoration(
                    color: Style.primary100,
                    borderRadius: BorderRadius.circular(10.sp)),
                child: Text(
                  "Follow",
                  style: Style().smallerTextBold.copyWith(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTab() {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Style.white.withOpacity(0.6), width: 0.5))),
        child: Row(
            children: List.generate(
          controller.tab.length,
          (index) => GestureDetector(
            onTap: () {
              controller.indexTab.value = index;
            },
            child: Container(
                width: (Get.width - 60.w) / 2,
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 12.w),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: controller.indexTab.value == index
                        ? Style.primary100
                        : Colors.white),
                child: Text(
                  controller.tab[index],
                  style: TextStyle(
                      fontSize: 14.w,
                      fontWeight: FontWeight.w600,
                      color: controller.indexTab.value == index
                          ? Style.white
                          : Style.primary100),
                )),
          ),
        )),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: Obx(
        () => Column(
          children: [
            Row(
              children: [
                Image.asset(
                  ImageConstant.icDish,
                  width: 17.w,
                  height: 17.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text("1 serve",
                    style: Style().smallerTextRegular.copyWith(
                          color: Style.gray4,
                        )),
                Spacer(),
                Text("10 Steps",
                    style: Style().smallerTextRegular.copyWith(
                          color: Style.gray4,
                        )),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Expanded(
                child: controller.indexTab.value == 0
                    ? _listIngrident()
                    : _listProcedure())
          ],
        ),
      ),
    );
  }

  Widget _listIngrident() {
    return SingleChildScrollView(
      child: Column(
        children:
            controller.listMenu.map((e) => _buildItemIngrident()).toList(),
      ),
    );
  }

  Widget _listProcedure() {
    return SingleChildScrollView(
      child: Column(
        children: controller.listMenu.map((e) => _buildStep()).toList(),
      ),
    );
  }

  Widget _buildItemIngrident() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
          color: Style.gray4, borderRadius: BorderRadius.circular(12.sp)),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.sp)),
            child: Image.asset(
              ImageConstant.total,
              width: 40.w,
              height: 40.h,
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
          Text(
            "Tomatos",
            style: Style().normalTextBold,
          ),
          const Spacer(),
          Text(
            "500g",
            style: Style().smallTextRegular.copyWith(color: Style.gray3),
          )
        ],
      ),
    );
  }

  Widget _buildStep() {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 15.w),
        margin: EdgeInsets.only(bottom: 10.h),
        decoration: BoxDecoration(
            color: Style.gray4, borderRadius: BorderRadius.circular(12.sp)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Step 1",
              style: Style().smallTextBold,
            ),
            Text(
              "Lorem Ipsum tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur? Tempor incididunt ut labore et dolore,in voluptate velit esse cillum dolore eu fugiat nulla pariatur?",
              style: Style().smallerTextRegular.copyWith(color: Style.gray3),
            )
          ],
        ));
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox button = controller.menuButtonKey.currentContext
        ?.findRenderObject() as RenderBox;
    final Offset offset = button.localToGlobal(Offset.zero);

    showMenu(
        context: context,
        position: RelativeRect.fromLTRB(offset.dx, offset.dy + 56,
            offset.dx + button.size.width, offset.dy),
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadius.circular(12.sp)),
        items: List.generate(
          controller.listMenu.length,
          (index) => PopupMenuItem(
            value: index,
            child: Row(
              children: [
                Image.asset(
                  controller.listMenu[index]['image'].toString(),
                  width: 20.w,
                  height: 20.h,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 16.w,
                ),
                Text(
                  controller.listMenu[index]['name'].toString(),
                  style: Style().smallTextRegular,
                )
              ],
            ),
          ),
        )).then((value) {
      if (value == 0) {
        Get.dialog(const DialogShare());
      } else if (value == 1) {
        Get.dialog(const DialogRateRecipe());
      } else if (value == 2) {
        Get.toNamed(AppRoutes.review);
      } else if (value == 3) {
        Get.dialog(const DialogShare());
      }
    });
  }
}
