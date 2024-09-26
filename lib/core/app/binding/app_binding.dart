import 'package:get/get.dart';

import '../../api/http_methods.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HttpProvider());
  }
}
