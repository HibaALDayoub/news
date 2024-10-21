import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';
import 'package:news_project/modules/help&support/controller/help_support_controller.dart';
import 'package:news_project/modules/help&support/view/widget/custom_help_row.dart';
import 'package:news_project/modules/help&support/view/widget/cutom_help_page.dart';
import 'package:news_project/modules/main/view/widgets/custom_text.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
                title: CustomText(
                  text: "Help Support".tr,
                  textAlign: TextAlign.center,
                  textStyle: Theme.of(context)
                      .textTheme
                      .displayLarge
                      ?.copyWith(color: AppColors.whiteColor),
                ),
                backgroundColor: AppColors.primaryColor),
            body: GetBuilder<HelpSupportController>(builder: (controller) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "FAQ:".tr,
                        textStyle: Theme.of(context).textTheme.displayLarge,
                        textAlign: TextAlign.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                          onTap: () {
                            print(controller.isVisible2);
                            controller.isVisible2 = !controller.isVisible2;
                            print(controller.isVisible2);
                            controller.update();
                          },
                          child: CustomHelpRow(
                            text: "How to use this app".tr,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: controller.isVisible2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomHelpPage(
                                  text: "You need internet to see news".tr),
                              CustomHelpPage(
                                  text:
                                      "You can see all type of news from drawer then all news"
                                          .tr),
                              CustomHelpPage(
                                  text:
                                      "You can see the type of news you want from bottom bar"
                                          .tr),
                              CustomHelpPage(
                                  text:
                                      "You can change theme or language from drawer then settings"
                                          .tr),
                            ],
                          )),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: InkWell(
                            onTap: () {
                              print(controller.isVisible3);
                              controller.isVisible3 = !controller.isVisible3;
                              print(controller.isVisible3);
                              controller.update();
                            },
                            child: CustomHelpRow(text: "How made this app".tr)),
                      ),
                      Visibility(
                        visible: controller.isVisible3,
                        child: CustomText(
                          text: "This appa made by Hiba AL Dayoub".tr,
                          textStyle: Theme.of(context)
                              .textTheme
                              .displayLarge
                              ?.copyWith(
                                  color: AppColors.primaryColor, fontSize: 18),
                        ),
                      )
                    ]),
              );
            })));
  }
}
