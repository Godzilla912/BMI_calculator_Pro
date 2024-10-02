import 'package:bmi_calculator/app.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:easy_localization/easy_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Google Mobile Ads
  MobileAds.instance.initialize();

  // Initialize GetStorage
  await GetStorage.init();

  // Ensure EasyLocalization is initialized
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const [ // Add const here
        Locale('en', 'US'), // English
        Locale('it', 'IT'),
        Locale('br','BR'),
        Locale('de','DE'),
        Locale('fr','FR')
      ],
      path: 'assets/lang', // Path to your language files
      fallbackLocale: const Locale('en', 'US'), // Default locale
      child: const MyApp(), // Wrap your MyApp with EasyLocalization
    ),
  );
}