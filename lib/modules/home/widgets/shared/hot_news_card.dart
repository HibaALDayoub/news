import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';

import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/constant/size/app_size.dart';

import '../../../main/view/widgets/custom_image.dart';
import '../../../main/view/widgets/custom_text.dart';
import '../../controller/home_controller.dart';

class HotNewsCard extends StatelessWidget {
  HotNewsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        builder: (controller) => Container(
            height: AppSize.screenHeight(context: context) * 0.3,
            child: ListView.separated(
              itemCount: controller.articleModel.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 10,
              ),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CustomImage(
                        boxFit: BoxFit.fill,
                        image: controller.articleModel[index].urlToImage,
                        height: AppSize.screenHeight(context: context) * 0.25,
                        width: 310,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        log("____${controller.articleModel[index].url}");
                        Get.toNamed(AppRoutes.viewDetails, arguments: {
                          "model": controller.articleModel[index],
                        });
                      },
                      child: Container(
                        height: AppSize.screenHeight(context: context) * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor.withOpacity(0.4)),
                        width: 310,
                        padding: const EdgeInsets.only(
                            bottom: 10, top: 125, left: 10, right: 10),
                        alignment: Alignment.bottomLeft,
                        child: CustomText(
                          text: controller.articleModel[index].title ?? "",
                          textAlign: TextAlign.left,
                          textStyle: Theme.of(context)
                              .textTheme
                              .displayMedium
                              ?.copyWith(color: AppColors.whiteColor),
                        ),
                      ),
                    )
                  ],
                );
              },
            )));
  }
}
