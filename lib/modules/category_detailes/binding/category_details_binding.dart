import 'package:get/get.dart';

import '../controller/category_details_controller.dart';

class CategoryDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryController());
  }
}
