import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/routes/app_routes.dart';
import '../../../core/constant/size/app_size.dart';
import '../../main/view/widgets/custom_image.dart';
import '../../main/view/widgets/custom_text.dart';
import '../controller/home_controller.dart';

class HomeHotNews extends StatelessWidget {
  HomeHotNews({super.key});

  HomeController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.articleModel.length,
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
                    log("____${controller.articleModel[index].url}");
                    Get.toNamed(AppRoutes.viewDetails, arguments: {
                      "model": controller.articleModel[index],
                    });
                  },
                  child: CustomImage(
                    image: controller.articleModel[index].urlToImage,
                    boxFit: BoxFit.fill,
                    height: AppSize.screenHeight(context: context) * 0.25,
                    width: AppSize.screenWidth(context: context) * 0.9,
                  ),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              margin:
                  const EdgeInsets.only(bottom: 10, right: 9, top: 0, left: 9),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColorDark,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      bottomLeft: Radius.circular(10))),
              child: Column(
                children: [
                  CustomText(
                    text: controller.articleModel[index].title ?? "No Data".tr,
                    textAlign: TextAlign.left,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: Theme.of(context).hintColor),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: controller.articleModel[index].description ??
                        "No Description".tr,
                    // textStyle: Theme.of(context).textTheme.displayMedium,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayMedium
                        ?.copyWith(color: Theme.of(context).highlightColor),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
