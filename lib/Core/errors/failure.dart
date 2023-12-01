import 'package:dio/dio.dart';

abstract class Failure{
  final String errMessage;

 const Failure(this.errMessage);

}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

 factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with api server');
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with api server');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with api server');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure('Request to App is cancel');
      case DioExceptionType.connectionError:
        return ServerFailure('Please Try again , No Internet connection ');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Iternet Connection');
        }
        return ServerFailure('UnExpected Error, Please Try Again!');
      default:
        return ServerFailure('No Internet connection , Please Try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Method not found');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Failuer');
    } else {
      return ServerFailure('Error Try again');
    }
  }
  }