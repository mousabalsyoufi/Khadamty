import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../domain/usecase/get_offer_reservation_details_usecase.dart';

class UserOfferReservationDetailsProvider extends BaseProvider {
  final GetOfferReservationDetailsUseCase _getOfferReservationDetailsUseCase;

  UserOfferReservationDetailsProvider(this._getOfferReservationDetailsUseCase);

  ServiceReservationDetailsModel? _upcomingOffer;
  ServiceReservationDetailsModel? get upcomingOffer => _upcomingOffer;

  // get upcoming offer details function to handle upcoming service details
  getUpcomingOfferDetails({
    required String id,
  }) async {
    setLoading = true;
    updateUi();
    var serviceDetailsResult = await _getOfferReservationDetailsUseCase(
        GetOfferReservationDetailsUseCaseParams(
      id: id,
    ));
    return serviceDetailsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _upcomingOffer = response.data!;
      updateUi();
    });
  }
}
