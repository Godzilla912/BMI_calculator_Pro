import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomContainerRow extends StatelessWidget {
  final String fieldName;
  final String fieldType;
  final String fieldFirstParameter;
  final String? fieldSecondParameter;

  const CustomContainerRow({
    super.key,
    required this.fieldName,
    required this.fieldType,
    required this.fieldFirstParameter,
    this.fieldSecondParameter,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              fieldName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: AppColor.blackColor,
                fontFamily: "Poppins",
              ),
              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            ),
            horizontalSpace(twentyPixelWidth(context) * .25),
            Container(
              width: twentyPixelWidth(context) * 1.4,
              height: twentyPixelHeight(context) * 1,
              decoration: BoxDecoration(
                color: AppColor.blueColor,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  fieldType,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    fontFamily: "Poppins",
                    color: AppColor.whiteColor,
                  ),
                  textAlign: TextAlign.center,
                  textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              fieldFirstParameter.toString(),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                color: AppColor.blackColor,
                decoration: TextDecoration.underline,
              ),
              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            ),
            horizontalSpace(twentyPixelWidth(context) * .25),
            fieldSecondParameter != null && fieldSecondParameter.toString().isNotEmpty
                ? Text(
              fieldSecondParameter.toString(),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                color: AppColor.blackColor,
                decoration: TextDecoration.underline,
              ),
              textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            )
                : Container(),
          ],
        ),
      ],
    );
  }
}
