import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/data/datasource/service_reservation_details_provider/service_reservation_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/domain/repository/user_upcoming_one_time_service_details_repository.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';
import '../../../../constants/enums/response_enum.dart';
import '../../../../core/api_handler/response_handler.dart';

// implementation User Upcoming One Time Service Details repository
class UserUpcomingOneTimeServiceDetailsRepositoryImp
    implements UserUpcomingOneTimeServiceDetailsRepository {
  final ServiceReservationDetailsApiImp serviceReservationDetailsApiImp;

  UserUpcomingOneTimeServiceDetailsRepositoryImp({
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
