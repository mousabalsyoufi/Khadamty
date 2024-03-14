// abstract rating service api call

import '../../../../../../core/api_handler/response_handler.dart';
import '../../model/rating_request_model.dart';

abstract class RatingApi {
  Future<ApiResponse<String>> rateService({
    required RatingRequestModel requestModel,
  });
}
