import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/user_profile_screen/data/models/account_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/get_easer_account_usecase.dart';

class EaserPersonalDataProvider extends BaseProvider {
  final GetEaserAccountUseCase _getAccountUseCase;

  EaserPersonalDataProvider(
    this._getAccountUseCase,
  );

  AccountModel? account;

  getAccount() async {
    setLoading = true;
    updateUi();
    var getAccountResult = await _getAccountUseCase(NoParams());
    return getAccountResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      account = response.data!;
      updateUi();
    });
  }
}
