import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../domain/usecase/get_easer_service_details_usecase.dart';

class EaserServiceDetailsProvider extends BaseProvider {
  final GetEaserServiceDetailsUseCase _getEaserServiceDetailsUseCase;

  EaserServiceDetailsProvider(this._getEaserServiceDetailsUseCase);

  ServiceReservationDetailsModel? _serviceDetails;
  ServiceReservationDetailsModel? get serviceDetails => _serviceDetails;

  // get easer service details function to handle upcoming service details
  getServiceDetails({
    required String id,
  }) async {
    setLoading = true;
    updateUi();
    var serviceDetailsResult =
        await _getEaserServiceDetailsUseCase(EaserServiceDetailsUseCaseParams(
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
