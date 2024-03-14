import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/repository/subscribe_to_service_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// save service useCase to link with instance from repository
class SaveServiceUseCase
    extends UseCase<ApiResponse<int>, SaveServiceUseCaseParams> {
  final SubscribeToServiceRepository? _subscribeToServiceRepository;

  SaveServiceUseCase(this._subscribeToServiceRepository);

  @override
  Future<Either<dynamic, ApiResponse<int>>> call(
      SaveServiceUseCaseParams params) {
    return _subscribeToServiceRepository!.saveService(
      subscribeModel: params.subscribeRequestModel,
      serviceId: params.serviceId,
    );
  }
}

class SaveServiceUseCaseParams {
  final ServiceSubscribeRequestModel subscribeRequestModel;
  final int serviceId;
  SaveServiceUseCaseParams({
    required this.subscribeRequestModel,
    required this.serviceId,
  });
}
