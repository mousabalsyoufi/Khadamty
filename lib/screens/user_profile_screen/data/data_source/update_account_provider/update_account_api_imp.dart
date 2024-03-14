import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/core/models/response.model.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/data_source/update_account_provider/update_account_api.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// update account api call implementation
class UpdateAccountApiImp extends BaseApiProvider implements UpdateAccountApi {
  @override
  Future<ApiResponse<SuccessResponseModel>> updateAccount({required AccountModel accountModel,required int id}) async {
    ApiResponse<SuccessResponseModel>? result;
    Response? response;
    try {

      Options options = await getRequestWithToken();

      var data = accountModel.toMap();
      response = await client.put(
        Urls.updateAccount(id),
        data: data,
        options: options,
      );

      result = ApiResponse.completed(SuccessResponseModel.fromJson(response.data));

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
