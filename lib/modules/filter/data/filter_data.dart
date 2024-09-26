import 'package:dartz/dartz.dart';

import '../../../core/api/errors/api_errors.dart';

abstract class FilterData {
  Future<Either<ApiErrors, Map>> viewFilterData(String name);
}
