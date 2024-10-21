import 'package:get/get.dart';
import 'package:news_project/core/local_storage/local_storage_service.dart';

import '../ap_theme.dart';

class ThemeController extends GetxController {
  bool? switchTheme;
  bool? saveTheme;
  var qrCode = '';
  @override
  void onInit() {
    saveTheme = LocalStorageService.getBool('dark');
    switchTheme = saveTheme!;
    super.onInit();
  }

  changeTheme(bool val2) {
    switchTheme = val2;
    if (switchTheme == false) {
      Get.changeTheme(Themes.lightTheme);
    }

    if (switchTheme == true) {
      Get.changeTheme(Themes.darkTheme);
    }
    LocalStorageService.setBool(key: 'dark', value: switchTheme!);
    Get.forceAppUpdate();
  }
}
