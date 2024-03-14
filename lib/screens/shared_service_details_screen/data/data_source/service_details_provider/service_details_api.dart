import 'package:faciltateur_de_vies/screens/shared_service_details_screen/data/models/service_details_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get service details api call
abstract class ServiceDetailsApi {
  Future<ApiResponse<ServiceDetailsModel>> getServiceDetails({required String id});
}
