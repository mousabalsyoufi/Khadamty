import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../../../shared_models/service_reservation_details_model.dart';
import '../repository/easer_service_details_repository.dart';

// get Easer Service details useCase to link with instance from repository
class GetEaserServiceDetailsUseCase extends UseCase<
    ApiResponse<ServiceReservationDetailsModel>,
    EaserServiceDetailsUseCaseParams> {
  final EaserServiceDetailsRepository? _easerServiceDetailsRepository;

  GetEaserServiceDetailsUseCase(this._easerServiceDetailsRepository);

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>> call(
      EaserServiceDetailsUseCaseParams params) {
    return _easerServiceDetailsRepository!.getServiceDetails(
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
