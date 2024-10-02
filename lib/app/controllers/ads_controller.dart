import 'package:bmi_calculator/app/controllers/home_controller.dart';
import 'package:bmi_calculator/general/config/config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class AdsController extends GetxController {
  final HomeController controller = Get.find<HomeController>();
  RxBool isBannerLoaded = RxBool(false);
  BannerAd? bannerAd;
  InterstitialAd? interstitialAd;

  @override
  void onInit() {
    super.onInit();
    loadBannerAds();
  }

  void loadBannerAds() {
    bannerAd = BannerAd(
      adUnitId: AppConfig.bannerAdsUnitID,
      request: const AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        // Called when an ad is successfully received.
        onAdLoaded: (ad) {
          debugPrint('${el.tr("ad_loaded", args: [ad.toString()])}'); // Translation
          isBannerLoaded.value = true;
          update();
        },
        // Called when an ad request failed.
        onAdFailedToLoad: (ad, err) {
          debugPrint('${el.tr("ad_failed_to_load", args: [err.toString()])}'); // Translation
          // Dispose the ad here to free resources.
          ad.dispose();
        },
      ),
    )..load();
  }
}
