import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.sendTimeout:
        return ServerFailure("Send timeout with ApiServer");
      case DioExceptionType.receiveTimeout:
        return ServerFailure("Recieve timeout with ApiServer");
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data!);
      case DioExceptionType.cancel:
        return ServerFailure("Request ApiService was Cancelled");
      case DioExceptionType.unknown:
        if (dioException.message!.contains("SocketException")) {
          return ServerFailure("No Internet Connection");
        }
        return ServerFailure("UnExpected  Error , Please try again");
      case DioExceptionType.badCertificate:
        return ServerFailure("Connection timeout with ApiServer");
      case DioExceptionType.connectionError:
        return ServerFailure("Connection timeout with ApiServer");
      default:
        return ServerFailure(
            "Oops there is an error , Please try again later ");
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure("Your request not found , please try later ");
    } else if (statusCode == 500) {
      return ServerFailure("Internal server Error , Please try later ");
    } else {
      return ServerFailure("Oops there is an error , Please try again later ");
    }
  }
}
