import 'package:flutter/material.dart';

import '../../../core/constant/size/app_size.dart';
import '../../home/widgets/home_hot_news.dart';
import '../../main/view/widgets/custom_button.dart';
import '../../main/view/widgets/custom_image.dart';
import '../../main/view/widgets/custom_text.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Padding(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(children: [
          Stack(
            children: [
              Column(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      child: CustomImage(
                        // image: controller.articleModel[index].urlToImage,
                        image:
                            "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
                        boxFit: BoxFit.fill,
                        height: AppSize.screenHeight(context: context) * 0.25,
                        width: AppSize.screenWidth(context: context) * 0.9,
                      )),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: const Column(
                      children: [
                        CustomText(
                          text:
                              //  controller.articleModel[index].title ??
                              "No Data ",
                          textAlign: TextAlign.left,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        CustomText(
                          text:
                              // controller.articleModel[index].description ??
                              "No Description ..... ..",
                          color: Colors.black38,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(12),
                    child: Icon(
                      Icons.close,
                      size: 30,
                      textDirection: TextDirection.rtl,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text("kkk"),
          CustomButton(
            text: "Remove All",
            height: 190,
            textColor: Colors.indigo,
            color: const Color.fromARGB(255, 4, 11, 14),
          )
        ]),
      ),
    )));
  }
}
