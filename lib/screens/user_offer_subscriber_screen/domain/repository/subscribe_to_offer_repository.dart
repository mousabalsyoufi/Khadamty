import 'package:dartz/dartz.dart';
import '../../../../core/api_handler/response_handler.dart';
import '../../data/models/offer_subscribe_request_model.dart';

// abstract class for Subscribe To Offer Repository
abstract class SubscribeToOfferRepository {
  Future<Either<dynamic, ApiResponse<int>>> subscribeToOffer({
    required OfferSubscribeRequestModel subscribeModel,
  });
}
