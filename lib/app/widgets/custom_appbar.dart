import 'package:bmi_calculator/general/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Import GetX
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String titlee;
  final bool? backIconTrue;

  const CustomAppbar({
    super.key,
    required this.titlee,
    this.backIconTrue,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.blueColor,
      centerTitle: true,
      title: Text(
        el.tr(titlee), // Explicitly using easy_localization's tr() method
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: "Poppins",
          color: Colors.white,
        ),
      ),
      leading: backIconTrue == true
          ? IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back, color: AppColor.whiteColor),
      )
          : const SizedBox(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
