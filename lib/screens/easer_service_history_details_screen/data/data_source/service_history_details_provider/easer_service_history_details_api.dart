// abstract easer service history Details api call
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../shared_models/service_reservation_details_model.dart';

abstract class EaserServiceHistoryDetailsApi {
  Future<ApiResponse<ServiceReservationDetailsModel>> getServiceHistoryDetails({
    required String id,
  });
}
