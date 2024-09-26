import 'package:dartz/dartz.dart';

import '../../../core/api/errors/api_errors.dart';

import '../../../core/api/http_methods.dart';
import '../../../core/api/links/api_links.dart';
import '../../../core/classes/http_method.dart';
import 'home_data.dart';

class HomeDataImp implements HomeData {
  final HttpProvider httpMethods;
  HomeDataImp({required this.httpMethods});

  @override
  Future<Either<ApiErrors, Map>> viewHomeData() async {
    return await httpMethods.allMethod(
      httpMethod: HttpMethod.get,
      isAuthorized: false,
      url: ApiLinks.public,
    );
  }
}
