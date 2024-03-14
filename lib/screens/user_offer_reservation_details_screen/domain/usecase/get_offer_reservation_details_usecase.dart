import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../../../shared_models/service_reservation_details_model.dart';
import '../repository/user_offer_reservation_details_repository.dart';

// get upcoming offer details useCase to link with instance from repository
class GetOfferReservationDetailsUseCase extends UseCase<
    ApiResponse<ServiceReservationDetailsModel>,
    GetOfferReservationDetailsUseCaseParams> {
  final UserOfferReservationDetailsRepository?
      _userOfferReservationDetailsRepository;

  GetOfferReservationDetailsUseCase(
      this._userOfferReservationDetailsRepository);

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>> call(
      GetOfferReservationDetailsUseCaseParams params) {
    return _userOfferReservationDetailsRepository!.getUpcomingOfferDetails(
      id: params.id,
    );
  }
}

class GetOfferReservationDetailsUseCaseParams {
  final String id;
  GetOfferReservationDetailsUseCaseParams({
    required this.id,
  });
}
