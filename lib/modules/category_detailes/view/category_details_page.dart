import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';
import 'package:news_project/modules/category_detailes/controller/category_details_controller.dart';

import '../../../core/classes/status_request.dart';
import '../../../core/constant/routes/app_routes.dart';
import '../../../core/constant/size/app_size.dart';

import '../../main/view/widgets/custom_image.dart';
import '../../main/view/widgets/custom_text.dart';

class CategoryDetailsPage extends StatelessWidget {
  CategoryDetailsPage({super.key});

  // HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CategoryController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(child: CircularProgressIndicator())
            : (controller.statusRequest == StatusRequest.failure ||
                    controller.statusRequest == StatusRequest.offlineFailure)
                ? const SizedBox()
                : ListView.separated(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 50, bottom: 20),
                    itemCount: controller.articles.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: InkWell(
                                onTap: () {
                                  log("____${controller.articles[index].url}");
                                  Get.toNamed(AppRoutes.viewDetails,
                                      arguments: {
                                        "model": controller.articles[index],
                                      });
                                },
                                child: CustomImage(
                                  image: controller.articles[index].urlToImage,
                                  boxFit: BoxFit.fill,
                                  height:
                                      AppSize.screenHeight(context: context) *
                                          0.25,
                                  width: AppSize.screenWidth(context: context) *
                                      0.9,
                                ),
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                CustomText(
                                  text: controller.articles[index].title ??
                                      "No Data".tr,
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.secondaryColor,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomText(
                                  text:
                                      controller.articles[index].description ??
                                          "No Description".tr,
                                  color: AppColors.black38,
                                  fontWeight: FontWeight.w500,
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
      ),
    );
  }
}
