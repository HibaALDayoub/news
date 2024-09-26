import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';
import 'custom_text.dart';

class CustomRowDrawer extends StatelessWidget {
  const CustomRowDrawer(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.textInDrawer,
      this.backIcon = false});
  final IconData? icon;
  final bool backIcon;
  final Color iconColor;
  final String textInDrawer;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        const Spacer(),
        CustomText(
          text: textInDrawer,
          color: AppColors.secondaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        Column(children: [
          if (backIcon)
            const Icon(
              Icons.arrow_forward,
              color: Colors.blue,
            ),
        ]),
      ],
    );
  }
}
