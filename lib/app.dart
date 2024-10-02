import 'package:bmi_calculator/app/splash/screens/splash_screen.dart';
import 'package:bmi_calculator/general/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:easy_localization/easy_localization.dart'; // Import easy_localization

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,

      // Localization integration
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,

      initialRoute: SplashScreen.pageRoute,
      getPages: AppPages.routes,
    );
  }
}
