// Error Messages that show in Front-End
class ErrorMessages{
  static const String noResponse='no_response_from_server';
  static const String badRequest = "bad_request";
  static const String dioCancel='your_request_has_been_cancelled_please_try_again';
  static const String dioReceiveTimeout ='please check your internet connection';
  static const String dioConnectTimeout='please check your internet connection';
  static const String dioDefault='please check your internet connection';
  static const String dioSendTimeOut='please check your internet connection';

  // error  message codes support
  static const String n300AMBIGUOUS   = 'ambiguous_request';
  static const String n50BADGATEWAY = 'bad_gateway_request';
  static const String n400BADREQUEST = 'bad_request';
  static const String n403FORBIDDEN = 'forbidden_request';
  static const String n504GATEWAYTIMEOUT ='gateway_timeout_request';
  static const String n500INTERNALSERVERERROR='internal_server_error';
  static const String n404NOTFOUND ='error_not_found_this_request';
  static const String n401UNAUTHORIZED ='please_check_authorized_for_your_request';
  static const String n408REQUESTTIMEOUT='request_timeout';
  static const String nDefault = 'Something Went Wrong Please Try Again Later';


}
