import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';
import 'package:news_project/modules/detailes/controller/detaile_controller.dart';

import '../../../../main/view/widgets/custom_text.dart';

class CustomDetailsTextInfo extends StatelessWidget {
  const CustomDetailsTextInfo(
      {super.key, required this.text, this.title, this.isIconFav = false});
  final String text;
  final String? title;
  final bool isIconFav;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomText(
            text: text,
            color: AppColors.primaryColor,
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                CustomText(
                  text: title ?? "",
                  textStyle: Theme.of(context)
                      .textTheme
                      .displayMedium
                      ?.copyWith(color: AppColors.primaryColor),
                ),
              ],
            ),
            Column(
              children: [
                if (isIconFav)
                  Container(
                    width: 70,
                    height: 40,
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            topLeft: Radius.circular(45))),
                    child: GetBuilder<DetailController>(builder: (controller) {
                      return IconButton(
                        icon: Icon(
                          Icons.favorite_outline,
                          color: controller.isFavorite
                              ? AppColors.primaryColor
                              : null,
                        ),
                        onPressed: () {
                          if (controller.isFavorite == false) {
                            controller.addDataToFav();
                          } else {
                            controller.delete();
                          }
                        },
                      );
                    }),
                  ),
              ],
            )
          ],
        )
      ],
    );
  }
}
