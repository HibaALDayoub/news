import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/size/app_size.dart';
import '../../../core/image_assests.dart';
import '../../main/controller/main_controller.dart';
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
                child: CustomImage(
                  image: controller.articleModel[index].urlToImage,
                  boxFit: BoxFit.fill,
                  height: AppSize.screenHeight(context: context) * 0.25,
                  width: AppSize.screenWidth(context: context) * 0.9,
                )),
            const SizedBox(
              height: 15,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  CustomText(
                    text: controller.articleModel[index].title ?? "No Data ",
                    textAlign: TextAlign.left,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomText(
                    text: controller.articleModel[index].description ??
                        "No Description ..... ..",
                    color: Colors.black38,
                    fontWeight: FontWeight.w500,
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
