import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/local_storage/local_storage_service.dart';

class LocalizationController extends GetxController {
  bool enableArabicLanguage = false;
  late Locale language;
  changeLanguage(String codeLanguage) {
    Locale locale = Locale(codeLanguage);
    LocalStorageService.setString(key: 'langauge', value: codeLanguage);
    Get.updateLocale(locale);
    language = Locale(codeLanguage);
    enableArabicLanguage = language == const Locale('ar') ? true : false;
    update();
    print(locale);
  }

  @override
  void onInit() {
    String? lang = LocalStorageService.getString('langauge');
    if (lang == 'ar') {
      language = const Locale('ar');
      enableArabicLanguage = true;
    } else if (lang == 'en') {
      language = const Locale('en');
      enableArabicLanguage = false;
    } else {
      // language = Locale(Get.deviceLocale!.languageCode);
      language = const Locale('ar');
      log("language is ${language.languageCode}");
      enableArabicLanguage = true;
    }
    super.onInit();
  }
}
