import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../domain/usecase/get_service_history_details_usecase.dart';

class UserServiceHistoryDetailsProvider extends BaseProvider {
  final GetServiceHistoryDetailsUseCase _getServiceHistoryDetailsUseCase;

  UserServiceHistoryDetailsProvider(this._getServiceHistoryDetailsUseCase);

  ServiceReservationDetailsModel? _serviceHistory;
  ServiceReservationDetailsModel? get serviceHistory => _serviceHistory;

  // get service history details function to handle upcoming service details
  getServiceHistoryDetails({
    required String id,
  }) async {
    setLoading = true;
    updateUi();
    var serviceDetqailsResult = await _getServiceHistoryDetailsUseCase(
        GetServiceHistoryDetailsUseCaseParams(
      id: id,
    ));
    return serviceDetqailsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _serviceHistory = response.data!;
      updateUi();
    });
  }
}
