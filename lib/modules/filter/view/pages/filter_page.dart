import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/constant/size/app_size.dart';
import '../../../main/view/widgets/custom_image.dart';
import '../../../main/view/widgets/custom_text.dart';
import '../../controller/filter_controller.dart';
import '../widgets/row_dropdown_button.dart';

class FilterPage extends StatelessWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RowDropdownButton(),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<FilterController>(
                builder: (controller) => Expanded(
                      child: SingleChildScrollView(
                          child: ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: controller.secondSelected == 'Newest'
                            ? controller.articlesByCountries.length
                            : controller.articlesReverse.length,
                        itemBuilder: (context, index) => Column(
                          children: [
                            Container(
                              child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10)),
                                  child: CustomImage(
                                    image: controller.secondSelected == 'Newest'
                                        ? controller.articlesByCountries[index]
                                            .urlToImage
                                        : controller
                                            .articlesReverse[index].urlToImage,
                                    boxFit: BoxFit.fill,
                                    height:
                                        AppSize.screenHeight(context: context) *
                                            0.25,
                                    width:
                                        AppSize.screenWidth(context: context) *
                                            0.9,
                                  )),
                            ),
                            // const SizedBox(
                            //   height: 15,
                            // ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.only(
                                  bottom: 10, right: 19, top: 0, left: 19),
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColorDark,
                                  borderRadius: const BorderRadius.only(
                                      bottomRight: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: Column(
                                children: [
                                  CustomText(
                                    text: controller
                                            .articlesByCountries[index].title ??
                                        "No Data".tr,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            color: Theme.of(context).hintColor),
                                    textAlign: TextAlign.left,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  CustomText(
                                    text: controller.articlesByCountries[index]
                                            .description ??
                                        "No Description".tr,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .displayMedium
                                        ?.copyWith(
                                            color: Theme.of(context)
                                                .highlightColor),
                                    // color: AppColors.black38,
                                    // fontWeight: FontWeight.w500,
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )),
                    ))
          ],
        ),
      ),
    ));
  }
}
