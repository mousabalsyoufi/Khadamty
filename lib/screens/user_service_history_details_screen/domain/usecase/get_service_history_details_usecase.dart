import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../../../shared_models/service_reservation_details_model.dart';
import '../repository/service_history_details_repository.dart';

// get service history details useCase to link with instance from repository
class GetServiceHistoryDetailsUseCase extends UseCase<
    ApiResponse<ServiceReservationDetailsModel>,
    GetServiceHistoryDetailsUseCaseParams> {
  final ServiceHistoryDetailsRepository? _serviceHistoryDetailsRepository;

  GetServiceHistoryDetailsUseCase(this._serviceHistoryDetailsRepository);

  @override
  Future<Either<dynamic, ApiResponse<ServiceReservationDetailsModel>>> call(
      GetServiceHistoryDetailsUseCaseParams params) {
    return _serviceHistoryDetailsRepository!.getServiceHistoryDetails(
      id: params.id,
    );
  }
}

class GetServiceHistoryDetailsUseCaseParams {
  final String id;
  GetServiceHistoryDetailsUseCaseParams({
    required this.id,
  });
}
