import 'package:dartz/dartz.dart';
import 'package:news_project/core/api/errors/api_errors.dart';

abstract class DetailsData {
  Future<Either<ApiErrors, Map>> addToFav(String name);
  Future<Either<ApiErrors, Map>> deleteFromFav(String name);
}
