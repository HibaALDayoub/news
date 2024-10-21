import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';

import 'package:news_project/core/constant/size/app_size.dart';
import 'package:news_project/modules/home/data/categories_static_data.dart';

import '../../../../core/constant/routes/app_routes.dart';
import '../../../main/view/widgets/custom_text.dart';

class CategoriesNews extends StatelessWidget {
  const CategoriesNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.screenHeight(context: context) * 0.1,
      child: ListView.separated(
        itemCount: categoriesList.length,
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Get.toNamed(AppRoutes.categoryDetails, arguments: {
              "categoryName": categoriesList[index].name,
            }),
            child: Container(
              height: 75,
              width: 75,
              decoration: BoxDecoration(
                  color: Theme.of(context).dialogBackgroundColor,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    categoriesList[index].image,
                    size: 35,
                    color: AppColors.primaryColor,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CustomText(
                      text: categoriesList[index].name,
                      textStyle: Theme.of(context).textTheme.displayMedium,
                      fontSize: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
