import 'package:bmi_calculator/app/home/screens/home_screen.dart';
import 'package:bmi_calculator/app/home/widgets/custom_banner_file.dart';
import 'package:bmi_calculator/app/tips/widgets/custom_tips_item_container.dart';
import 'package:bmi_calculator/app/widgets/custom_button.dart';
import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/config/config.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomTipsDetailsScreen extends StatelessWidget {
  final String imageUrl;
  final String topTextt;
  final String dietTextt;
  final String exerciseTextt;
  final String lifestyleTextt;

  const CustomTipsDetailsScreen({
    super.key,
    required this.imageUrl,
    required this.topTextt,
    required this.dietTextt,
    required this.exerciseTextt,
    required this.lifestyleTextt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: twelvePixelWidth(context),
        right: twelvePixelWidth(context),
        top: twentyPixelHeight(context),
        bottom: twentyPixelHeight(context) * 1.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              imageUrl,
              height: twentyPixelHeight(context) * 12,
            ),
          ),
          verticalSpace(twentyPixelWidth(context)),
          Text(
            el.tr(topTextt), // Explicitly using easy_localization's tr() method
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: AppColor.blackColor,
            ),
          ),
          verticalSpace(twentyPixelHeight(context)),
          CustomTipsItemContainer(
            imageUrl: "assets/images/diet.png",
            headTextt: el.tr("Diet:"), // Explicitly using easy_localization's tr() method
            bodyTextt: el.tr(dietTextt), // Explicitly using easy_localization's tr() method
          ),
          verticalSpace(twentyPixelHeight(context) * .5),
          CustomTipsItemContainer(
            imageUrl: "assets/images/exercise.png",
            headTextt: el.tr("Exercise:"), // Explicitly using easy_localization's tr() method
            bodyTextt: el.tr(exerciseTextt), // Explicitly using easy_localization's tr() method
          ),
          verticalSpace(twentyPixelHeight(context) * .5),
          CustomTipsItemContainer(
            imageUrl: "assets/images/healthcare.png",
            headTextt: el.tr("Lifestyle Tips:"), // Explicitly using easy_localization's tr() method
            bodyTextt: el.tr(lifestyleTextt), // Explicitly using easy_localization's tr() method
          ),
          verticalSpace(twentyPixelHeight(context)),
          const Center(
              child: AppConfig.bannerAdsUnitID != ""
                  ? CustomBannerFile()
                  : SizedBox()),
          verticalSpace(twentyPixelHeight(context)),
          InkWell(
            onTap: () {
              Get.to(() => HomeScreen());
            },
            child: CustomButton(
              btnTextt: el.tr("Go to home"), // Explicitly using easy_localization's tr() method
            ),
          ),
        ],
      ),
    );
  }
}
