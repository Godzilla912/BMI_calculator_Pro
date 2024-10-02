import 'package:bmi_calculator/app/controllers/ads_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomBannerFile extends StatefulWidget {
  const CustomBannerFile({super.key});

  @override
  State<CustomBannerFile> createState() => _CustomBannerFileState();
}

class _CustomBannerFileState extends State<CustomBannerFile> {
  final AdsController adsController = Get.put(AdsController());

  @override
  void initState() {
    super.initState();
    adsController.loadBannerAds();
  }

  @override
  Widget build(BuildContext context) {
    return adsController.bannerAd != null
        ? SafeArea(
      child: SizedBox(
        width: adsController.bannerAd!.size.width.toDouble(),
        height: adsController.bannerAd!.size.height.toDouble(),
        child: AdWidget(ad: adsController.bannerAd!),
      ),
    )
        : const SizedBox();
  }
}
