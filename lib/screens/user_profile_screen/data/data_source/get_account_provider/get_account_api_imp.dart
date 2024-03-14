import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/get_account_provider/get_account_api.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import '../../../../../constants/api_keys/api_keys.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// GET account api call implementation
class GetAccountApiImp extends BaseApiProvider implements GetAccountApi {
  @override
  Future<ApiResponse<AccountModel>> getAccount() async {
    ApiResponse<AccountModel>? result;
    Response? response;
    try {

      Options options = await getRequestWithToken();
      response = await client.get(
        Urls.getAccount,
        options: options,
      );
      result = ApiResponse.completed(AccountModel.fromJson(response.data[ApiKeys.data][ApiKeys.result]));

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
