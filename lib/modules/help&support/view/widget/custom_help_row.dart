import 'package:flutter/material.dart';
import 'package:news_project/core/constant/colors/app_colors.dart';

import '../../../main/view/widgets/custom_text.dart';

class CustomHelpRow extends StatelessWidget {
  const CustomHelpRow({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: text,
          textStyle: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        IconButton(
            onPressed: onTap,
            icon: const Icon(
              Icons.arrow_downward,
              color: AppColors.primaryColor,
            ))
      ],
    );
  }
}
