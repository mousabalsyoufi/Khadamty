import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/domain/repository/user_upcoming_one_time_service_details_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../../../shared_models/service_reservation_details_model.dart';

// get upcoming service details useCase to link with instance from repository
class GetUpcomingServiceDetailsUseCase extends UseCase<
    ApiResponse<ServiceReservationDetailsModel>,
    GetUpcomingServiceDetailsUseCaseParams> {
  final UserUpcomingOneTimeServiceDetailsRepository?
      _userUpcomingOneTimeServiceDetailsRepository;

  GetUpcomingServiceDetailsUseCase(
      this._userUpcomingOneTimeServiceDetailsRepository);

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>> call(
      GetUpcomingServiceDetailsUseCaseParams params) {
    return _userUpcomingOneTimeServiceDetailsRepository!
        .getUpcomingServiceDetails(
      id: params.id,
    );
  }
}

class GetUpcomingServiceDetailsUseCaseParams {
  final String id;
  GetUpcomingServiceDetailsUseCaseParams({
    required this.id,
  });
}
