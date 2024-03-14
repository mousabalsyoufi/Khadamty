import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/otp_sending_provider/send_otp_api.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// Send otp api call implementation
class SendOtpApiImp extends BaseApiProvider implements SendOtpApi {
  @override
  Future<ApiResponse<String>> sendOtp({required String phoneNumber}) async {
    ApiResponse<String>? result;
    Response? response;
    try {
      final params = {'phone': phoneNumber};
      response = await client.post(
        Urls.sendOtp,
        options: await getRequestWithoutToken(),
        data: params,
      );
      result = ApiResponse.completed(
          response.data[ApiKeys.data][ApiKeys.result]['sid']);
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
