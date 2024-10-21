import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/classes/status_request.dart';
import 'package:news_project/modules/home/controller/home_controller.dart';
import '../../main/view/widgets/custom_text.dart';
import '../widgets/home_hot_news.dart';
import '../widgets/shared/categories_news.dart';
import '../widgets/shared/hot_news_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<HomeController>(
        builder: (controller) => controller.statusRequest ==
                StatusRequest.loading
            ? Center(child: CircularProgressIndicator())
            : (controller.statusRequest == StatusRequest.failure ||
                    controller.statusRequest == StatusRequest.offlineFailure)
                ? const SizedBox(
                    child: Text("failure,offlineFailure"),
                  )
                : SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomText(
                          text: "HotNews".tr,
                          textStyle: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        HotNewsCard(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "Categories".tr,
                          textStyle: Theme.of(context).textTheme.displayMedium,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        CategoriesNews(),
                        const SizedBox(
                          height: 20,
                        ),
                        CustomText(
                          text: "News".tr,
                          textStyle: Theme.of(context).textTheme.displayMedium,
                          // fontSize: 16
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        HomeHotNews(),
                      ],
                    ),
                  ),
      ),
    );
  }
}
