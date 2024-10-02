import 'package:bmi_calculator/app/tips/widgets/custom_tips_details_screen.dart';
import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class SeriouslyObese extends StatelessWidget {
  static const pageRoute = "/seriously-obese";
  const SeriouslyObese({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: "Seriously Obese".tr(), // Using localization
        backIconTrue: true,
      ),
      body: SingleChildScrollView(
        child: CustomTipsDetailsScreen(
          imageUrl: "assets/images/seriously_obese.png",
          topTextt: "Your weight is in the risky stage. Please follow the necessary steps:".tr(), // Using localization
          dietTextt: "You are strongly advised to take a diet chart from a professional.".tr(), // Using localization
          exerciseTextt: "Take a proper exercise chart from a professional.".tr(), // Using localization
          lifestyleTextt: "Advice to the user to live under the surveillance of a professional doctor.".tr(), // Using localization
        ),
      ),
    );
  }
}
