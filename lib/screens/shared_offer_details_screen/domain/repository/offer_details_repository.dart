import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';

import '../../../../core/api_handler/response_handler.dart';

// abstract class for offer details Repository
abstract class OfferDeatilsRepository {
  Future<Either<dynamic, ApiResponse<List<OfferDetailsModel>>>> getOfferDetails(
      {required String id});
}
