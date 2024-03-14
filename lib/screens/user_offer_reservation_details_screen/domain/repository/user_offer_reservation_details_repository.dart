import 'package:dartz/dartz.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../shared_models/service_reservation_details_model.dart';

// abstract class for User Upcoming Offer details Repository
abstract class UserOfferReservationDetailsRepository {
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getUpcomingOfferDetails({
    required String id,
  });
}
