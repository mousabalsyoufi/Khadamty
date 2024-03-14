// abstract offer Reservation Details api call
import '../../../../../core/api_handler/response_handler.dart';
import '../../../../../shared_models/service_reservation_details_model.dart';

abstract class OfferReserationDetailsApi {
  Future<ApiResponse<ServiceReservationDetailsModel>> getOfferReservationDetails({
    required String id,
  });
}
