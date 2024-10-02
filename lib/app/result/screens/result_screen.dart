import 'package:bmi_calculator/app/controllers/ads_controller.dart';
import 'package:bmi_calculator/app/controllers/home_controller.dart';
import 'package:bmi_calculator/app/record/screens/record_screen.dart';
import 'package:bmi_calculator/app/result/widgets/custom_result_bmi.dart';
import 'package:bmi_calculator/app/result/widgets/custom_result_text.dart';
import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:bmi_calculator/app/widgets/custom_button.dart';
import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class ResultScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  final AdsController adsController = Get.put(AdsController());

  static const pageRoute = "/result-screen";

  ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: el.tr('result'), // Translation
        backIconTrue: true,
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
            verticalSpace(twentyPixelHeight(context)),
            Container(
              width: twentyPixelWidth(context) * 11,
              height: twentyPixelWidth(context) * 11,
              decoration: BoxDecoration(
                  color: AppColor.blueColor,
                  borderRadius: BorderRadius.circular(300),
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.blueColor.withOpacity(.8),
                      spreadRadius: 5,
                      blurRadius: 23, // changes position of shadow
                    ),
                  ]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    el.tr('bmi'), // Translation
                    textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                    style: const TextStyle(
                      fontSize: 20,
                      color: AppColor.whiteColor,
                      fontWeight: FontWeight.w300,
                      fontFamily: "Poppins",
                    ),
                  ),
                  Text(
                    controller.bmi.toStringAsFixed(1),
                    textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                    style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: AppColor.whiteColor,
                      fontFamily: "PoppinsBold",
                    ),
                  ),
                  Text(
                    controller.getBmiCategory(),
                    textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: controller.getBmiColor(),
                      fontFamily: "Poppins",
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(twentyPixelHeight(context)),
            Container(
              decoration: BoxDecoration(
                color: AppColor.lightBlue.withOpacity(.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: twentyPixelWidth(context) * .5,
                  right: twentyPixelWidth(context) * .5,
                  top: twentyPixelHeight(context) * .8,
                  bottom: twentyPixelHeight(context) * .8,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomResultText(
                      leftTextt: el.tr(
                          'you_need_to',
                          namedArgs: {'action': controller.bmi < 18.5 ? el.tr('gain') : el.tr('lose')}
                      ), // Translation with condition
                      rightTextt: "${controller.looseGain.toStringAsFixed(1)} kg",
                      leftBold: false,
                      rightBold: true,
                    ),
                    verticalSpace(twentyPixelHeight(context) * .5),
                    CustomResultText(
                      leftTextt: el.tr('your_ideal_weight'), // Translation
                      rightTextt: "${controller.idealLowWeight.toStringAsFixed(1)}-${controller.idealHighWeight.toStringAsFixed(1)} kg",
                      leftBold: false,
                      rightBold: true,
                    ),
                  ],
                ),
              ),
            ),
            verticalSpace(twentyPixelHeight(context)),
            const CustomResultBmi(),
            const Expanded(child: SizedBox()),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      controller.tipsRoute(context);
                    },
                    child: CustomButton(
                      btnTextt: el.tr('tips'), // Translation
                      whiteBtnTrue: true,
                    ),
                  ),
                ),
                horizontalSpace(twelvePixelWidth(context)),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Get.to(() => RecordScreen());
                      controller.saveResult();
                    },
                    child: CustomButton(
                      btnTextt: el.tr('save'), // Translation
                      whiteBtnTrue: true,
                    ),
                  ),
                ),
              ],
            ),
            verticalSpace(twentyPixelHeight(context) * .5),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: CustomButton(
                btnTextt: el.tr('re_calculate'), // Translation
              ),
            ),
            verticalSpace(twentyPixelHeight(context) * 1.5),
          ],
        ),
      ),
    );
  }
}
