import 'package:flutter/material.dart';
import '../../constant/colors/app_colors.dart';

TextStyle displaySmallLight() {
  return const TextStyle(
      color: AppColors.secondaryColor,
      fontSize: 12,
      fontWeight: FontWeight.w400);
}

TextStyle displayMediumLight() {
  return const TextStyle(
      color: AppColors.secondaryColor,
      fontSize: 16,
      fontWeight: FontWeight.w500);
}

TextStyle displayLargeLight() {
  return const TextStyle(
      color: AppColors.secondaryColor,
      fontSize: 20,
      fontWeight: FontWeight.bold);
}
