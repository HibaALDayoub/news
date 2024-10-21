import 'package:flutter/material.dart';
import 'package:news_project/core/theme/dark/dark_theme_text.dart';
import 'package:news_project/core/theme/light/light_theme_text.dart';

import '../constant/colors/app_colors.dart';

class Themes {
  static ThemeData lightTheme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: AppColors.whiteColor,
      brightness: Brightness.light,
      primaryIconTheme: const IconThemeData(color: AppColors.whiteColor),
      primaryColor: AppColors.primaryColor,
      hintColor: AppColors.black38,
      primaryColorLight: AppColors.nightGrey,
      highlightColor: AppColors.grey,
      // secondaryHeaderColor: AppColors.primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          // fill: 1.9,
          color: AppColors.primaryColor,
        ),
        selectedItemColor: AppColors.primaryColor,
      ),
      textTheme: TextTheme(
        displaySmall: displaySmallLight(),
        displayMedium: displayMediumLight(),
        displayLarge: displayLargeLight(),
      ),
      primaryColorDark: AppColors.lightGrey,
      cardColor: AppColors.sugger,
      dialogBackgroundColor: AppColors.lightRed);

  static ThemeData darkTheme = ThemeData.dark().copyWith(
      scaffoldBackgroundColor: AppColors.black38,
      brightness: Brightness.dark,
      // bannerTheme: MaterialBannerThemeData(),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          // fill: 1.9,
          color: AppColors.whiteColor,
        ),
        selectedItemColor: AppColors.whiteColor,
      ),
      textTheme: TextTheme(
        displaySmall: displaySmallDark(),
        displayMedium: displayMediumDark(),
        displayLarge: displayLargeDark(),
      ),
      primaryColorLight: AppColors.whiteColor,
      primaryIconTheme: const IconThemeData(color: AppColors.whiteColor),
      snackBarTheme: const SnackBarThemeData(
        backgroundColor: AppColors.black38,
      ),
      primaryColor: AppColors.black38,
      hintColor: AppColors.whiteColor,
      cardColor: Color(0xFF5A5A5A),
      primaryColorDark: Color(0xFF5A5A5A),
      // secondaryHeaderColor: ,
      // dialogBackgroundColor: Color.fromARGB(255, 172, 70, 70),
      dialogBackgroundColor: Color.fromARGB(255, 172, 70, 70),
      highlightColor: AppColors.sugger);
}
