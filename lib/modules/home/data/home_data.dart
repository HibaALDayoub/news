import 'package:dartz/dartz.dart';

import '../../../core/api/errors/api_errors.dart';

abstract class HomeData {
  Future<Either<ApiErrors, Map>> viewHomeData();
}
