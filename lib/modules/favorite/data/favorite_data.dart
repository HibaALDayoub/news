
import 'package:news_project/modules/home/model/article_model.dart';

abstract class FavoriteData {
  Future<List<ArticleModel>> viewFavoriteData();
  void setData(List<ArticleModel> data);
}
