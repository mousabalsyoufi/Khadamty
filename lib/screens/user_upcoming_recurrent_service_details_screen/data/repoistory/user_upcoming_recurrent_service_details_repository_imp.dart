import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import '../../../../constants/enums/response_enum.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../domain/repository/user_upcoming_recurrent_service_details_repository.dart';
import '../data_source/recurrent_service_reservation_details_provider/recurrent_service_reservation_details_api_imp.dart';

// implementation User Upcoming Recurrent Service Details repository
class UserUpcomingRecurrentServiceDetailsRepositoryImp
    implements UserUpcomingRecurrentServiceDetailsRepository {
  final RecurrentServiceReservationDetailsApiImp serviceReservationDetailsApiImp;

  UserUpcomingRecurrentServiceDetailsRepositoryImp({
    required this.serviceReservationDetailsApiImp,
  });

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>>
      getUpcomingServiceDetails({required String id}) async {
    ApiResponse<ServiceReservationDetailsModel> result;
    try {
      result =
          await serviceReservationDetailsApiImp.getServiceReservationDetails(
        id: id,
      );
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
