import 'package:flutter/cupertino.dart';
import 'package:food_flutter/constants/image_constant.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../../helpers/admod/admod_helper.dart';

class RecipeDetailController extends GetxController {
  Offset? selectedPosition;
  final indexTab = 0.obs;
  final indexStar = 0.0.obs;
  final GlobalKey menuButtonKey = GlobalKey();

  List<Map<String, String>> listMenu = [
    {"image": ImageConstant.share, "name": "share"},
    {"image": ImageConstant.icStart, "name": "Rate Recipe "},
    {"image": ImageConstant.message, "name": "Review"},
    {"image": ImageConstant.icBookMark, "name": "Unsave"},
  ];

  BannerAd? bannerAd;
  List<String> tab = ["Ingrident", "Procedure"];

  @override
  void onInit() {
    loadBannerAd();
    super.onInit();
  }

  void loadBannerAd() {
    BannerAd(
      adUnitId: AdHelper().bannerAdUnitId,
      request: const AdRequest(),
      size: AdSize.fullBanner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          bannerAd = ad as BannerAd;
          update(['builder_6']);
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }
}
