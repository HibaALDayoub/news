import 'dart:developer';

import 'package:get/get.dart';

import '../../../core/classes/status_request.dart';
import '../../home/model/article_model.dart';
import '../data/favorite_data_imp.dart';

class FavoriteController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteDataImp favoriteDataImp = FavoriteDataImp();
  // FavoriteController controller = Get.put(FavoriteController());
  // DetailController detailController = DetailController();
  List<ArticleModel> favoriteList = [];
  void getFavData() async {
    favoriteList = await favoriteDataImp.viewFavoriteData();
    update();
  }

  void delete(int index) async {
    // detailController.delete();
    log('remove favorite FROM FAVPAGE');
    favoriteList.removeAt(index);
    favoriteDataImp.setData(favoriteList);
    update();
  }

  @override
  void onInit() {
    getFavData();
    super.onInit();
  }
}
