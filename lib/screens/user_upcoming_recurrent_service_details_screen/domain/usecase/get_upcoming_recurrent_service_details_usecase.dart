import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../../../shared_models/service_reservation_details_model.dart';
import '../repository/user_upcoming_recurrent_service_details_repository.dart';

// get upcoming service details useCase to link with instance from repository
class GetUpcomingRecurrentServiceDetailsUseCase extends UseCase<
    ApiResponse<ServiceReservationDetailsModel>,
    GetUpcomingServiceDetailsUseCaseParams> {
  final UserUpcomingRecurrentServiceDetailsRepository?
      _userUpcomingRecurrentServiceDetailsRepository;

  GetUpcomingRecurrentServiceDetailsUseCase(
      this._userUpcomingRecurrentServiceDetailsRepository);

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>> call(
      GetUpcomingServiceDetailsUseCaseParams params) {
    return _userUpcomingRecurrentServiceDetailsRepository!
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
