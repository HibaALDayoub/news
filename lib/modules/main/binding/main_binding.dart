import 'package:get/get.dart';
import 'package:news_project/modules/filter/controller/filter_controller.dart';
import 'package:news_project/modules/home/controller/home_controller.dart';

import '../../favorite/controller/favorite_controller.dart';
import '../controller/main_controller.dart';

class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(MainController());
    Get.put(FavoriteController());
    Get.put(FilterController());
  }
}
