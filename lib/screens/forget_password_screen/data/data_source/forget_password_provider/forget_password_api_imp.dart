import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/core/api_handler/urls.dart';
import 'forget_password_api.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import '../../model/forget_password_model.dart';

// Forget Password api call implementation
class ForgetPasswordApiImp extends BaseApiProvider
    implements ForgetPasswordApi {
  @override
  Future<ApiResponse<ForgetPasswordModel>> forgetPassword(
      {required String email}) async {
    ApiResponse<ForgetPasswordModel>? result;
    Response? response;
    try {
      final params = {
        'email': email,
      };
      response = await client.post(
        Urls.forgetPassword,
        options: await getRequestWithoutToken(),
        data: params,
      );
      // TODO check fromJson function
      result = ApiResponse.completed(ForgetPasswordModel.fromJson());
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
