import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding `Trans` to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class PrivacyPolice extends StatelessWidget {
  static const pageRoute = "/privacy-police";
  const PrivacyPolice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: el.tr("privacy_policy").toString(), // Localized string
        backIconTrue: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: twentyPixelWidth(context),
            right: twentyPixelWidth(context),
            top: twentyPixelHeight(context),
            bottom: twentyPixelHeight(context) * 1.5,
          ),
          child: Text(
            el.tr("privacy_policy_text").toString(), // Localized string
            style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Poppins",
                color: AppColor.blackColor),
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            textAlign: TextAlign.justify,
          ),
        ),
      ),
    );
  }
}
