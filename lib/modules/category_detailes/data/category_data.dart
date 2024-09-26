import 'package:dartz/dartz.dart';

import '../../../core/api/errors/api_errors.dart';

abstract class CategoryData {
  Future<Either<ApiErrors, Map>> viewCategoryData(String name);
}
