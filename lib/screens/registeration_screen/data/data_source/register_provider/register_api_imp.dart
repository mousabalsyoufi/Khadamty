import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/model/register_request_model.dart';
import '../../../../../constants/api_keys/api_keys.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/response_handler.dart';
import 'register_api.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../model/register_model.dart';

// register api call implementation
class RegisterApiImp extends BaseApiProvider implements RegisterApi {
  @override
  Future<ApiResponse<RegisterModel>> register(
      {required RegisterRequestModel registerRequestModel}) async {
    ApiResponse<RegisterModel>? result;
    Response? response;
    try {
      response = await client.post(
        Urls.register,
        data: registerRequestModel.toJson(),
        options: await getRequestWithoutToken(),
      );
      result = ApiResponse.completed(RegisterModel.fromJson());
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
