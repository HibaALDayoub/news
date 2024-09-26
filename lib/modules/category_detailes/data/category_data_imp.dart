import 'package:dartz/dartz.dart';

import '../../../core/api/errors/api_errors.dart';
import '../../../core/api/http_methods.dart';

import '../../../core/api/links/api_links.dart';
import '../../../core/classes/http_method.dart';
import 'category_data.dart';

class CategoryDataImp implements CategoryData {
  final HttpProvider httpMethods;
  CategoryDataImp({required this.httpMethods});
  @override
  Future<Either<ApiErrors, Map>> viewCategoryData(String name) async {
    return await httpMethods.allMethod(
      httpMethod: HttpMethod.get,
      isAuthorized: false,
      url: "${ApiLinks.public}&category=$name",
    );
  }
}
// "https://newsapi.org/v2/top-headlines?apiKey=6e696c69c23d471283bcd7ece41b4a67&country=$name"
// "https://newsapi.org/v2/top-headlines?apiKey=6e696c69c23d471283bcd7ece41b4a67&country=Canada"
// "${ApiLinks.public}&country=$name"