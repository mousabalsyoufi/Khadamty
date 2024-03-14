import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/data/model/service_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_subscribe_to_service_process/domain/repository/subscribe_to_service_repository.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// subscribe to service with subscription useCase to link with instance from repository
class SubscribeWithSubscriptionUseCase
    extends UseCase<ApiResponse<int>, SubscribeWithSubscriptionUseCaseParams> {
  final SubscribeToServiceRepository? _subscribeToServiceRepository;

  SubscribeWithSubscriptionUseCase(this._subscribeToServiceRepository);

  @override
  Future<Either<dynamic, ApiResponse<int>>> call(
      SubscribeWithSubscriptionUseCaseParams params) {
    return _subscribeToServiceRepository!.subscribeWithSubscription(
      subscribeModel: params.subscribeRequestModel,
    );
  }
}

class SubscribeWithSubscriptionUseCaseParams {
  final ServiceSubscribeRequestModel subscribeRequestModel;
  SubscribeWithSubscriptionUseCaseParams({
    required this.subscribeRequestModel,
  });
}
