import 'package:faciltateur_de_vies/constants/enums/app_subscribtions.dart';
import 'package:faciltateur_de_vies/core/base_provider/base_provider.dart';

class UserRecurrentSubscriptionActivationProvider extends BaseProvider {
  // app subscribtion for recurrent service
  AppSubscribtion? _appSubscribtion;
  AppSubscribtion? get appSubscribtion => _appSubscribtion;

  // set the app subscribtion
  void setAppSubscribtion(AppSubscribtion subscribtion) {
    _appSubscribtion = subscribtion;
    updateUi();
  }
}
