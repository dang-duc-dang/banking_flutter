import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/recipe_detail/recipe_detail_controller.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:get/get.dart';
import 'package:flutter_rating_bar/src/rating_bar.dart';

class DialogRateRecipe extends GetView<RecipeDetailController> {
  const DialogRateRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
              borderRadius: BorderRadius.circular(8.w),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
                child: Column(
                  children: [
                    Text(
                      "Rate recipe",
                      style: Style().smallerTextRegular,
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    RatingBar(
                      itemSize: 20.w,
                      initialRating: controller.indexStar.value,
                      allowHalfRating: true,
                      ratingWidget: RatingWidget(
                        full: Image.asset(
                          ImageConstant.icStart,
                          width: 20.w,
                          height: 20.h,
                        ),
                        half: Image.asset(
                          ImageConstant.icStart,
                          width: 20.w,
                          height: 20.h,
                        ),
                        empty: Image.asset(
                          ImageConstant.icStartEmty,
                          color: Style.gray4,
                          width: 20.w,
                          height: 20.h,
                        ),
                      ),
                      itemPadding: EdgeInsets.only(right: 10.w),
                      onRatingUpdate: (rating) {
                        controller.indexStar.value = rating;
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 4.h, horizontal: 20.w),
                      decoration: BoxDecoration(
                          color: controller.indexStar.value == 0
                              ? Style.gray4
                              : Style.rating,
                          borderRadius: BorderRadius.circular(6.w)),
                      child: Text(
                        "Send",
                        style: Style().smallTextRegular,
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
