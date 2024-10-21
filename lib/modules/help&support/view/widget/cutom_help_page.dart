import 'package:flutter/material.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';
import 'package:news_project/core/constant/size/app_size.dart';
import 'package:news_project/modules/main/view/widgets/custom_text.dart';

class CustomHelpPage extends StatelessWidget {
  const CustomHelpPage({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.screenWidth(context: context) * 0.9,
      height: AppSize.screenHeight(context: context) * 0.1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(
          text: text,
          textStyle: Theme.of(context).textTheme.displayMedium,
          textAlign: TextAlign.start,
        ),
        const Divider(
          thickness: 1,
          color: AppColors.grey,
          height: 25,
        ),
      ]),
    );
  }
}
