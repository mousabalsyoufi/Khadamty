
// abstract Subscribe to offer api call

import '../../../../../core/api_handler/response_handler.dart';
import '../../models/offer_subscribe_request_model.dart';

abstract class SubscribeToOfferApi {
  Future<ApiResponse<int>> subscribeToOffer({
    required OfferSubscribeRequestModel subscribeModel,
  });
}
