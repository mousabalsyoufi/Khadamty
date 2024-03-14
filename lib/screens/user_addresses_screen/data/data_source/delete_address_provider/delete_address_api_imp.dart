import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import 'delete_address_api.dart';

// Delete Address api call implementation
class DeleteAddressApiImp extends BaseApiProvider implements DeleteAddressApi {
  @override
  Future<ApiResponse<String>> deleteAddress({required String id}) async {
    ApiResponse<String>? result;
    Response? response;
    try {
      response = await client.delete(
        '${Urls.deleteAddress}/$id',
        options: await getRequestWithToken(),
      );
      result =
          ApiResponse.completed(response.data[ApiKeys.data][ApiKeys.result][ApiKeys.message]);
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
