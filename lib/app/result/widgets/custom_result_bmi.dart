import 'package:bmi_calculator/app/result/widgets/custom_result_text.dart';
import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomResultBmi extends StatelessWidget {
  const CustomResultBmi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColor.lightBlue.withOpacity(.1),
          borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: EdgeInsets.only(
          left: twentyPixelWidth(context) * .5,
          right: twentyPixelWidth(context) * .5,
          top: twentyPixelHeight(context) * .8,
          bottom: twentyPixelHeight(context) * .8,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomResultText(
              leftTextt: el.tr('normal'), // Translation
              rightTextt: "18.5-24.9",
              leftBold: true,
              rightBold: false,
            ),
            verticalSpace(twentyPixelHeight(context) * .5),
            CustomResultText(
              leftTextt: el.tr('overweight'), // Translation
              rightTextt: "25.0-29.9",
              leftBold: true,
              rightBold: false,
            ),
            verticalSpace(twentyPixelHeight(context) * .5),
            CustomResultText(
              leftTextt: el.tr('obese'), // Translation
              rightTextt: "30.0-39.9",
              leftBold: true,
              rightBold: false,
            ),
            verticalSpace(twentyPixelHeight(context) * .5),
            CustomResultText(
              leftTextt: el.tr('seriously_obese'), // Translation
              rightTextt: el.tr('above_40'), // Translation
              leftBold: true,
              rightBold: false,
            ),
          ],
        ),
      ),
    );
  }
}
