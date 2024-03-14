import 'dart:async';

import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';

import 'app_exceptions.dart';
import 'error_message.dart';

// Custom Exception Handler to handle all status codes that is returned from the backend

dynamic customExceptionHandler<T>(dioError, response) {
  switch (response) {
    case -1:
      switch (dioError.type) {
        case DioErrorType.cancel:
          throw RequestWasCancelledException(ErrorMessages.dioCancel);
        case DioErrorType.connectTimeout:
          throw NoInternetConnectionException(ErrorMessages.dioConnectTimeout);
        case DioErrorType.other:
          throw DefaultTimeoutException(ErrorMessages.dioDefault);
        case DioErrorType.receiveTimeout:
          throw NoInternetConnectionException(ErrorMessages.dioReceiveTimeout);
        case DioErrorType.sendTimeout:
          throw NoInternetConnectionException(ErrorMessages.dioSendTimeOut);
        default:
          throw DefaultException(ErrorMessages.nDefault);
      }
    default:
      switch (response.statusCode) {
        case 300:
          throw AmbiguousException(response.data[ApiKeys.message][0]);
        case 502:
          throw BadGateWayException(ErrorMessages.nDefault);
        case 400:
          throw BadRequestException(response.data[ApiKeys.message][0]);
        case 403:
          throw ForbiddenException(response.data[ApiKeys.message][0]);
        case 504:
          throw GateWayTimeOutException(response.data[ApiKeys.message][0]);
        case 500:
          throw InternalServerErrorException(response.data[ApiKeys.message][0]);
        case 404:
          throw NotFoundException(response.data[ApiKeys.message][0]);
        case 401:
          throw UnauthorisedException(response.data[ApiKeys.message][0]);
        case 408:
          throw TimeoutException(response.data[ApiKeys.message][0]);
        default:
          throw DefaultException(ErrorMessages.nDefault);
      }
  }
}
