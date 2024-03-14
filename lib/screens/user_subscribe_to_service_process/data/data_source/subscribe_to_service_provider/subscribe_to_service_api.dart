// abstract Subscribe to service api call
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

abstract class SubscribeToServiceApi {
  Future<ApiResponse<int>> subscribeToService({
    required ServiceSubscribeRequestModel subscribeModel,
  });
}
