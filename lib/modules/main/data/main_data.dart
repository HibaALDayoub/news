import 'package:dartz/dartz.dart';

import '../../../core/api/errors/api_errors.dart';

abstract class MainData {
  Future<Either<ApiErrors, Map>> viewMainData();
}
