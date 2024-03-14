import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/datasource/subscribe_to_offer_provider/subscribe_to_offer_api.dart';
import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/models/offer_subscribe_request_model.dart';
import '../../../../../core/api_handler/urls.dart';
import '../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../core/api_handler/response_handler.dart';

// Subscribe to offer api call implementation
class SubscribeToOfferApiImp extends BaseApiProvider
    implements SubscribeToOfferApi {
  @override
  Future<ApiResponse<int>> subscribeToOffer(
      {required OfferSubscribeRequestModel subscribeModel}) async {
    ApiResponse<int>? result;
    Response? response;
    try {
      final params = subscribeModel.toMap();
      response = await client.post(
        Urls.subscribeToOffer,
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
