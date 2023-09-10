import 'package:flutter/material.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RecipeItem extends StatelessWidget {
  const RecipeItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.w),
      child: Stack(
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
              left: 10,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Traditional spare ribs baked",
                          style: Style()
                              .smallTextBold
                              .copyWith(color: Colors.white),
                          textAlign: TextAlign.start,
                        ),
                        Text("By Chef John",
                            style: Style().smallerTextBold.copyWith(
                                  color: Style.gray4,
                                ))
                      ],
                    ),
                  ),
                  Expanded(
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
                    ),
                  )
                ],
              )),
          Positioned(
              top: 10,
              right: 10,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 7.w),
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
    );
  }
}
