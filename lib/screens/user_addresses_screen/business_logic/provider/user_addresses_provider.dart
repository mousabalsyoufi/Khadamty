import 'package:faciltateur_de_vies/core/generic_usecase/usecase.dart';
import 'package:faciltateur_de_vies/screens/user_addresses_screen/domain/usecase/delete_address_usecase.dart';
import 'package:faciltateur_de_vies/shared_models/address_model.dart';

import '../../../../core/base_provider/base_provider.dart';
import '../../../../core/local_storage/storage_manager.dart';
import '../../../../core/utility/utility.dart';
import '../../domain/usecase/get_user_addresses_usecase.dart';

class UserAddressesProvider extends BaseProvider {
  final GetUserAddressesUseCase _getUserAddressesUseCase;
  final DeleteAddressUseCase _deleteAddressUseCase;
  UserAddressesProvider(
      this._getUserAddressesUseCase, this._deleteAddressUseCase);

  List<AddressModel> _addresses = [];
  List<AddressModel> get addresses => _addresses;

  // get addresses function to handle addresses and change state depended on return
  getAddresses() async {
    setLoading = true;
    setError = false;
    updateUi();
    var addressesResult = await _getUserAddressesUseCase(NoParams());
    addressesResult.fold((error) {
      setError = true;
      setLoading = false;
      Utility.showToast(message: error.message);
      updateUi();
    }, (response) {
      setLoading = false;
      _addresses = response.data!.skip(1).toList();
      StorageManager.setUserAddresses(
          AddressModel.toJsonList(response.data!.skip(1).toList()));
      updateUi();
    });
  }

  removeAddress(int index) {
    _addresses.removeAt(index);
    StorageManager.setUserAddresses(
          AddressModel.toJsonList(_addresses));
    updateUi();
  }

  // delete address function to delete user address on confirm
  Future<String> deleteAddress({required String id}) async {
    setError = false;
    updateUi();
    var deleteAddressResult =
        await _deleteAddressUseCase(DeleteAddressUseCaseParams(id: id));
    return deleteAddressResult.fold((error) {
      setError = true;
      Utility.showToast(message: error.message);
      updateUi();
      return '';
    }, (response) {
      return response.data!;
    });
  }
}
