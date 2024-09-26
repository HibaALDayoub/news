import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../favorite/pages/favorite_page.dart';

import '../../filter/view/pages/filter_page.dart';
import '../../home/model/article_model.dart';

import '../../home/pages/home_page.dart';
import '../data/main_data_imp.dart';

class MainController extends GetxController {
  List<ArticleModel> articleModel = [];
  MainDataImp mainDataImp = MainDataImp(httpMethods: Get.find());
// List<> categoryModel =CategoryModel(id: id, name: name, image: image)
  int selectedIndex = 0;
  List<Widget> mainWidgets = [HomePage(), FavoritePage(), FilterPage()];

  getMainData() async {
    var response = await mainDataImp.viewMainData();
    update();
    response.fold((l) {}, (r) {
      if (r["status"] == "ok") {
        List responseHomeList = r["articles"];
        articleModel =
            responseHomeList.map((e) => ArticleModel.fromJson(e)).toList();
        update();

        print("_____________________________${responseHomeList[3]}");
        // update();
      }
    });
  }

  @override
  void onInit() {
    // like init state
    // getMainData();

    super.onInit();
  }
}
