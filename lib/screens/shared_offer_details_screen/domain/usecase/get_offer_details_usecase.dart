// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:dartz/dartz.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/model/offer_details_model.dart';
import 'package:faciltateur_de_vies/screens/shared_offer_details_screen/data/repository/offer_details_repository_imp.dart';

import '../../../../core/api_handler/response_handler.dart';
import '../../../../core/generic_usecase/usecase.dart';

// get offer details useCase to link with instance from repository
class GetOfferDetailsUseCase
    extends UseCase<ApiResponse<List<OfferDetailsModel>>, OfferDetailsParams> {
  final OfferDetailsRepositoryImp? _offerDetailsRepositoryImp;

  GetOfferDetailsUseCase(this._offerDetailsRepositoryImp);

  @override
  Future<Either<dynamic, ApiResponse<List<OfferDetailsModel>>>> call(
      OfferDetailsParams params) {
    return _offerDetailsRepositoryImp!.getOfferDetails(id: params.id);
  }
}

class OfferDetailsParams {
  String id;
  OfferDetailsParams({required this.id});
}
