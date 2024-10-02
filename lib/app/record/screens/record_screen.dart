import 'package:bmi_calculator/app/controllers/home_controller.dart';
import 'package:bmi_calculator/app/home/screens/home_screen.dart';
import 'package:bmi_calculator/app/record/widgets/custom_record_item.dart';
import 'package:bmi_calculator/app/widgets/custom_appbar.dart';
import 'package:bmi_calculator/app/widgets/custom_button.dart';
import 'package:bmi_calculator/general/config/colors.dart';
import 'package:bmi_calculator/general/utils/responsive.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' hide Trans; // Hiding `Trans` to avoid conflict
import 'package:easy_localization/easy_localization.dart' as el; // Using alias for easy_localization

class RecordScreen extends StatelessWidget {
  static const pageRoute = "/record-screen";
  final HomeController controller = Get.find<HomeController>();
  RecordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        titlee: "record".tr(),  // Translate the title
        backIconTrue: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: twentyPixelHeight(context) * 1.5),
              child: Obx(() {
                // Observe changes in the records list
                if (controller.records.isEmpty) {
                  return Center(
                    child: Text(
                      "no_record_found".tr(),  // Translate "No record found"
                      style: const TextStyle(fontSize: 40),
                    ),
                  );
                } else {
                  return ListView.builder(
                    itemCount: controller.records.length,
                    itemBuilder: (context, index) {
                      final record = controller.records[index];
                      final dateParts = record['date']?.split(' ') ?? [];
                      final day = dateParts.isNotEmpty ? dateParts[0] : "";
                      final month = dateParts.length > 1 ? dateParts[1] : "";

                      return CustomRecordItem(
                        routeNamee: controller.tipsRouteRecord(
                            context, double.parse(record['bmi']!)),
                        bmiiText: controller.getBmiCategoryRecord(
                            double.parse(record['bmi']!)),
                        bmii: record['bmi'] ?? "",
                        colorr: AppColor.lightBlue,
                        datee: day, // Just show the day
                        monthh: month, // Show the month
                        weightt: record['weight']?.toString() ?? "",
                      );
                    },
                  );
                }
              }),
            ),
          ),
          InkWell(
            onTap: () {
              Get.toNamed(HomeScreen.pageRoute);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                btnTextt: "recalculate".tr(),  // Translate "Re-Calculate"
              ),
            ),
          ),
        ],
      ),
    );
  }
}
