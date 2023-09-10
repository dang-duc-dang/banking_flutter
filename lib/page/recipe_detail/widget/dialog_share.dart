import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:food_flutter/page/recipe_detail/recipe_detail_controller.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:get/get.dart';

class DialogShare extends GetView<RecipeDetailController> {
  const DialogShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Material(
            borderRadius: BorderRadius.circular(8.w),
            child: Stack(
              children: [
                Positioned(
                    top: 10,
                    right: 10,
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        CupertinoIcons.clear,
                        color: Colors.black,
                        size: 16.sp,
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Recipe Link ",
                        style: Style().largeTextBold,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        "Copy recipe link and share your recipe link with  friends and family.",
                        style: Style()
                            .smallerTextRegular
                            .copyWith(color: Style.gray3),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            alignment: Alignment.centerLeft,
                            width: Get.width,
                            height: 43,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(9),
                                color: Color(0xffd9d9d9)),
                            child: Text("app.Recipe.co/jollof_rice",
                                style: Style().smallerTextSemiBold),
                          ),
                          Positioned(
                            right: 0,
                            child: GestureDetector(
                              onTap: () {
                                Clipboard.setData(ClipboardData(
                                    text: "app.Recipe.co/jollof_rice"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Đã sao chép'.tr),
                                  backgroundColor: Style.primary100,
                                ));
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: 85,
                                height: 43,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(9),
                                    color: Color(0xff119475)),
                                child: Text("Copy Link",
                                    style: Style()
                                        .smallerTextSemiBold
                                        .copyWith(color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
