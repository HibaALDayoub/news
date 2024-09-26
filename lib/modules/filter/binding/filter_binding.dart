import 'package:get/get.dart';

import '../controller/filter_controller.dart';

class FilterBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(FilterController());
  }
}
