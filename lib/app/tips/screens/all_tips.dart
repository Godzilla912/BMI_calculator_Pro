import 'package:bmi_calculator/app/tips/screens/normal_weight.dart';
import 'package:bmi_calculator/app/tips/screens/obese.dart';
import 'package:bmi_calculator/app/tips/screens/over_weight.dart';
import 'package:bmi_calculator/app/tips/screens/seriously_obese.dart';
import 'package:bmi_calculator/app/tips/screens/underweight.dart';
import 'package:bmi_calculator/app/tips/widgets/custom_all_tips_bt.dart';
import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class AllTips extends StatelessWidget {
  static const pageRoute = "/all-tips";
  const AllTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: "All tips".tr(), // Using localization
        backIconTrue: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: twentyPixelWidth(context),
          right: twelvePixelWidth(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomAllTipsBt(
              buttonText: "Underweight".tr(), // Using localization
              imageUrl: "assets/images/underweight.png",
              pageUrl: Underweight.pageRoute,
            ),
            CustomAllTipsBt(
              buttonText: "Normal".tr(), // Using localization
              imageUrl: "assets/images/normal.png",
              pageUrl: NormalWeight.pageRoute,
            ),
            CustomAllTipsBt(
              buttonText: "Overweight".tr(), // Using localization
              imageUrl: "assets/images/overweight.png",
              pageUrl: OverWeight.pageRoute,
            ),
            CustomAllTipsBt(
              buttonText: "Obese".tr(), // Using localization
              imageUrl: "assets/images/obese.png",
              pageUrl: Obese.pageRoute,
            ),
            CustomAllTipsBt(
              buttonText: "Seriously Obese".tr(), // Using localization
              imageUrl: "assets/images/seriously_obese.png",
              pageUrl: SeriouslyObese.pageRoute,
            ),
          ],
        ),
      ),
    );
  }
}
