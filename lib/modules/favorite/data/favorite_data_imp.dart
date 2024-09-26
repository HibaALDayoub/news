import 'dart:convert';
import 'package:news_project/core/local_storage/local_storage_service.dart';

import '../../home/model/article_model.dart';
import 'favorite_data.dart';

class FavoriteDataImp implements FavoriteData {
  FavoriteDataImp();

  @override
  Future<List<ArticleModel>> viewFavoriteData() async {
    String stringData = LocalStorageService.getString('favorite');
    if (stringData.isNotEmpty) {
      List jsonList = json.decode(stringData)['data'] ?? [];
      List<ArticleModel> data =
          jsonList.map((e) => ArticleModel.fromJson(e)).toList();
      return data;
    } else {
      return [];
    }
  }

  @override
  void setData(List<ArticleModel> data) {
    Map<String, dynamic> datamap = {};
    datamap['data'] = data.map((e) => e.toJson()).toList();
    LocalStorageService.setString(key: 'favorite', value: json.encode(datamap));
  }
}
