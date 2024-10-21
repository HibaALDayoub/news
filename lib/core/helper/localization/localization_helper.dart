import 'package:get/get.dart';
import 'package:news_project/core/localization/controller/localization_controller.dart';

class LocalaizationHelper {
  static LocalizationController localizationController = Get.find();
  static bool isEn() {
    bool isEnglish = false;
    isEnglish =
        localizationController.language.languageCode == 'en' ? true : false;
    return isEnglish;
  }
}
