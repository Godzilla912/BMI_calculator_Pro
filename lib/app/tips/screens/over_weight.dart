import 'package:bmi_calculator/app/tips/widgets/custom_tips_details_screen.dart';
import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class OverWeight extends StatelessWidget {
  static const pageRoute = "/over-weight";
  const OverWeight({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: "Overweight".tr(), // Using localization
        backIconTrue: true,
      ),
      body: SingleChildScrollView(
        child: CustomTipsDetailsScreen(
          imageUrl: "assets/images/overweight.png",
          topTextt: "You are gaining extra weight. Follow the necessary steps:".tr(), // Using localization
          dietTextt: "Encouraged to eat a balanced diet rich in fruits and vegetables.".tr(), // Using localization
          exerciseTextt: "You need to take some extra exercise to lose some weight.".tr(), // Using localization
          lifestyleTextt: "You are suggested for regular monitoring of blood pressure, cholesterol levels, and blood sugar.".tr(), // Using localization
        ),
      ),
    );
  }
}
