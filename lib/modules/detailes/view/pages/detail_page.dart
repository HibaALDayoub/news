import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';
import 'package:news_project/modules/main/view/widgets/custom_image.dart';
import '../../../../core/constant/size/app_size.dart';

import '../../controller/detaile_controller.dart';
import '../widgets/shared/custom_details_text_info.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final DetailController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  CustomImage(
                    image: controller.articleModel.urlToImage,
                    boxFit: BoxFit.fill,
                    height: AppSize.screenHeight(context: context) * 0.32,
                    width: AppSize.screenWidth(context: context),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                        opacity: 0.3,
                        child: Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColors.secondaryColor,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back),
                            iconSize: 25,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                      // Container(
                      //   margin: EdgeInsets.all(10),
                      //   height: 50,
                      //   width: 50,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(10),
                      //     color: AppColors.secondaryColor.withOpacity(0.6),
                      //   ),
                      // )
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDetailsTextInfo(
                      title: "Description".tr,
                      text: controller.articleModel.title ?? "No Title".tr,
                      isIconFav: true),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDetailsTextInfo(
                    text: controller.articleModel.description ??
                        "No Description".tr,
                    title: "Content".tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDetailsTextInfo(
                    text: "${controller.articleModel.content}",
                    title: "Author".tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDetailsTextInfo(
                    title: "Published At".tr,
                    text: controller.articleModel.author ?? "no author".tr,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomDetailsTextInfo(
                    text: controller.articleModel.publishedAt ??
                        "2023-07-06 15:01:27.000z".tr,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
