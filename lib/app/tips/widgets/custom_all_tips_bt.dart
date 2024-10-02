import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomAllTipsBt extends StatelessWidget {
  final String buttonText;
  final String imageUrl;
  final String pageUrl;

  const CustomAllTipsBt({
    super.key,
    required this.buttonText,
    required this.imageUrl,
    required this.pageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(pageUrl);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: twentyPixelWidth(context),
          right: twelvePixelWidth(context),
          top: twentyPixelHeight(context) * .5,
          bottom: twentyPixelHeight(context) * .5,
        ),
        margin: EdgeInsets.only(top: twentyPixelWidth(context) * .5),
        decoration: BoxDecoration(
          color: AppColor.veryLiteBlue,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 0,
              blurRadius: 8,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        height: twentyPixelHeight(context) * 3.25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
            ),
            SizedBox(
              width: twelvePixelWidth(context) * 2,
            ),
            Text(
              el.tr(buttonText), // Explicitly using easy_localization's tr() method
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                fontFamily: "Poppins",
                color: AppColor.blackColor,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
