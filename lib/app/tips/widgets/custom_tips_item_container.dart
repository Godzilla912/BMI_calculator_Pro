import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomTipsItemContainer extends StatelessWidget {
  final String imageUrl;
  final String headTextt;
  final String bodyTextt;

  const CustomTipsItemContainer({
    super.key,
    required this.imageUrl,
    required this.headTextt,
    required this.bodyTextt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.veryLiteBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                imageUrl,
                height: twentyPixelHeight(context) * 1.5,
              ),
              horizontalSpace(twelvePixelWidth(context) * .5),
              Text(
                el.tr(headTextt), // Explicitly using easy_localization's tr() method
                textScaler:
                TextScaler.linear(ScaleSize.textScaleFactor(context)),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: AppColor.blackColor,
                ),
              ),
            ],
          ),
          verticalSpace(twentyPixelHeight(context) * .5),
          Text(
            el.tr(bodyTextt), // Explicitly using easy_localization's tr() method
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              fontFamily: "Poppins",
              color: AppColor.blackColor,
            ),
          ),
        ],
      ),
    );
  }
}
