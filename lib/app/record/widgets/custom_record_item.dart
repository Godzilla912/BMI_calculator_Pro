import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding Trans to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomRecordItem extends StatelessWidget {
  final String monthh;
  final String datee;
  final String bmii;
  final String weightt;
  final Color colorr;
  final String bmiiText;
  final String routeNamee;
  const CustomRecordItem({
    super.key,
    required this.monthh,
    required this.datee,
    required this.bmii,
    required this.weightt,
    required this.colorr,
    required this.bmiiText,
    required this.routeNamee,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        bottom: twentyPixelHeight(context) * .8,
        left: twentyPixelWidth(context),
        right: twentyPixelWidth(context),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                monthh.tr(), // Translation
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Poppins",
                  color: AppColor.blackColor,
                ),
                textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
              Text(
                datee.tr(), // Translation
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Poppins",
                  color: AppColor.blackColor,
                ),
                textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
              ),
            ],
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: twentyPixelWidth(context)),
              padding: EdgeInsets.symmetric(
                horizontal: twentyPixelWidth(context) * .5,
                vertical: twentyPixelHeight(context) * .5,
              ),
              decoration: BoxDecoration(
                  color: AppColor.veryLiteBlue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7, // changes position of shadow
                        offset: const Offset(0, 5)),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            bmii,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                color: AppColor.blackColor),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                          ),
                          horizontalSpace(twentyPixelWidth(context) * .25),
                          Text(
                            el.tr('bmi'), // Translation
                            style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: AppColor.blackColor),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                          ),
                        ],
                      ),
                      verticalSpace(twentyPixelHeight(context) * .25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            weightt,
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                fontFamily: "Poppins",
                                color: AppColor.blackColor),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                          ),
                          horizontalSpace(twentyPixelWidth(context) * .25),
                          Text(
                            el.tr('kg'), // Translation
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Poppins",
                                color: AppColor.blackColor),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: twentyPixelWidth(context) * .25,
                        right: twentyPixelWidth(context) * .25,
                      ),
                      child: Text(
                        textAlign: TextAlign.center,
                        bmiiText.tr(), // Translation
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: "Poppins",
                            color: AppColor.blackColor),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Get.toNamed(routeNamee);
                    },
                    child: Container(
                      width: twentyPixelWidth(context) * 3,
                      height: twentyPixelHeight(context) * 1.5,
                      decoration: BoxDecoration(
                          color: AppColor.blueColor,
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                          child: Text(
                            el.tr('tips'), // Translation
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: "Poppins",
                                color: AppColor.whiteColor),
                            textScaler: TextScaler.linear(
                                ScaleSize.textScaleFactor(context)),
                          )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
