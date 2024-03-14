import 'package:dartz/dartz.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../shared_models/service_reservation_details_model.dart';

// abstract class for User Upcoming recurrent Service details Repository
abstract class UserUpcomingRecurrentServiceDetailsRepository {
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getUpcomingServiceDetails({
    required String id,
  });
}
