import 'package:dio/dio.dart';

abstract class Failure {
  final String message;

  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('receive timeout with api server');
      case DioExceptionType.badCertificate:
        return ServerFailure('bad certificate with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            e.response!.statusCode!, e.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('request to api server canceled');
      case DioExceptionType.connectionError:
        return ServerFailure('no internet connection');
      case DioExceptionType.unknown:
        return ServerFailure('oops there was an error , please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 404) {
      return ServerFailure('your request was not found, please try later');
    } else if (statusCode == 500) {
      return ServerFailure('there is a problem with server, please try later');
    } else if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else {
      return ServerFailure('there was an error , please try again');
    }
  }
}
