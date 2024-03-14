import 'package:dartz/dartz.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';
import '../../data/models/offer_subscribe_request_model.dart';
import '../repository/subscribe_to_offer_repository.dart';

// subscribe to offer useCase to link with instance from repository
class SubscribeToOfferUseCase
    extends UseCase<ApiResponse<int>, SubscribeToOfferUseCaseParams> {
  final SubscribeToOfferRepository? _subscribeToOfferRepository;

  SubscribeToOfferUseCase(this._subscribeToOfferRepository);

  @override
  Future<Either<dynamic, ApiResponse<int>>> call(
      SubscribeToOfferUseCaseParams params) {
    return _subscribeToOfferRepository!.subscribeToOffer(
      subscribeModel: params.subscribeRequestModel,
    );
  }
}

class SubscribeToOfferUseCaseParams {
  final OfferSubscribeRequestModel subscribeRequestModel;
  SubscribeToOfferUseCaseParams({
    required this.subscribeRequestModel,
  });
}
