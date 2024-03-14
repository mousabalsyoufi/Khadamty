import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/delete_account_provider/delete_account_api.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// Delete account api call implementation
class DeleteAccountApiImp extends BaseApiProvider implements DeleteAccountApi {
  @override
  Future<ApiResponse<String>> deleteAccount({required String id}) async {
    ApiResponse<String>? result;
    Response? response;
    try {
      // specify status 0 to indicate that the account will be disabled
      final params = {
        'status': 0,
      };
      response = await client.put(
        '${Urls.changeUserAccountStatus}/$id',
        options: await getRequestWithToken(),
        data: params,
      );
      result = ApiResponse.completed(
          response.data[ApiKeys.data][ApiKeys.result][ApiKeys.message]);
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
