import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';
import 'add_address_api.dart';

// Add Address api call implementation
class AddAddressApiImp extends BaseApiProvider implements AddAddressApi {
  @override
  Future<ApiResponse<int>> addAddress(
      {required AddressRequestModel addressModel}) async {
    ApiResponse<int>? result;
    Response? response;
    try {
      final params = addressModel.toMap();
      response = await client.post(
        Urls.addAddress,
        options: await getRequestWithToken(),
        data: params,
      );
      result =
          ApiResponse.completed(response.data[ApiKeys.data][ApiKeys.result]);
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
