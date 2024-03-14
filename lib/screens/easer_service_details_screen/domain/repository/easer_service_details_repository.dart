import 'package:dartz/dartz.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../shared_models/service_reservation_details_model.dart';

// abstract class for Easer Service details Repository
abstract class EaserServiceDetailsRepository {
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getServiceDetails({
    required String id,
  });
}
