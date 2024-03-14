import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../../../shared_models/service_reservation_details_model.dart';
import '../repository/easer_service_history_details_repository.dart';

// get Easer Service history details useCase to link with instance from repository
class GetEaserServiceHistoryDetailsUseCase extends UseCase<
    ApiResponse<ServiceReservationDetailsModel>,
    EaserServiceDetailsUseCaseParams> {
  final EaserServiceHistoryDetailsRepository? _easerServiceHistoryDetailsRepository;

  GetEaserServiceHistoryDetailsUseCase(this._easerServiceHistoryDetailsRepository);

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>> call(
      EaserServiceDetailsUseCaseParams params) {
    return _easerServiceHistoryDetailsRepository!.getServiceHistoryDetails(
      id: params.id,
    );
  }
}

class EaserServiceDetailsUseCaseParams {
  final String id;
  EaserServiceDetailsUseCaseParams({
    required this.id,
  });
}
