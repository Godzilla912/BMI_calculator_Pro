import 'package:bmi_calculator/app/controllers/ads_controller.dart';
import 'package:bmi_calculator/app/controllers/home_controller.dart';
import 'package:bmi_calculator/app/record/screens/record_screen.dart';
import 'package:bmi_calculator/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomResultInterad extends StatefulWidget {
  const CustomResultInterad({super.key});

  @override
  State<CustomResultInterad> createState() => _CustomBannerFileState();
}

class _CustomBannerFileState extends State<CustomResultInterad> {
  final HomeController controller = Get.put(HomeController());
  final AdsController adsController = Get.put(AdsController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.saveResult();
        adsController.interstitialAd!.fullScreenContentCallback =
            FullScreenContentCallback(onAdDismissedFullScreenContent: (ad) {
              Get.to(() => RecordScreen());
              controller.saveResult();
            });

        adsController.interstitialAd!.show();
      },
      child: CustomButton(
        btnTextt: el.tr('save'), // Translation
        whiteBtnTrue: true,
      ),
    );
  }
}
