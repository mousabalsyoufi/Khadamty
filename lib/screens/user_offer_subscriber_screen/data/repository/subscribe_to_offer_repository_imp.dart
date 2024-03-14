import 'package:faciltateur_de_vies/screens/user_offer_subscriber_screen/data/models/offer_subscribe_request_model.dart';
import 'package:faciltateur_de_vies/core/api_handler/response_handler.dart';
import 'package:dartz/dartz.dart';

import '../../../../constants/enums/response_enum.dart';
import '../../domain/repository/subscribe_to_offer_repository.dart';
import '../datasource/subscribe_to_offer_provider/subscribe_to_offer_api_imp.dart';

// implementation Subscribe To Offer repository
class SubscribeToOfferRepositoryImp implements SubscribeToOfferRepository {
  final SubscribeToOfferApiImp _subscribeToOfferApiImp;

  SubscribeToOfferRepositoryImp(this._subscribeToOfferApiImp);

  @override
  Future<Either<dynamic, ApiResponse<int>>> subscribeToOffer({required OfferSubscribeRequestModel subscribeModel}) async {
   ApiResponse<int> result;
    try {
      result = await _subscribeToOfferApiImp.subscribeToOffer(
          subscribeModel: subscribeModel);
      if (result.status == Status.completed) {
        return Right(result);
      } else {
        return Left(result);
      }
    } catch (error) {
      return Left(error);
    }
  }
}
