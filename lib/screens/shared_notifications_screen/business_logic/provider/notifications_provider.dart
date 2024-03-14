import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/shared_notifications_screen/data/model/notifications_respnse_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/get_notifications_usecase.dart';

class NotificationsProvider extends BaseProvider {
  final GetNotificationsUseCase _getNotificationsUseCase;
  NotificationsProvider(this._getNotificationsUseCase);

  List<NotificationsResponseModel> notifications = [];

  // get notifications function to handle categories and change state
  getNotifications() async {
    setLoading = true;
    updateUi();
    var categoriesResult = await _getNotificationsUseCase(NoParams());
    categoriesResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      notifications = response.data!;
      updateUi();
    });
  }
}
