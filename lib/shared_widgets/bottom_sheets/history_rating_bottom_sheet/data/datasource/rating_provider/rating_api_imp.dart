import 'package:dio/dio.dart';
import 'package:faciltateur_de_vies/constants/api_keys/api_keys.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/datasource/rating_provider/rating_api.dart';
import 'package:faciltateur_de_vies/shared_widgets/bottom_sheets/history_rating_bottom_sheet/data/model/rating_request_model.dart';

import '../../../../../../core/api_handler/base_api_provider.dart';
import '../../../../../../core/api_handler/generic_exceptions.dart';
import '../../../../../../core/api_handler/response_handler.dart';
import '../../../../../../core/api_handler/urls.dart';

// rating service api call implementation
class RatingApiImp extends BaseApiProvider implements RatingApi {
  @override
  Future<ApiResponse<String>> rateService(
      {required RatingRequestModel requestModel}) async {
    ApiResponse<String>? result;
    Response? response;
    try {
      final params = {'ratingOps': requestModel.toMap()};
      response = await client.post(
        Urls.serviceRating(requestModel.orderId, requestModel.serviceId),
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
