import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/core/api_handler/urls.dart';
import 'verify_mobile_number_api.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../model/verify_mobile_number_model.dart';

// Verify Mobile Number api call implementation
class VerifyMobileNumberApiImp extends BaseApiProvider
    implements VerifyMobileNumberApi {
  @override
  Future<ApiResponse<VerifyMobileNumberModel>> verifyMobileNumber(
      {required String mobileNumber}) async {
    ApiResponse<VerifyMobileNumberModel>? result;
    Response? response;
    try {
      final params = {
        'mobile_number': mobileNumber,
      };
      response = await client.post(
        Urls.verifyMobileNumber,
        options: await getRequestWithoutToken(),
        data: params,
      );
      // TODO check fromJson function
      result = ApiResponse.completed(VerifyMobileNumberModel.fromJson());
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
