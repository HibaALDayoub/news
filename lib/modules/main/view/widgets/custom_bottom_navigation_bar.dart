import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';

import '../../controller/main_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});
  MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        unselectedItemColor: AppColors.secondaryColor,
        onTap: (value) {
          controller.selectedIndex = value;
          controller.update();
        },
        selectedIconTheme: IconThemeData(
          color: Theme.of(context)
              .bottomNavigationBarTheme
              .selectedIconTheme
              ?.color,
        ),
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home".tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: "Favorite".tr,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.filter),
            label: "Filter".tr,
          )
        ],
      ),
    );
  }
}
