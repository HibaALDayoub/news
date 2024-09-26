import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                  color: const Color.fromARGB(255, 247, 214, 214),
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    categoriesList[index].image,
                    size: 35,
                    color: Colors.red,
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  CustomText(
                      text: categoriesList[index].name,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
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
