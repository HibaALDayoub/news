import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/generated/l10n.dart';

import '../../controller/main_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  CustomBottomNavigationBar({super.key});
  MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => BottomNavigationBar(
        currentIndex: controller.selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.black,
        onTap: (value) {
          controller.selectedIndex = value;
          controller.update();
        },
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: S.of(context).bnbHome,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite),
            label: S.of(context).bnbFavorite,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.filter),
            label: S.of(context).bnbFilter,
          )
        ],
      ),
    );
  }
}
