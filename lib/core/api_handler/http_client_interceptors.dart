import 'package:dio/dio.dart';
import '../../constants/env_config/env_configuration.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio dio  = Dio(BaseOptions(
  responseType: ResponseType.json,
  connectTimeout: connectTimeout,
  receiveTimeout: receiveTimeout,
  validateStatus: (int? code){
    if(code! >= 200){
      return true;
    }
    return false;
  }
));

getHttpClient() {
  // get Logger info for request included ( headers , params , body )
  dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90));


  dio.interceptors.add(InterceptorsWrapper(
    onError: (error, handler) async {
      return handler.reject(error);
    },
    onResponse: (response, handler) async {
      return handler.resolve(response);
    },
  ));
  //* Timeout in milliseconds for opening url. [DioErrorType.CONNECT_TIMEOUT] type
  dio.options.connectTimeout =connectTimeout;
  //*  Timeout in milliseconds for receiving data.[DioErrorType.RECEIVE_TIMEOUT] type
  dio.options.receiveTimeout = receiveTimeout;
  return dio;
}
