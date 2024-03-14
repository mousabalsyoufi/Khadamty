import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/registeration_screen/data/data_source/check_user_exist_provider/check_user_exist_api.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// Check User Exist api call implementation
class CheckUserExistApiImp extends BaseApiProvider
    implements CheckUserExistApi {
  @override
  Future<ApiResponse<String>> checkUserExist({required String email}) async {
    ApiResponse<String>? result;
    Response? response;
    try {
      response = await client.get(
        '${Urls.checkUserExist}/$email',
        options: await getRequestWithoutToken(),
      );
      result = ApiResponse.completed(response.data[ApiKeys.data][ApiKeys.result]
          [ApiKeys.data][ApiKeys.message]);
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
