import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

import 'package:http/http.dart' as http;
import 'package:news_project/core/helper/internet_functions/check_internet_connection.dart';

import '../classes/http_method.dart';
import '../classes/status_request.dart';
import 'errors/api_errors.dart';
import 'links/api_links.dart';

class HttpProvider {
  Future<Either<ApiErrors, Map>> allMethod({
    required HttpMethod httpMethod,
    required String url,
    required bool isAuthorized,
  }) async {
    log("url link is $url");
    try {
      if (await checkInternetConnection()) {
        var response = await chooseMethod(
          // هون البارمترات ضروري متل ال الفانكشن السابقة

          linkUrl: url,
          httpMethod: httpMethod,
          isAuthorized: isAuthorized,
        );
        log("......................${response.statusCode}");
        if (response.statusCode == 200 || response.statusCode == 201) {
          log("________ ${response}");

          Map responseData = json.decode(response.body);
          return right(responseData);
        } else {
          return left(ApiErrors(
              message: "backend errors",
              statusRequest: StatusRequest.offlineFailure));
        }
      } else {
        return left(ApiErrors(
            message: "No Internet Connection",
            statusRequest: StatusRequest.offlineFailure));
      }
    } on TimeoutException {
      return left(ApiErrors(
          message: "time out", statusRequest: StatusRequest.offlineFailure));
    } on SocketException {
      return left(ApiErrors(
          message: "No Internet Connection",
          statusRequest: StatusRequest.offlineFailure));
    } catch (exception) {
      log("catch error $exception");
      return left(ApiErrors(
          message: exception.toString(), statusRequest: StatusRequest.failure));
    }
  }

  Future<Response> chooseMethod({
    required HttpMethod httpMethod,
    required String linkUrl,
    required bool isAuthorized,
  }) async {
    //======POST==========================
    if (httpMethod == HttpMethod.post) {
      return await http
          // ليش حطيت   uri  ?
          .post(
            Uri.parse(linkUrl),
          )
          .timeout(const Duration(seconds: 30));
    }
    if (httpMethod == HttpMethod.get) {
      return await http
          .get(Uri.parse(linkUrl),
              headers:
                  isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
          .timeout(const Duration(seconds: 30));
    }
    //======MULTIPART==========================
    else if (httpMethod == HttpMethod.multiPart) {}

    return await http
        .get(Uri.parse(linkUrl),
            headers:
                isAuthorized ? ApiLinks.authorizedHeaders : ApiLinks.header)
        .timeout(const Duration(seconds: 30));
  }
}
