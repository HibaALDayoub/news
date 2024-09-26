import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:news_project/core/constant/routes/app_routes.dart';
import 'package:news_project/core/routes/routes.dart';
import 'package:news_project/generated/l10n.dart';

import 'core/app/binding/app_binding.dart';
import 'core/local_storage/local_storage_service.dart';
import 'modules/home/controller/home_controller.dart';
import 'package:intl/intl.dart';

// import "/routes.dart";

void main() async {
  await LocalStorageService.initStorage();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // locale: Locale("ar"),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splashRoute,
      getPages: routes,
      initialBinding: AppBindings(),
    );
  }
}

bool isArabic() {
  return Intl.getCurrentLocale() == "ar";
}
// left: isArabic() ? 0:16,