import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/data_source/subscribe_to_service_provider/subscribe_to_service_api.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/data_source/subscribe_with_subscription_provider/subscribe_with_subscription_api.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// Subscribe to service with subscription api call implementation
class SubscribeWithSubscriptionApiImp extends BaseApiProvider
    implements SubscribeWithSubscriptionApi {
  @override
  Future<ApiResponse<int>> subscribeWithSubscription(
      {required ServiceSubscribeRequestModel subscribeModel}) async {
    ApiResponse<int>? result;
    Response? response;
    try {
      final params = subscribeModel.toMap();
      response = await client.post(
        Urls.subscribeToServiceWithSubscription,
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
