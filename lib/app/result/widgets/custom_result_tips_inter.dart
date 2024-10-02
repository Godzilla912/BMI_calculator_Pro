import 'package:bmi_calculator/app/controllers/ads_controller.dart';
import 'package:bmi_calculator/app/controllers/home_controller.dart';
import 'package:bmi_calculator/app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization
import 'package:google_mobile_ads/google_mobile_ads.dart';

class CustomResultTipsInter extends StatefulWidget {
  const CustomResultTipsInter({super.key});

  @override
  State<CustomResultTipsInter> createState() => _CustomResultTipsInterState();
}

class _CustomResultTipsInterState extends State<CustomResultTipsInter> {
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

          if (adsController.interstitialAd != null) {
            adsController.interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
              onAdDismissedFullScreenContent: (ad) {
                ad.dispose();
                controller.tipsRoute(context);
              },
              onAdFailedToShowFullScreenContent: (ad, error) {
                ad.dispose();
                controller.tipsRoute(context);
              },
            );

            adsController.interstitialAd!.show();
          } else {
            // If ad is not loaded, navigate to the tips route directly
            controller.tipsRoute(context);
          }
        },
        child: CustomButton(
          btnTextt: "Tips".tr(), // Using localization
          whiteBtnTrue: true,
        ));
  }
}
