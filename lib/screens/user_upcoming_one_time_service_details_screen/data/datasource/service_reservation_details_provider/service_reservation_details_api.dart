// abstract Service Reservation Details api call
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../shared_models/service_reservation_details_model.dart';

abstract class ServiceReserationDetailsApi {
  Future<ApiResponse<ServiceReservationDetailsModel>> getServiceReservationDetails({
    required String id,
  });
}
