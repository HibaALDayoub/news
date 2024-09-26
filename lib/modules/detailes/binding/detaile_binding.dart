import 'package:get/get.dart';

import '../../main/controller/main_controller.dart';
import '../controller/detaile_controller.dart';

class DetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
    Get.put(MainController());
  }
}
