import 'dart:io';

import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/services/notification_service.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../core/api_handler/urls.dart';

import '../../model/login_model.dart';
import 'login_api.dart';

// login api call implementation
class LoginApiImp extends BaseApiProvider implements LoginApi {
  @override
  Future<ApiResponse<LoginModel>> login(
      {required String username, required String password}) async {
    ApiResponse<LoginModel>? result;
    Response? response;
    try {
      final params = {
        'email': username,
        'login': username,
        'password': password,
        'entity': '1',
        'reset': 0,
        'token':
            Platform.isAndroid ? await NotificationService.getDeviceToken() : 'iOS Token'
      };
      response = await client.post(
        Urls.login,
        options: await getRequestWithoutToken(),
        data: params,
      );
      result = ApiResponse.completed(
          LoginModel.fromMap(response.data[ApiKeys.data][ApiKeys.result]));
      result.message = response.data[ApiKeys.message];
      result.code = response.data[ApiKeys.code];
    } catch (error) {
      try {
        error is DioError
            ? customExceptionHandler(error, -1)
            : customExceptionHandler(error, response);
      } catch (forcedException) {
        result = ApiResponse.error(forcedException.toString());
      }
    }
    return result!;
  }
}
