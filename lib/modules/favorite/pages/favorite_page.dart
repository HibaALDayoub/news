import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';
import 'package:news_project/modules/favorite/controller/favorite_controller.dart';

import '../../../core/constant/size/app_size.dart';
import '../../main/view/widgets/custom_button.dart';
import '../../main/view/widgets/custom_image.dart';
import '../../main/view/widgets/custom_text.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  // FavoriteController controller = Get.find();
  final FavoriteController controller = Get.put(FavoriteController());
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.all(15),
      child: Column(children: [
        GetBuilder<FavoriteController>(
          builder: (controller) => Expanded(
              child: SingleChildScrollView(
            child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => Column(
                      children: [
                        Stack(
                          children: [
                            Column(
                              children: [
                                ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: CustomImage(
                                      image: controller
                                          .favoriteList[index].urlToImage,
                                      boxFit: BoxFit.fill,
                                      height: AppSize.screenHeight(
                                              context: context) *
                                          0.25,
                                      width: AppSize.screenWidth(
                                              context: context) *
                                          0.9,
                                    )),
                                // const SizedBox(
                                //   height: 15,
                                // ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(
                                      bottom: 10, right: 4, top: 0, left: 4),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColorDark,
                                      borderRadius: const BorderRadius.only(
                                          bottomRight: Radius.circular(10),
                                          bottomLeft: Radius.circular(10))),
                                  child: Column(
                                    children: [
                                      CustomText(
                                        text: controller
                                                .favoriteList[index].title ??
                                            "No Data".tr,
                                        textAlign: TextAlign.left,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      CustomText(
                                        text: controller.favoriteList[index]
                                                .description ??
                                            "No Description".tr,
                                        textAlign: TextAlign.left,
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displayMedium
                                            ?.copyWith(
                                                color: Theme.of(context)
                                                    .highlightColor),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: IconButton(
                                    onPressed: () {
                                      controller.delete(index);
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 30,
                                      textDirection: TextDirection.rtl,
                                      color: AppColors.primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    height: 10,
                  );
                },
                itemCount: controller.favoriteList.length),
          )),
        ),
        const SizedBox(
          height: 10,
        ),
        CustomButton(
          onTap: () {
            controller.favoriteList.clear();
            controller.update();
            controller.favoriteDataImp.setData(controller.favoriteList);
          },
          text: "Remove All".tr,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          height: 50,
          minWidth: 100,
          textColor: AppColors.whiteColor,
          color: AppColors.primaryColor,
        )
      ]),
    )));
  }
}
