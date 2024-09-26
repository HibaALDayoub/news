import 'package:get/get.dart';
import 'package:news_project/core/api/http_methods.dart';
import '../controller/home_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
    Get.put(HttpProvider());
  }
}
