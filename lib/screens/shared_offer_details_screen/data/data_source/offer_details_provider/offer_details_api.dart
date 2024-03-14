
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';

import '../../../../../core/api_handler/response_handler.dart';

// abstract get offer details api call
abstract class OfferDetailsApi {
  Future<ApiResponse<List<OfferDetailsModel>>> getOfferDdetails(
      {required String id});
}
