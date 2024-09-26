import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';
import 'package:news_project/generated/l10n.dart';

import '../../controller/main_controller.dart';
import '../widgets/custom_Bottom_navigation_bar.dart';
import '../widgets/custom_drawer.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  MainController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    Get.put(MainController);
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: Text(
                  S.of(context).titleAppBar,
                  textAlign: TextAlign.center,
                ),
                backgroundColor: AppColors.primaryColor),
            drawer: CustomDrawer(),
            bottomNavigationBar: CustomBottomNavigationBar(),
            body: GetBuilder<MainController>(
              builder: (controller) {
                return controller.mainWidgets
                    .elementAt(controller.selectedIndex);
                // return  controller.nameList[controller.nameVariable];
              },
            )));
  }
}
