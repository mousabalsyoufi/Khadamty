import 'package:faciltateur_de_vies/constants/enums/user_type.dart';
import 'package:faciltateur_de_vies/core/local_storage/storage_manager.dart';
import 'package:faciltateur_de_vies/core/utility/utility.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../domain/usecase/login_usecase.dart';

class LoginProvider extends BaseProvider {
  final LoginUseCase _loginUseCase;

  LoginProvider(this._loginUseCase);
  // login function to handle login and change state depended on return
  Future<bool> login(
      {required String username, required String password}) async {
    setLoading = true;
    updateUi();
    var loginResult = await _loginUseCase(
        LoginUseCaseParams(username: username, password: password));
    return loginResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return false;
    }, (response) {
      setLoading = false;
      int subscriptionType = response.data!.subscriptionType;
      StorageManager.setUserToken(response.data!.token);
      StorageManager.setUserUrssaf(response.data!.urssafMember);
      StorageManager.setUserId(response.data!.userId);
      StorageManager.setUserSocId(response.data!.socid);
      StorageManager.setUserPhoto(response.data!.photo);
      StorageManager.setEmail(response.data!.email);
      StorageManager.setFullName(response.data!.fullName);
      StorageManager.setUserAddresses(
          AddressModel.toJsonList(response.data!.addresses.skip(1).toList()));
      if (int.tryParse(response.data!.socid) == 0) {
        StorageManager.setUserType(UserType.easer);
      } else {
        if (subscriptionType != -1) {
          StorageManager.setUserType(UserType.subscribedUser);
          StorageManager.setUserSubscription(subscriptionType);
        } else {
          StorageManager.setUserType(UserType.user);
        }
      }
      StorageManager.setUserLoggedIn();
      return true;
    });
  }
}
