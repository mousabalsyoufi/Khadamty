import 'package:faciltateur_de_vies/screens/user_add_address_screen/data/model/address_request_model.dart';
import 'package:faciltateur_de_vies/screens/user_add_address_screen/domain/usecase/add_address_usecase.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/utility/utility.dart';

class AddAddressProvider extends BaseProvider {
  final AddAddressUseCase _addAddressUseCase;

  AddAddressProvider(this._addAddressUseCase);

  Future<int> addAddress({required AddressRequestModel addressModel}) async {
    setLoading = true;
    updateUi();
    var addressResult = await _addAddressUseCase(
        AddAddressUseCaseParams(addressModel: addressModel));
    return addressResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
      return 0;
    }, (response) {
      setLoading = false;
      updateUi();
      Utility.showToast(message: response.message!);
      return response.data!;
    });
  }
}
