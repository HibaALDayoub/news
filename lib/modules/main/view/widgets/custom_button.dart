import 'package:flutter/material.dart';

import '../../../../core/constant/colors/app_colors.dart';

class CustomButton extends StatelessWidget {
  CustomButton(
      {super.key,
      this.onTap,
      required this.height,
      this.textColor,
      this.color,
      required this.text});
  final void Function()? onTap;
  final double height;
  final Color? textColor;
  final Color? color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      padding: const EdgeInsets.symmetric(horizontal: 120, vertical: 0),
      textColor: textColor ?? Colors.white,
      color: color ?? AppColors.primaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onPressed: onTap,
      child: Text(text),
      minWidth: 60,
    );
  }
}
