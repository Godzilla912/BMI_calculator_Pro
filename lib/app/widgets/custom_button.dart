import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomButton extends StatelessWidget {
  final String btnTextt;
  final bool? whiteBtnTrue;

  const CustomButton({
    super.key,
    required this.btnTextt,
    this.whiteBtnTrue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: twentyPixelHeight(context) * 2.8,
      decoration: BoxDecoration(
        color: whiteBtnTrue == null ? AppColor.blueColor : AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: whiteBtnTrue == null ? AppColor.whiteColor : AppColor.blueColor,
          width: 2,
        ),
      ),
      child: Center(
        child: Text(
          el.tr(btnTextt), // Explicitly using easy_localization's tr() method
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: whiteBtnTrue == null ? AppColor.whiteColor : AppColor.blueColor,
            fontFamily: "Poppins",
          ),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
      ),
    );
  }
}
