import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

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
      body: Column(
        children: [
          RowDropdownButton(),
          SizedBox(
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
                          ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              child: CustomImage(
                                image: controller.secondSelected == 'Newest'
                                    ? controller
                                        .articlesByCountries[index].urlToImage
                                    : controller
                                        .articlesReverse[index].urlToImage,
                                // "https://st3.depositphotos.com/23594922/31822/v/450/depositphotos_318221368-stock-illustration-missing-picture-page-for-website.jpg",
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
                                  text: controller
                                          .articlesByCountries[index].title ??
                                      "No Data ",
                                  textAlign: TextAlign.left,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                CustomText(
                                  text: controller.articlesByCountries[index]
                                          .description ??
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
                    )),
                  ))
        ],
      ),
    ));
  }
}
