import 'package:food_flutter/constants/image_constant.dart';
import 'package:food_flutter/helpers/extension/responsive.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter/page/saved_recipes/saved_recipes_controller.dart';
import 'package:food_flutter/page/saved_recipes/widget/build_item_recipe.dart';
import 'package:food_flutter/routes/app_pages.dart';
import 'package:food_flutter/style/app_style.dart';
import 'package:food_flutter/widget/_custom_header.dart';
import 'package:get/get.dart';

class SavedRecipesPage extends GetView<SavedRecipesController> {
  const SavedRecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SavedRecipesController());
    return SafeArea(
      child: Scaffold(
          appBar: CustomHeaderWidget(
            isShowBack: false,
            title: "Saved recipes",
          ),
          backgroundColor: Colors.white,
          resizeToAvoidBottomInset: true,
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...controller.listData.map((e) => GestureDetector(
                      onTap: () {
                        Get.toNamed(AppRoutes.recipeDetail);
                      },
                      child: const RecipeItem()))
                ],
              ),
            ),
          )),
    );
  }
}
