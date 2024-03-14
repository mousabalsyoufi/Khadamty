import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../model/verify_otp_response_model.dart';
import 'verify_otp_api.dart';

// Verify otp api call implementation
class VerifyOtpApiImp extends BaseApiProvider implements VerifyOtpApi {
  @override
  Future<ApiResponse<VerifyOtpResponseModel>> verifyOtp({
    required String otpCode,
    required String verificationId,
  }) async {
    ApiResponse<VerifyOtpResponseModel>? result;
    Response? response;
    try {
      final params = {'code': otpCode, 'verificationSid': verificationId};
      response = await client.post(
        Urls.verifyOtp,
        options: await getRequestWithoutToken(),
        data: params,
      );
      result = ApiResponse.completed(VerifyOtpResponseModel.fromMap(
          response.data[ApiKeys.data][ApiKeys.result]));
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
