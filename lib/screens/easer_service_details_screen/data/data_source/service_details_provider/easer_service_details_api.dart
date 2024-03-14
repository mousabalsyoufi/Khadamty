// abstract easer service Details api call
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../shared_models/service_reservation_details_model.dart';

abstract class EaserServiceDetailsApi {
  Future<ApiResponse<ServiceReservationDetailsModel>>
      getServiceDetails({
    required String id,
  });
}
