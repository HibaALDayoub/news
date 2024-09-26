import 'package:flutter/widgets.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:news_project/modules/filter/controller/filter_controller.dart';

import '../../../../core/constant/colors/app_colors.dart';
import '../../../main/view/widgets/custom_text.dart';
import 'dropdown_button.dart';

class RowDropdownButton extends StatelessWidget {
  RowDropdownButton({super.key});

  // dynamic selected;
  // dynamic secondSelected = 'Newest';
  // dynamic firstSelected;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FilterController>(
        builder: (controller) => Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.only(top: 12, right: 0),
                            child: const CustomText(
                              text: "Country",
                              color: AppColors.nightGrey,
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                            margin: const EdgeInsets.only(top: 12),
                            child: const CustomText(
                              text: "Sorted By",
                              color: AppColors.nightGrey,
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
                      )
                    ],
                  ),
                ),
              ],
            ));
  }
}
