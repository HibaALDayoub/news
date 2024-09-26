import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_project/modules/category_detailes/controller/category_details_controller.dart';

import '../../../core/classes/status_request.dart';
import '../../../core/constant/size/app_size.dart';

import '../../main/view/widgets/custom_image.dart';
import '../../main/view/widgets/custom_text.dart';

class CategoryDetailsPage extends StatelessWidget {
  const CategoryDetailsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<CategoryController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? const Center(child: CircularProgressIndicator())
            : (controller.statusRequest == StatusRequest.failure ||
                    controller.statusRequest == StatusRequest.offlineFailure)
                ? const SizedBox()
                : ListView.separated(
                    itemCount: controller.articles.length,
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
                                image: controller.articles[index].urlToImage,
                                boxFit: BoxFit.fill,
                                height: AppSize.screenHeight(context: context) *
                                    0.25,
                                width:
                                    AppSize.screenWidth(context: context) * 0.9,
                              )),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                CustomText(
                                  text: controller.articles[index].title ??
                                      "No Data ",
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                CustomText(
                                  text:
                                      controller.articles[index].description ??
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
                  ),
      ),
    );
    // return SafeArea(
    //     child: Scaffold(
    //   body: Container(child: Text("CategoryDetailsPage")),
    // ));
  }
}
