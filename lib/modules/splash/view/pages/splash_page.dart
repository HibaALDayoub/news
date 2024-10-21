import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_project/modules/main/view/widgets/custom_button.dart';
import 'package:news_project/modules/main/view/widgets/custom_text.dart';

import '../../../../core/constant/routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          const SizedBox(
            height: 70,
          ),
          SizedBox(
            child: Lottie.asset(
              'assets/images/start.json',
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
                margin: const EdgeInsets.only(top: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                child: CustomText(
                  text: "Best Experience To See News Around The Word".tr,
                  textAlign: TextAlign.center,
                  textStyle: Theme.of(context).textTheme.displayMedium,
                )),
          ),
          CustomButton(
            text: "Next".tr,
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
