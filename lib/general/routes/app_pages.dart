import 'package:bmi_calculator/app/home/screens/home_screen.dart';
import 'package:bmi_calculator/app/privacy_police/screens/privacy_police.dart';
import 'package:bmi_calculator/app/record/screens/record_screen.dart';
import 'package:bmi_calculator/app/result/screens/result_screen.dart';
import 'package:bmi_calculator/app/splash/screens/splash_screen.dart';
import 'package:bmi_calculator/app/tips/screens/all_tips.dart';
import 'package:bmi_calculator/app/tips/screens/normal_weight.dart';
import 'package:bmi_calculator/app/tips/screens/obese.dart';
import 'package:bmi_calculator/app/tips/screens/over_weight.dart';
import 'package:bmi_calculator/app/tips/screens/seriously_obese.dart';
import 'package:bmi_calculator/app/tips/screens/underweight.dart';
import 'package:get/get.dart';

class AppPages {
  static final routes=[
    GetPage(name: SplashScreen.pageRoute, page: () => const SplashScreen()),
    GetPage(name: HomeScreen.pageRoute, page: () =>  HomeScreen()),
    GetPage(name: ResultScreen.pageRoute, page: () =>  ResultScreen()),
    GetPage(name: RecordScreen.pageRoute, page: () =>  RecordScreen()),
    GetPage(name: AllTips.pageRoute, page: () =>  const AllTips()),
    GetPage(name: PrivacyPolice.pageRoute, page: () =>  const PrivacyPolice()),
    GetPage(name: Underweight.pageRoute, page: () =>  const Underweight()),
    GetPage(name: NormalWeight.pageRoute, page: () =>  const NormalWeight()),
    GetPage(name: OverWeight.pageRoute, page: () =>  const OverWeight()),
    GetPage(name: Obese.pageRoute, page: () =>  const Obese()),
    GetPage(name: SeriouslyObese.pageRoute, page: () =>  const SeriouslyObese()),
  ];
}