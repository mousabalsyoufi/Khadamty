import 'package:dartz/dartz.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../shared_models/service_reservation_details_model.dart';

// abstract class for User Upcoming one time Service details Repository
abstract class UserUpcomingOneTimeServiceDetailsRepository {
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getUpcomingServiceDetails({
    required String id,
  });
}
