import 'package:bmi_calculator/app/home/screens/home_screen.dart';
import 'package:bmi_calculator/general/config/config.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  static const pageRoute = "/splash-screen";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAll(() => HomeScreen());
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/splash.png",
              width: twelvePixelWidth(context) * 10,
              height: twelvePixelWidth(context) * 10,
            ),
            verticalSpace(twentyPixelHeight(context)),
            // ignore: prefer_const_constructors
            Text(AppConfig.appName,style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              fontFamily: "PoppinsBold",

            ),
            textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),)
          ],
        ),
      ),
    );
  }
}