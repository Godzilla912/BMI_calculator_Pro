import 'package:bmi_calculator/app/tips/screens/normal_weight.dart';
import 'package:bmi_calculator/app/tips/screens/obese.dart';
import 'package:bmi_calculator/app/tips/screens/over_weight.dart';
import 'package:bmi_calculator/app/tips/screens/seriously_obese.dart';
import 'package:bmi_calculator/app/tips/screens/underweight.dart';
import 'package:bmi_calculator/general/config/colors.dart';
import 'package:get/get.dart' hide Trans; // Hiding `Trans` to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class HomeController extends GetxController {
  RxDouble currentHeight = RxDouble(100.0);
  RxDouble currentWeight = RxDouble(50.0);

  RxDouble bmi = RxDouble(0.0);

  RxDouble idealLowWeight = RxDouble(0);
  RxDouble idealHighWeight = RxDouble(0);
  RxDouble looseGain = RxDouble(0);

  final GetStorage storage = GetStorage();
  RxList<Map<String, String>> records = <Map<String, String>>[].obs;
  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    loadRecords();
  }

  void bmiFunction() {
    double heightInMeters = currentHeight.value / 100;
    double calculatedBmi =
        currentWeight.value / (heightInMeters * heightInMeters);

    bmi.value = calculatedBmi;

    idealLowWeight.value = 18.5 * (heightInMeters * heightInMeters);
    idealHighWeight.value = 24.5 * (heightInMeters * heightInMeters);
    if (bmi.value > 24.9) {
      looseGain.value = currentWeight.value - idealHighWeight.value;
    } else {
      looseGain.value = idealHighWeight.value - currentWeight.value;
    }
  }

  getBmiCategory() {
    if (bmi < 18.5) {
      return el.tr("underweight").toString(); // Localized string
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return el.tr("normal").toString(); // Localized string
    } else if (bmi >= 25 && bmi < 29.9) {
      return el.tr("overweight").toString(); // Localized string
    } else if (bmi >= 30 && bmi < 39.9) {
      return el.tr("obese").toString(); // Localized string
    } else {
      return el.tr("seriously_obese").toString(); // Localized string
    }
  }

  getBmiCategoryRecord(bmii) {
    if (bmii < 18.5) {
      return el.tr("underweight").toString(); // Localized string
    } else if (bmii >= 18.5 && bmii < 24.9) {
      return el.tr("normal").toString(); // Localized string
    } else if (bmii >= 25 && bmii < 29.9) {
      return el.tr("overweight").toString(); // Localized string
    } else if (bmii >= 30 && bmii < 39.9) {
      return el.tr("obese").toString(); // Localized string
    } else {
      return el.tr("seriously_obese").toString(); // Localized string
    }
  }

  getBmiColor() {
    if (bmi < 18.5) {
      return AppColor.underBlue;
    } else if (bmi >= 18.5 && bmi < 24.9) {
      return AppColor.normalGreen;
    } else if (bmi >= 25 && bmi < 29.9) {
      return AppColor.overYellow;
    } else if (bmi >= 30 && bmi < 39.9) {
      return AppColor.obeseOrange;
    } else {
      return AppColor.seriousObeseRed;
    }
  }

  void saveResult() {
    final currentDate = DateFormat('dd MMM yyyy').format(DateTime.now());
    final record = {
      'date': currentDate,
      'bmi': bmi.toStringAsFixed(1),
      'weight': currentWeight.toStringAsFixed(1),
    };

    records.add(record);
    box.write('records', records);
  }

  void loadRecords() {
    final storedRecords = box.read<List<dynamic>>('records') ?? [];
    records.value = storedRecords
        .map((record) => Map<String, String>.from(record))
        .toList();
  }

  void tipsRoute(context) {
    if (bmi < 18.5) {
      Get.to(() => const Underweight());
    } else if (bmi >= 18.5 && bmi < 24.9) {
      Get.to(() => const NormalWeight());
    } else if (bmi >= 25 && bmi < 29.9) {
      Get.to(() => const OverWeight());
    } else if (bmi >= 30 && bmi < 39.9) {
      Get.to(() => const Obese());
    } else {
      Get.to(() => const SeriouslyObese());
    }
  }

  void tipsRoute2() {
    if (bmi < 18.5) {
      Get.to(() => const Underweight());
    } else if (bmi >= 18.5 && bmi < 24.9) {
      Get.to(() => const NormalWeight());
    } else if (bmi >= 25 && bmi < 29.9) {
      Get.to(() => const OverWeight());
    } else if (bmi >= 30 && bmi < 39.9) {
      Get.to(() => const Obese());
    } else {
      Get.to(() => const SeriouslyObese());
    }
  }

  tipsRouteRecord(context, bmii) {
    if (bmii < 18.5) {
      return Underweight.pageRoute;
    } else if (bmii >= 18.5 && bmii < 24.9) {
      return NormalWeight.pageRoute;
    } else if (bmii >= 25 && bmii < 29.9) {
      return OverWeight.pageRoute;
    } else if (bmii >= 30 && bmii < 39.9) {
      return Obese.pageRoute;
    } else {
      return SeriouslyObese.pageRoute;
    }
  }
}
