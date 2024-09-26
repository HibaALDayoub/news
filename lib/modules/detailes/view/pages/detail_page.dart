import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                            color: Colors.black,
                          ),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 35,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        height: 20,
                        width: 20,
                        color: Colors.blue,
                      )
                    ],
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDetailsTextInfo(
                        text: controller.articleModel.title ?? "No Title",
                        title: "Description : ",
                        isIconFav: true),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDetailsTextInfo(
                      text: controller.articleModel.description ??
                          "No Description kkkkkhhhfkkkkkkkkkkkkkkklllllllkk khhhredswekmnbkkkkkkkhhhredswekmnbkkkkkkkkkkkhhhredswekmnbvffkkkkkkkkkkkkkkkll kkkkkkkkkkkkkkkkkkkkkkkkkkkk",
                      title: "Content : ",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const CustomDetailsTextInfo(
                      text:
                          "______________________  kkkkkhhhfkkkkkkkkkkkkkkklllllllkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk ..[+22]",
                      title: "Author : ",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDetailsTextInfo(
                      title: "Published At  : ",
                      text: controller.articleModel.author ??
                          "kkkkkkkkkkkkkk kkkkkkk  kkkkkkkkkkk",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomDetailsTextInfo(
                      text: controller.articleModel.publishedAt ??
                          "2023-07-06 15:01:27.000z",
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
