import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/routes/app_routes.dart';
import 'package:news_project/core/theme/controller/theme_controller.dart';
import 'package:news_project/modules/main/view/widgets/custom_text.dart';
import '../../../../core/constant/colors/app_colors.dart';
import '../../../../core/constant/size/app_size.dart';
import '../../../../core/helper/localization/localization_helper.dart';
import '../../../../core/localization/controller/localization_controller.dart';
import '../../../home/controller/home_controller.dart';
import 'custom_row_drawer.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    LocalizationController localizationController = Get.find();
    return Container(
        height: AppSize.screenHeight(context: context) * 0.81,
        width: AppSize.screenWidth(context: context) * 0.6,
        child: Drawer(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(LocalaizationHelper.isEn() ? 40 : 0),
                topLeft: Radius.circular(LocalaizationHelper.isEn() ? 0 : 40),
                bottomLeft:
                    Radius.circular(LocalaizationHelper.isEn() ? 0 : 40),
                bottomRight:
                    Radius.circular(LocalaizationHelper.isEn() ? 40 : 0),
              ),
            ),
            shadowColor: AppColors.black38,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(AppRoutes.helpSupport);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 14, left: 10),
                      child: CustomRowDrawer(
                        icon: const Icon(Icons.help),
                        iconColor: AppColors.primaryColor,
                        textInDrawer: 'Help & Support'.tr,
                        // onPressed:
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 3,
                    color: AppColors.grey,
                    height: 25,
                  ),
                  GestureDetector(
                    onTap: () {
                      HomeController homeController = Get.find();
                      homeController.isVisible = !homeController.isVisible;
                      homeController.update();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomRowDrawer(
                        icon: const Icon(Icons.settings),
                        iconColor: AppColors.primaryColor,
                        textInDrawer: "Settings".tr,
                        backIcon: true,
                      ),
                    ),
                  ),
                  GetBuilder<HomeController>(builder: (controller) {
                    return Visibility(
                        visible: controller.isVisible,
                        child: Container(
                          width: AppSize.screenWidth(context: context) * 0.97,
                          height: AppSize.screenHeight(context: context) * 0.15,
                          // padding: EdgeInsets.symmetric(vertical: 20),
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Theme.of(context).primaryColorDark
                              // color: Color.fromARGB(255, 89, 87, 87)

                              ),
                          child: Column(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    print(localizationController.language);
                                    localizationController.changeLanguage(
                                        localizationController
                                                    .language.languageCode ==
                                                'ar'
                                            ? 'en'
                                            : 'ar');

                                    controller.getNewsData();
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 15),
                                      child: localizationController
                                                  .language.languageCode ==
                                              'ar'
                                          ? Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                    text: "Language :".tr),
                                                CustomText(text: "en".tr)
                                              ],
                                            )
                                          : Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CustomText(
                                                    text: "Language :".tr),
                                                CustomText(text: "ar".tr)
                                              ],
                                            ))),
                              GetBuilder<ThemeController>(
                                  builder: (controller) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                        text: controller.switchTheme == true
                                            ? "Dark mode".tr
                                            : "Light mode".tr),
                                    Switch(
                                        activeColor: AppColors.primaryColor,
                                        value: controller.switchTheme!,
                                        onChanged: (value) {
                                          controller.changeTheme(value);
                                        })
                                  ],
                                );
                              })
                            ],
                          ),
                        ));
                  })
                ],
              ),
            )));
  }
}
