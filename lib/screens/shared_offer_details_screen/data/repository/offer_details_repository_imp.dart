import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/constants/enums/response_enum.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/data_source/offer_details_provider/offer_details_api_imp.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/domain/repository/offer_details_repository.dart';
import '../../../../core/api_handler/response_handler.dart';

// implementation offer details repository
class OfferDetailsRepositoryImp implements OfferDeatilsRepository {
  final OfferDetailsApiImp _offerDetailsApiImp;

  OfferDetailsRepositoryImp(this._offerDetailsApiImp);


  @override
  Future<Either<dynamic, ApiResponse<List<OfferDetailsModel>>>> getOfferDetails({required String id}) async {
     ApiResponse<List<OfferDetailsModel>> result;
    try {
      result = await _offerDetailsApiImp.getOfferDdetails(id: id);
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
