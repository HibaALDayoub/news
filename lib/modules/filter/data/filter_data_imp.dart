import 'package:dartz/dartz.dart';
import '../../../core/api/errors/api_errors.dart';
import '../../../core/api/http_methods.dart';
import '../../../core/api/links/api_links.dart';
import '../../../core/classes/http_method.dart';
import 'filter_data.dart';

class FilterDataImp implements FilterData {
  final HttpProvider httpMethods;
  FilterDataImp({required this.httpMethods});
  @override
  Future<Either<ApiErrors, Map>> viewFilterData(String name) async {
    return await httpMethods.allMethod(
      httpMethod: HttpMethod.get,
      isAuthorized: false,
      url: "${ApiLinks.public}&$name",
    );
  }
}
