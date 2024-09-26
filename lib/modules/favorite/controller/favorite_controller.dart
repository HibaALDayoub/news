import 'package:get/get.dart';

import '../../../core/classes/status_request.dart';
import '../../home/model/article_model.dart';
import '../data/favorite_data_imp.dart';

class FavoriteController extends GetxController {
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteDataImp favoriteDataImp = FavoriteDataImp();
  List<ArticleModel> favoriteList = [];
  void getFavData() async {
    favoriteList = await favoriteDataImp.viewFavoriteData();
    update();
  }

  void delete(String favName) async {}
  @override
  void onInit() {
    getFavData();
    super.onInit();
  }
}
