import 'package:dartz/dartz.dart';
import 'package:news_project/core/api/errors/api_errors.dart';
import 'package:news_project/modules/main/data/main_data.dart';

import '../../../core/api/http_methods.dart';
import '../../../core/api/links/api_links.dart';
import '../../../core/classes/http_method.dart';

class MainDataImp implements MainData {
  final HttpProvider httpMethods;
  MainDataImp({required this.httpMethods});

  @override
  Future<Either<ApiErrors, Map>> viewMainData() async {
    return await httpMethods.allMethod(
      httpMethod: HttpMethod.get,
      isAuthorized: false,
      url: ApiLinks.public,
    );
  }
}
