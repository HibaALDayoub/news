import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/modules/main/view/widgets/custom_button.dart';
import 'package:news_project/modules/main/view/widgets/custom_image.dart';
import 'package:news_project/modules/main/view/widgets/custom_text.dart';

import '../../../../core/constant/colors/app_colors.dart';

import '../../../../core/constant/routes/app_routes.dart';
import '../../../../core/image_assests.dart';
import '../../../../generated/l10n.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          const SizedBox(
              child: Image(
            image: AssetImage(ImageAsset.onBoardingImageOne),
            fit: BoxFit.fill,
          )

              // CustomImage(
              //     image: ImageAsset.onBoardingImageOne, boxFit: BoxFit.fill),
              ),
          Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: CustomText(
                    text: S.of(context).textSplash,
                    // text: "Best Experience To See News Around The Word",
                    textAlign: TextAlign.center,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16)),
          ),
          CustomButton(
            // text: "Next",
            text: S.of(context).btnNext,
            height: 50,
            onTap: () {
              Get.toNamed(AppRoutes.mainRoute);
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    ));
  }
}
