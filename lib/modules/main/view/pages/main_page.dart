import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';
import '../../controller/main_controller.dart';
import '../widgets/custom_Bottom_navigation_bar.dart';
import '../widgets/custom_drawer.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Get.put(MainController);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Text(
                  "News".tr,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: AppColors.primaryColor),
            drawer: CustomDrawer(),
            bottomNavigationBar: CustomBottomNavigationBar(),
            body: GetBuilder<MainController>(
              builder: (controller) {
                return controller.mainWidgets
                    .elementAt(controller.selectedIndex);
              },
            )));
  }
}
