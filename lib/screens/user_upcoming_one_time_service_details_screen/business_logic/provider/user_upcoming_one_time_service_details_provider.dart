import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/screens/user_upcoming_one_time_service_details_screen/domain/usecase/get_upcoming_service_details_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/service_reservation_details_model.dart';

import '../../../../core/base_provider/base_provider.dart';

class UserUpcomingOneTimeServiceDetailsProvider extends BaseProvider {
  final GetUpcomingServiceDetailsUseCase _getUpcomingServiceDetailsUseCase;


  UserUpcomingOneTimeServiceDetailsProvider(
      this._getUpcomingServiceDetailsUseCase);

  ServiceReservationDetailsModel? _upcomingService ;
  ServiceReservationDetailsModel? get upcomingService => _upcomingService;
  // get upcoming service details function to handle upcoming service details
  getUpcomingServiceDetails({
    required String id,
  }) async {
    setLoading = true;
    updateUi();
    var serviceDetqailsResult = await _getUpcomingServiceDetailsUseCase(
        GetUpcomingServiceDetailsUseCaseParams(
      id: id,
    ));
    return serviceDetqailsResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _upcomingService = response.data!;
      updateUi();
    });
  }
}
