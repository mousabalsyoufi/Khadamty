// Generic Exception Handler to manage all states of response from backend or Dio itself
class AppException implements Exception {
  final String? _message;

  AppException([this._message]);

  @override
  String toString() {

    return "$_message";
  }
}



class AmbiguousException extends AppException {
  AmbiguousException([message]) :super(message);
}
class BadGateWayException extends AppException{
  BadGateWayException([message]):super(message);
}
class BadRequestException extends AppException {
  BadRequestException([message]):super(message);
}
class ForbiddenException extends AppException {
  ForbiddenException([message]):super(message);
}
class GateWayTimeOutException extends AppException {
  GateWayTimeOutException([message]):super(message);
}
class InternalServerErrorException extends AppException {
  InternalServerErrorException([message]):super(message);
}
class NotFoundException extends AppException {
  NotFoundException([message]):super(message);
}
class UnauthorisedException extends AppException {
  UnauthorisedException([message]) : super(message);
}
class DefaultException extends AppException {
  DefaultException([message]):super(message);
}

//Dio Error Exception  handler

class ReceiveTimeoutException extends AppException {
  ReceiveTimeoutException([String? message]) : super(message);
}
class ConnectionTimeoutException extends AppException {
  ConnectionTimeoutException([String? message]) : super(message);
}
class DefaultTimeoutException extends AppException {
  DefaultTimeoutException([String? message]) : super(message);
}
class SendTimeoutException extends AppException {
  SendTimeoutException([String? message]) : super(message);
}
class RequestWasCancelledException extends AppException {
  RequestWasCancelledException([String? message]) : super(message);
}
class NoInternetConnectionException extends AppException {
  NoInternetConnectionException([String? message]) : super(message);
}

