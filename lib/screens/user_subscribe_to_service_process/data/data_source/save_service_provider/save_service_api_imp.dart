import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/data_source/save_service_provider/save_service_api.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// Save service api call implementation
class SaveServiceApiImp extends BaseApiProvider implements SaveServiceApi {
  @override
  Future<ApiResponse<int>> saveService(
      {required ServiceSubscribeRequestModel subscribeModel,
      required int serviceId}) async {
    ApiResponse<int>? result;
    Response? response;
    try {
      final bodyParams = subscribeModel.toMap();
      response = await client.post(
        Urls.saveServiceDB,
        options: await getRequestWithToken(),
        data: bodyParams,
      );
      result = ApiResponse.completed(serviceId);
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
