import 'package:dartz/dartz.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../../../shared_models/service_reservation_details_model.dart';

// abstract class for User service history details Repository
abstract class ServiceHistoryDetailsRepository {
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getServiceHistoryDetails({
    required String id,
  });
}
