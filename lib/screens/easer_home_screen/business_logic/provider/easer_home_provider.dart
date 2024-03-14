import 'package:faciltateur_de_vies/screens/user_bookings_screen/data/model/upcoming_orders_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/ger_easer_upcoming_services_usecase.dart';

class EaserHomeProvider extends BaseProvider {
  EaserHomeProvider(this._getEaserUpcomingServicesUseCase);

  final GetEaserUpcomingServicesUseCase _getEaserUpcomingServicesUseCase;

  List<UpcomingOrdersModel> upcomingOrdersList = [];

  bool _upcomingLoading = false;
  bool get upcomingLoading => _upcomingLoading;

  // get the upcoming orders for easer for specific day
  getUpcomingServices({required DateTime date}) async {
    _upcomingLoading = true;
    updateUi();
    var upcomingResult = await _getEaserUpcomingServicesUseCase(
        UpcomingServicesUseCaseParams(date: date));
    return upcomingResult.fold((error) {
      setError = true;
      _upcomingLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      _upcomingLoading = false;

      upcomingOrdersList = response.data!;

      updateUi();
    });
  }
}
