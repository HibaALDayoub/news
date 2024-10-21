import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/modules/filter/controller/filter_controller.dart';

import '../../../../core/helper/localization/localization_helper.dart';
import '../../../main/view/widgets/custom_text.dart';
import 'dropdown_button.dart';

class RowDropdownButton extends StatelessWidget {
  RowDropdownButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
        builder: (controller) => Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(
                                right: LocalaizationHelper.isEn() ? 0 : 0,
                                top: 16),
                            child: CustomText(
                              textAlign: TextAlign.start,
                              text: "Country".tr,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      // fontSize:
                                      //     LocalaizationHelper.isEn() ? 17 : 24,
                                      color:
                                          Theme.of(context).primaryColorLight),
                              // color: AppColors.nightGrey,
                            )),
                      ),
                      CustomDropdownButton(
                        isModel: true,
                        items: controller.countries,
                        onChange: (value) {
                          controller.firstSelected = value;
                          controller.update();
                          controller.filterByCountry();
                        },
                        itemSelected: controller.firstSelected,
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: CustomText(
                              text: "Sorted By".tr,
                              textStyle: Theme.of(context)
                                  .textTheme
                                  .displayMedium
                                  ?.copyWith(
                                      color:
                                          Theme.of(context).primaryColorLight),
                              // color: AppColors.nightGrey,
                            )),
                      ),
                      CustomDropdownButton(
                        stringList: controller.sortedList,
                        onChange: (value) {
                          controller.secondSelected = value;
                          controller.update();
                        },
                        itemSelected: controller.secondSelected,
                        isModel: false,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
              ],
            ));
  }
}
