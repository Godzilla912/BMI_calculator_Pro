import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX for localization
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomGenderBox extends StatefulWidget {
  const CustomGenderBox({super.key});

  @override
  State<CustomGenderBox> createState() => _CustomGenderBoxState();
}

class _CustomGenderBoxState extends State<CustomGenderBox> {
  int selectedIndex = 0;

  final List<String> genderNames = [
    "male",
    "female"
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: twelvePixelWidth(context),
      ),
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: genderNames.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: twentyPixelWidth(context) * 5,
                    height: twentyPixelWidth(context) * 5,
                    decoration: BoxDecoration(
                      color: selectedIndex == index
                          ? AppColor.blueColor
                          : AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x3F000000),
                          blurRadius: 10,
                          offset: Offset(5, 5),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Center(
                      child: Image.asset(
                        "assets/images/${genderNames[index]}_${selectedIndex == index ? "w" : "b"}.png",
                        width: twentyPixelWidth(context) * 3,
                        height: twentyPixelWidth(context) * 3,
                      ),
                    ),
                  ),
                  SizedBox(height: 8), // Add some spacing between the image and text
                  Text(
                    el.tr(genderNames[index]), // Localized text
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColor.blackColor,
                      fontSize: 16,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    textScaler: TextScaler.linear(ScaleSize.textScaleFactor(context)),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
