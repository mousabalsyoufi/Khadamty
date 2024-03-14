import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/repository/subscribe_to_service_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// subscribe to service useCase to link with instance from repository
class SubscribeToServiceUseCase
    extends UseCase<ApiResponse<int>, SubscribeToServiceUseCaseParams> {
  final SubscribeToServiceRepository? _subscribeToServiceRepository;

  SubscribeToServiceUseCase(this._subscribeToServiceRepository);

  @override
  Future<Either<dynamic, ApiResponse<int>>> call(
      SubscribeToServiceUseCaseParams params) {
    return _subscribeToServiceRepository!.subscribeToService(
      subscribeModel: params.subscribeRequestModel,
    );
  }
}

class SubscribeToServiceUseCaseParams {
  final ServiceSubscribeRequestModel subscribeRequestModel;
  SubscribeToServiceUseCaseParams({
    required this.subscribeRequestModel,
  });
}
