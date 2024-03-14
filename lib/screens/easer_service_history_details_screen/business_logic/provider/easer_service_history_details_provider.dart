import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../domain/usecase/get_easer_service_history_details_usecase.dart';

class EaserServiceHistoryDetailsProvider extends BaseProvider {
  final GetEaserServiceHistoryDetailsUseCase
      _getEaserServiceHistoryDetailsUseCase;

  EaserServiceHistoryDetailsProvider(
      this._getEaserServiceHistoryDetailsUseCase);

  ServiceReservationDetailsModel? _serviceDetails;
  ServiceReservationDetailsModel? get serviceDetails => _serviceDetails;

  // get easer service history details function to handle upcoming service details
  getServiceHistoryDetails({
    required String id,
  }) async {
    setLoading = true;
    updateUi();
    var serviceDetailsResult = await _getEaserServiceHistoryDetailsUseCase(
        EaserServiceDetailsUseCaseParams(
      id: id,
    ));
    return serviceDetailsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _serviceDetails = response.data!;
      updateUi();
    });
  }
}
