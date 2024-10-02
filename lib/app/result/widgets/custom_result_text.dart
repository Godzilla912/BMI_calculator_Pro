import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';

class CustomResultText extends StatelessWidget {
  final String leftTextt; // Already localized string for left text
  final String rightTextt; // Already localized string for right text
  final bool leftBold;
  final bool rightBold;

  const CustomResultText({
    super.key,
    required this.leftTextt,
    required this.rightTextt,
    required this.leftBold,
    required this.rightBold,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          leftTextt, // Left text is already localized before being passed here
          style: TextStyle(
            fontSize: 16,
            fontWeight: leftBold ? FontWeight.w700 : FontWeight.w400,
            color: AppColor.blackColor,
            fontFamily: "Poppins",
          ),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)), // Correct usage of textScaler
        ),
        Text(
          rightTextt, // Right text is already localized before being passed here
          style: TextStyle(
            fontSize: 16,
            fontWeight: rightBold ? FontWeight.w700 : FontWeight.w400,
            color: AppColor.blackColor,
            fontFamily: "Poppins",
          ),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)), // Correct usage of textScaler
        ),
      ],
    );
  }
}
