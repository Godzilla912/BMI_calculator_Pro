import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/blank_space.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawerRow extends StatelessWidget {
  final String textt;
  final Widget widgett;
  final String routee;
  const CustomDrawerRow(
      {super.key,
      required this.textt,
      required this.widgett,
      required this.routee});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: twentyPixelHeight(context) * .5),
      child: InkWell(
        onTap: () {
          routee!= ""?Get.toNamed(routee): debugPrint("");
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widgett,
            horizontalSpace(twelvePixelWidth(context) * 1),
            Text(
              textt,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  fontFamily: "Poppins",
                  color: AppColor.whiteColor),
                  textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
            ),
          ],
        ),
      ),
    );
  }
}
