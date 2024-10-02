import 'package:bmi_calculator/app/tips/widgets/custom_tips_details_screen.dart';
import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class Obese extends StatelessWidget {
  static const pageRoute = "/obese";
  const Obese({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: "Obese".tr(), // Using localization
        backIconTrue: true,
      ),
      body: SingleChildScrollView(
        child: CustomTipsDetailsScreen(
          imageUrl: "assets/images/obese.png",
          topTextt: "Your overweight is becoming risky. Follow the necessary steps:".tr(), // Using localization
          dietTextt: "You are encouraged to take a well-planned diet food chart. Your food chart should focus on high-fiber, low-calorie foods.".tr(), // Using localization
          exerciseTextt: "We recommend you start with low-impact exercises like walking or swimming to reduce strain on joints.".tr(), // Using localization
          lifestyleTextt: "You are strongly recommended to consult a healthcare specialist.".tr(), // Using localization
        ),
      ),
    );
  }
}
