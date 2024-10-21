import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/routes/app_routes.dart';
import 'package:news_project/core/localization/controller/localization_controller.dart';
import 'package:news_project/core/routes/routes.dart';

import 'core/app/binding/app_binding.dart';
import 'core/local_storage/local_storage_service.dart';
import 'core/localization/localization.dart';
import 'core/theme/ap_theme.dart';
import 'core/theme/controller/theme_controller.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// import "/routes.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageService.initStorage();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LocalizationController localizationController =
      Get.put(LocalizationController());
  final ThemeController controller = Get.put(ThemeController());
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: localizationController.language,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRoute,
      getPages: routes,
      initialBinding: AppBindings(),
      translations: Locaization(),
      theme: controller.saveTheme == false || controller.saveTheme == null
          ? Themes.lightTheme
          : Themes.darkTheme,
      // locale: Get.deviceLocale,
      // locale: AppServices.localizationController?.language, //app language
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == "ar";
}
// left: isArabic() ? 0:16,