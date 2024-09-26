import '../../classes/status_request.dart';

class ApiErrors {
  final String message;
  //  StatusRequest::::::: => is a enum class
  final StatusRequest statusRequest;
  final int? statusCode; //LIKE:400,401

  ApiErrors({
    required this.message,
    required this.statusRequest,
    this.statusCode,
  });
}
