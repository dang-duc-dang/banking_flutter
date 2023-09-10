import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/page/recipe_detail/widget/dialog_rate_recipe.dart';
import 'package:food_flutter/page/recipe_detail/widget/dialog_share.dart';
import 'package:food_flutter/page/review/review_controller.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_custom_header.dart';
import 'package:food_flutter/widget/_title_default_text_field.dart';
import 'package:get/get.dart';

class ReviewPage extends GetView<ReviewController> {
  const ReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: CustomHeaderWidget(
            isShowBack: true,
            title: "Reviews",
          ),
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w).copyWith(top: 20.h),
            child: Column(
              children: [
                _buildHeader(),
                SizedBox(
                  height: 24.h,
                ),
                _buildListReview()
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "200 Comments",
              style: Style().smallTextRegular.copyWith(color: Style.gray4),
            ),
            Text(
              "155 Saved",
              style: Style().smallTextRegular.copyWith(color: Style.gray4),
            )
          ],
        ),
        SizedBox(
          height: 14.h,
        ),
        Text(
          "Leave a comment",
          style: Style().smallTextRegular,
        ),
        Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 18.h,
                ),
                TitleDefaultTextField(
                  maxLines: null,
                  width: double.infinity,
                  radius: 12.w,
                  controller: controller.commentController,
                  focusNode: controller.commentFocus,
                  textStyle: Style().smallTextRegular,
                  hintText: 'Say something...'.tr,
                  innerPadding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.w),
                  onChanged: (text) {},
                ),
              ],
            ),
            Positioned(
                top: 0,
                right: 10,
                child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 9.h, horizontal: 15.w),
                  decoration: BoxDecoration(
                      color: Style.primary100,
                      borderRadius: BorderRadius.circular(12.sp)),
                  child: Text(
                    "Send",
                    style:
                        Style().smallTextRegular.copyWith(color: Colors.white),
                  ),
                ))
          ],
        ),
      ],
    );
  }

  Widget _buildListReview() {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: List.generate(
              controller.listMenu.length, (index) => _buildItemReview()),
        ),
      ),
    );
  }

  Widget _buildItemReview() {
    final like = false.obs;
    final unLike = false.obs;
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Style.gray4))),
        child: Column(
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.sp),
                  child: Image.asset(
                    ImageConstant.logoSplash,
                    fit: BoxFit.cover,
                    width: 31.w,
                    height: 31.h,
                  ),
                ),
                SizedBox(
                  width: 9.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Bella Throne",
                      style: Style().smallerTextBold,
                    ),
                    Text(
                      "June 12, 2020 - 19:35",
                      style: Style()
                          .smallerTextRegular
                          .copyWith(color: Style.gray4),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              "Lorem Ipsum tempor incididunt ut labore et dolore,inise voluptate velit esse cillum",
              style: Style().smallTextRegular,
            ),
            SizedBox(
              height: 6.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    like.value = !like.value;
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        color:
                            like.value == false ? Style.gray4 : Style.primary80,
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant.like,
                          width: 8.w,
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "9",
                          style: Style().smallerTextRegular,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                GestureDetector(
                  onTap: () {
                    unLike.value = !unLike.value;
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                    decoration: BoxDecoration(
                        color: unLike.value == false
                            ? Style.gray4
                            : Style.primary80,
                        borderRadius: BorderRadius.circular(10.sp)),
                    child: Row(
                      children: [
                        Image.asset(
                          ImageConstant.unLike,
                          width: 8.w,
                          height: 8.h,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Text(
                          "9",
                          style: Style().smallerTextRegular,
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
