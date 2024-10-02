import 'package:bmi_calculator/app/controllers/ads_controller.dart';
import 'package:bmi_calculator/app/controllers/home_controller.dart';
import 'package:bmi_calculator/app/home/widgets/custom_banner_file.dart';
import 'package:bmi_calculator/app/home/widgets/custom_container_row.dart';
import 'package:bmi_calculator/app/home/widgets/custom_home_drawer.dart';
import 'package:bmi_calculator/app/record/screens/record_screen.dart';
import 'package:bmi_calculator/app/result/screens/result_screen.dart';
import 'package:bmi_calculator/app/widgets/custom_button.dart';
import 'package:bmi_calculator/app/widgets/custom_gender_btn.dart';
import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/config/config.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding `Trans` to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class HomeScreen extends StatelessWidget {
  static const pageRoute = "/home-screen";
  final HomeController controller = Get.put(HomeController());
  final AdsController adsController = Get.put(AdsController());

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: const CustomHomeDrawer(),
      appBar: AppBar(
        backgroundColor: AppColor.blueColor,
        centerTitle: true,
        title: Text(
          el.tr("app_name"), // Use `tr()` from easy_localization
          style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              fontFamily: "Poppins",
              color: Colors.white),
          textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
        ),
        leading: InkWell(
          onTap: () {
            _key.currentState?.openDrawer();
          },
          child: Center(
            child: Image.asset(
              "assets/images/menu.png",
              width: twentyPixelWidth(context) * 1.5,
              height: twentyPixelHeight(context) * 1.5,
            ),
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => RecordScreen());
            },
            child: Center(
              child: Image.asset(
                "assets/images/edit.png",
                width: twentyPixelWidth(context) * 1.5,
                height: twentyPixelHeight(context) * 1.5,
              ),
            ),
          ),
          SizedBox(width: twelvePixelWidth(context) * .5),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: twentyPixelWidth(context),
          right: twentyPixelWidth(context),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            verticalSpace(twentyPixelHeight(context) * 4),
            const CustomGenderBox(),
            verticalSpace(twentyPixelHeight(context)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: twentyTwoPixelWidth(context) * .5,
                vertical: twentyPixelHeight(context) * .5,
              ),
              decoration: BoxDecoration(
                color: AppColor.lightBlue.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return CustomContainerRow(
                      fieldName: el.tr("height"), // Use `tr()` from easy_localization
                      fieldType: el.tr("cm"), // Change to "cm" for centimeters
                      fieldFirstParameter:
                      "${controller.currentHeight.value.toInt()} cm", // Show only centimeters
                    );
                  }),
                  Obx(() {
                    return Slider(
                      value: controller.currentHeight.value,
                      min: 70,
                      max: 250,
                      activeColor: AppColor.blueColor,
                      label: controller.currentHeight.value.toStringAsFixed(1),
                      onChanged: (double value) {
                        controller.currentHeight(value);
                      },
                    );
                  }),
                ],
              ),
            ),
            verticalSpace(twentyPixelHeight(context)),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: twentyTwoPixelWidth(context) * .5,
                vertical: twentyPixelHeight(context) * .5,
              ),
              decoration: BoxDecoration(
                color: AppColor.lightBlue.withOpacity(.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    return CustomContainerRow(
                      fieldName: el.tr("weight"), // Use `tr()` from easy_localization
                      fieldType: el.tr("kg"), // Use `tr()` from easy_localization
                      fieldFirstParameter:
                      "${(controller.currentWeight.value).toInt()} KG",
                    );
                  }),
                  Obx(() {
                    return Slider(
                      value: controller.currentWeight.value,
                      min: 25,
                      max: 200,
                      label: controller.currentWeight.value.toStringAsFixed(1),
                      onChanged: (double value) {
                        controller.currentWeight(value);
                      },
                      activeColor: AppColor.blueColor,
                    );
                  }),
                ],
              ),
            ),
            const Expanded(child: SizedBox()),
            InkWell(
              onTap: () {
                controller.bmiFunction();
                Get.to(() => ResultScreen());
              },
              child: CustomButton(
                btnTextt: el.tr("calculate"), // Use `tr()` from easy_localization
              ),
            ),
            verticalSpace(twentyPixelHeight(context) * .5),
          ],
        ),
      ),
      bottomNavigationBar: AppConfig.bannerAdsUnitID != ""
          ? const CustomBannerFile()
          : const SizedBox(),
    );
  }
}
