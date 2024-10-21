import 'package:get/get.dart';

import 'package:news_project/modules/help&support/controller/help_support_controller.dart';

class HelpSupportBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HelpSupportController());
  }
}
