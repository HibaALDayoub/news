import 'package:get/get.dart';
import 'package:news_project/core/classes/status_request.dart';

import '../data/home_data_imp.dart';
import '../model/article_model.dart';

class HomeController extends GetxController {
  List<ArticleModel> articleModel = [];
  StatusRequest statusRequest = StatusRequest.none;
  HomeDataImp homeDataImp = HomeDataImp(httpMethods: Get.find());
  bool isVisible = false;
  getNewsData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await homeDataImp.viewHomeData();
    update();
    response.fold((l) {
      statusRequest = StatusRequest.failure;
      print("${l.message}");
      update();
    }, (r) {
      statusRequest = StatusRequest.none;
      update();
      if (r["status"] == "ok") {
        List responseHomeList = r["articles"];
        articleModel =
            responseHomeList.map((e) => ArticleModel.fromJson(e)).toList();
        update();

        print("_____________________________${responseHomeList.length}");
        // update();
      }
    });
  }

  @override
  void onInit() {
    getNewsData();
    super.onInit();
  }
}
