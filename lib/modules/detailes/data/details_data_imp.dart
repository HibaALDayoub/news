import 'package:dartz/dartz.dart';
import 'package:news_project/core/api/errors/api_errors.dart';
import 'package:news_project/core/api/http_methods.dart';
import 'package:news_project/core/classes/http_method.dart';

import 'details_data.dart';

class DetailsDataImp implements DetailsData {
  late HttpProvider httpMethods;
  DetailsDataImp({required this.httpMethods});
  @override
  Future<Either<ApiErrors, Map>> addToFav(String name) async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.get, url: "", isAuthorized: false);
  }

  @override
  Future<Either<ApiErrors, Map>> deleteFromFav(String name) async {
    return await httpMethods.allMethod(
        httpMethod: HttpMethod.post, url: "", isAuthorized: false);
  }
}
