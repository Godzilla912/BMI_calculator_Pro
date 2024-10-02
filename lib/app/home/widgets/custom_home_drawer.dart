import 'package:bmi_calculator/app/home/widgets/custom_drawer_row.dart';
import 'package:bmi_calculator/app/privacy_police/screens/privacy_police.dart';
import 'package:bmi_calculator/app/record/screens/record_screen.dart';
import 'package:bmi_calculator/app/tips/screens/all_tips.dart';
import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding `Trans` to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomHomeDrawer extends StatelessWidget {
  const CustomHomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .7,
      decoration: BoxDecoration(
          color: AppColor.blueColor.withOpacity(.6),
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), bottomRight: Radius.circular(20))),
      child: Padding(
        padding: EdgeInsets.only(
          left: twelvePixelWidth(context),
          right: twentyPixelWidth(context),
          top: twentyPixelHeight(context) * 2,
          bottom: twentyPixelHeight(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            verticalSpace(twentyPixelHeight(context) * 2),
            Center(
              child: Image.asset(
                "assets/images/splash.png",
                width: twentyPixelWidth(context) * 4.5,
              ),
            ),
            horizontalSpace(twentyPixelWidth(context) * 2),
            Center(
              child: Text(
                el.tr("app_name").toString(), // Localized string
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: AppColor.whiteColor,
                ),
                textScaler:
                TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
            ),
            verticalSpace(twentyPixelHeight(context) * 2),
            CustomDrawerRow(
              textt: el.tr("records").toString(), // Localized string
              routee: RecordScreen.pageRoute,
              widgett: Image.asset(
                "assets/images/edit.png",
                height: twentyPixelHeight(context),
              ),
            ),
            CustomDrawerRow(
              textt: el.tr("tips").toString(), // Localized string
              routee: AllTips.pageRoute,
              widgett: Image.asset(
                "assets/images/lightbulb.png",
                height: twentyPixelHeight(context),
              ),
            ),
            CustomDrawerRow(
              textt: el.tr("privacy_policy").toString(), // Localized string
              routee: PrivacyPolice.pageRoute,
              widgett: Image.asset(
                "assets/images/privacy.png",
                height: twentyPixelHeight(context),
              ),
            ),
            CustomDrawerRow(
              textt: el.tr("rate_us").toString(), // Localized string
              routee: "",
              widgett: Image.asset(
                "assets/images/star.png",
                height: twentyPixelHeight(context),
              ),
            ),
            const Expanded(child: SizedBox()),
            const Divider(
              color: AppColor.whiteColor,
              height: 2,
            ),
            verticalSpace(twentyPixelHeight(context)),
            Center(
              child: Text(
                el.tr("version").toString(), // Localized string
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    fontFamily: "Poppins",
                    color: AppColor.whiteColor),
                textScaler:
                TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
            ),
            verticalSpace(twentyPixelHeight(context))
          ],
        ),
      ),
    );
  }
}
