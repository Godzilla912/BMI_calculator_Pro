import 'package:bmi_calculator/app/tips/widgets/custom_tips_details_screen.dart';
import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class Underweight extends StatelessWidget {
  static const pageRoute = "/under-weight";
  const Underweight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: "Underweight".tr(), // Using localization
        backIconTrue: true,
      ),
      body: SingleChildScrollView(
        child: CustomTipsDetailsScreen(
          imageUrl: "assets/images/underweight.png",
          topTextt: "You need to gain some weight. You can follow these steps:".tr(), // Using localization
          dietTextt: "Eat high-nutrient foods regularly and take requests for meals to gain some weight.".tr(), // Using localization
          exerciseTextt: "Do some strength training to build muscles. Try to avoid cardio exercises.".tr(), // Using localization
          lifestyleTextt: "You are recommended to take counseling from a health specialist to gain proper weight.".tr(), // Using localization
        ),
      ),
    );
  }
}
