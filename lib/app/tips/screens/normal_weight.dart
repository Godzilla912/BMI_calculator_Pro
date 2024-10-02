import 'package:bmi_calculator/app/tips/widgets/custom_tips_details_screen.dart';
import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class NormalWeight extends StatelessWidget {
  static const pageRoute = "/normal-weight";
  const NormalWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: "Normal".tr(), // Using localization
        backIconTrue: true,
      ),
      body: SingleChildScrollView(
        child: CustomTipsDetailsScreen(
          imageUrl: "assets/images/normal.png",
          topTextt: "You have a perfect weight. Just maintain this weight and follow some lifestyles.".tr(), // Using localization
          dietTextt: "Encouraged to eat a balanced diet rich in fruits, vegetables, lean protein and so on.".tr(), // Using localization
          exerciseTextt: "You are suggested to mix cardio and strength training exercise to maintain your current fitness.".tr(), // Using localization
          lifestyleTextt: "You are fit in weight. Just maintain this.".tr(), // Using localization
        ),
      ),
    );
  }
}
