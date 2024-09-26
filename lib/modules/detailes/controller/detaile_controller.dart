import 'dart:developer';

import 'package:get/get.dart';

import 'package:news_project/core/classes/status_request.dart';
import 'package:news_project/modules/detailes/data/details_data_imp.dart';
import 'package:news_project/modules/favorite/controller/favorite_controller.dart';
import 'package:news_project/modules/home/model/article_model.dart';
import 'package:news_project/modules/main/controller/main_controller.dart';

import '../../favorite/data/favorite_data_imp.dart';

class DetailController extends GetxController {
  // StatusRequest statusRequest =
  StatusRequest statusRequest = StatusRequest.none;
  DetailsDataImp detailsDataImp = DetailsDataImp(httpMethods: Get.find());
  MainController mainController = Get.find();
  ArticleModel articleModel = Get.arguments["model"];
  bool isFavorite = false;
  FavoriteController favoriteController = Get.find();
  List<ArticleModel> favoriteList = [];
  FavoriteDataImp favoriteDataImp = FavoriteDataImp();
  addDataToFav() {
    log('add to favorite');
    isFavorite = true;
    favoriteList.add(articleModel);
    favoriteDataImp.setData(favoriteList);
    favoriteController.getFavData();
    update();
  }
  delete() async {  
  }
  initializeData() {
    favoriteList = favoriteController.favoriteList;
    int index = favoriteList.indexWhere((e) => e.title == articleModel.title);
    if (index != -1) {
      isFavorite = true;
    }
  }
  @override
  void onInit() {
    initializeData();
    // TODO: implement onInit
    super.onInit();
  }
}
